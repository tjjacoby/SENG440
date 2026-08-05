#include <stdio.h>
#include <stdint.h>
#include <time.h>
#include <math.h>
#include <cmsis_compiler.h>

#define N 200000
#define SAMPLE_RATE 10000.0
#define PI 3.14159265358979323846
#define INPUT_AMPLITUDE 0.80
#define INPUT_FREQUENCY_HZ 100


static const int b0 = 1105;
static const int b1 = 2210;
static const int b2 = 1105;
static const int a1 = 18727;
static const int a2 = -6763;


static uint64_t elapsed_nanoseconds(
    const struct timespec *start,
    const struct timespec *end)
{
    int64_t seconds = (int64_t)end->tv_sec - (int64_t)start->tv_sec;
    int64_t nanoseconds = (int64_t)end->tv_nsec - (int64_t)start->tv_nsec;

    return (uint64_t)(seconds * 1000000000LL + nanoseconds);
}


static int run_IIR(const int *x, int sample_count)
{
    int x1 = 0;
    int x2 = 0;
    int y1 = 0;
    int y2 = 0;

    int temp1, temp2, temp3, temp4;
    for (int n = 0; n < sample_count; n++) {
      
        // int y = (
        //     b0 * x[n] +
        //     b1 * x1 +
        //     b2 * x2 +
        //     a1 * y1 +
        //     a2 * y2
        // ) >> 14;

        temp1 = b0 * x[n];
        temp2 = b1 * x1;
        temp3 = b2 * x2;
        temp4 = a1 * y1;


        int y = __QADD(temp1, temp2);
        y = __QADD(y, temp3);
        y = __QADD(y, temp4);
        y = __QADD(y, a2 * y2);
        y = y >> 14;

        x2 = x1;
        x1 = x[n];

        y2 = y1;
        y1 = y;
    }
    return y1;
}



int main(void)
{
    int x[N];

  
    /* Generate a single test tone selected by INPUT_FREQUENCY_HZ. */
    for (int n = 0; n < N; n++) {
        double time = (double)n / SAMPLE_RATE;

        double input = INPUT_AMPLITUDE * sin(
            2.0 * PI * (double)INPUT_FREQUENCY_HZ * time
        );

        x[n] = (int)(input * (1 << 14));
    }

    struct timespec start;
    struct timespec end;

    if (clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start) != 0) {
        perror("Unable to start benchmark timer");
        return 1;
    }

    volatile int y = run_IIR(x, N);

    if (clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end) != 0) {
        perror("Unable to stop benchmark timer");
        return 1;
    }

    uint64_t elapsed_ns = elapsed_nanoseconds(&start, &end);
    double ns_per_sample = (double)elapsed_ns / (double)N;
    double final_time = (double)(N - 1) / SAMPLE_RATE;

    printf(
        "samples,elapsed_ns,ns_per_sample,time,input,output\n"
        "%d,%llu,%.3f,%.6f,%.6f,%.6f\n",
        N,
        (unsigned long long)elapsed_ns,
        ns_per_sample,
        final_time,
        (double)x[N - 1] / (1 << 14),
        (double)y / (1 << 14)
    );

    return 0;
}
