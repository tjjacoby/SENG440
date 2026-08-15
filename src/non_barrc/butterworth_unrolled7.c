#include <stdio.h>
#include <stdint.h>
#include <time.h>
#include <math.h>

#define N 200000
#define SAMPLE_RATE 10000.0
#define PI 3.14159265358979323846
#define INPUT_AMPLITUDE 0.80
#define INPUT_FREQUENCY_HZ 100

static const int b02_1 = 1105;
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
    register int x1 = 0;
    register int x2 = 0;
    register int y1 = 0;
    register int y2 = 0;

    register int i = 0;
    for (i = 0; i + 6 < sample_count; i += 7) {
        /* Sample 0: x[i]. */
        register int input0 = x[i];
        register int y = ((b02_1 * input0) + ((b02_1 << 1) * x1));
        y = ((y) + (b02_1 * x2));
        y = ((y) + (a1 * y1));
        y = ((y) + (a2 * y2));
        y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);

        x2 = x1;
        x1 = input0;
        y2 = y1;
        y1 = y;

        /* Sample 1: x[i + 1]. */
        register int input1 = x[i + 1];
        y = ((b02_1 * input1) + ((b02_1 << 1) * x1));
        y = ((y) + (b02_1 * x2));
        y = ((y) + (a1 * y1));
        y = ((y) + (a2 * y2));
        y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);

        x2 = x1;
        x1 = input1;
        y2 = y1;
        y1 = y;

        /* Sample 2: x[i + 2]. */
        register int input2 = x[i + 2];
        y = ((b02_1 * input2) + ((b02_1 << 1) * x1));
        y = ((y) + (b02_1 * x2));
        y = ((y) + (a1 * y1));
        y = ((y) + (a2 * y2));
        y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);

        x2 = x1;
        x1 = input2;
        y2 = y1;
        y1 = y;

        /* Sample 3: x[i + 3]. */
        register int input3 = x[i + 3];
        y = ((b02_1 * input3) + ((b02_1 << 1) * x1));
        y = ((y) + (b02_1 * x2));
        y = ((y) + (a1 * y1));
        y = ((y) + (a2 * y2));
        y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);

        x2 = x1;
        x1 = input3;
        y2 = y1;
        y1 = y;

        /* Sample 4: x[i + 4]. */
        register int input4 = x[i + 4];
        y = ((b02_1 * input4) + ((b02_1 << 1) * x1));
        y = ((y) + (b02_1 * x2));
        y = ((y) + (a1 * y1));
        y = ((y) + (a2 * y2));
        y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);

        x2 = x1;
        x1 = input4;
        y2 = y1;
        y1 = y;

        /* Sample 5: x[i + 5]. */
        register int input5 = x[i + 5];
        y = ((b02_1 * input5) + ((b02_1 << 1) * x1));
        y = ((y) + (b02_1 * x2));
        y = ((y) + (a1 * y1));
        y = ((y) + (a2 * y2));
        y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);

        x2 = x1;
        x1 = input5;
        y2 = y1;
        y1 = y;

        /* Sample 6: x[i + 6]. */
        register int input6 = x[i + 6];
        y = ((b02_1 * input6) + ((b02_1 << 1) * x1));
        y = ((y) + (b02_1 * x2));
        y = ((y) + (a1 * y1));
        y = ((y) + (a2 * y2));
        y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);

        x2 = x1;
        x1 = input6;
        y2 = y1;
        y1 = y;
    }

    /* Process the remaining zero to 6 samples. */
    for (; i < sample_count; i++) {
        register int current_input = x[i];
        register int y = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
        y = ((y) + (b02_1 * x2));
        y = ((y) + (a1 * y1));
        y = ((y) + (a2 * y2));
        y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);

        x2 = x1;
        x1 = current_input;
        y2 = y1;
        y1 = y;
    }

    return y1;
}

int main(void)
{
    int x[N];

    for (int n = 0; n < N; n++) {
        double time = (double)n / SAMPLE_RATE;
        double input = INPUT_AMPLITUDE * sin(
            2.0 * PI * (double)INPUT_FREQUENCY_HZ * time
        );

        x[n] = (int)(input * (1 << 14));
    }

    struct timespec start;
    struct timespec end;

    if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) {
        perror("Unable to start benchmark timer");
        return 1;
    }

    volatile int y = run_IIR(x, N);

    if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) {
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