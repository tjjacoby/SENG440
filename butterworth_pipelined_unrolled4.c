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

static inline int run_IIR(const int *x, int sample_count)
{
    if (sample_count <= 0) {
        return 0;
    }

    register int x1 = 0;
    register int y1 = 0;
    register int y2 = 0;

    /* Pipeline prologue: prepare sample zero. */
    register int current_input = x[0];
    register int current_feedforward = ((b02_1 * current_input) + ((b02_1 << 1) * x1));
    current_feedforward = ((current_feedforward) + (0));

    register int i = 0;
    for (i = 0; i + 4 < sample_count; i += 4) {
        /* Pipeline stage 0: prepare i + 1 and complete i. */
        {
            register int next_input = x[i + 1];
            register int next_feedforward = ((b02_1 * next_input) + ((b02_1 << 1) * current_input));
            next_feedforward = ((next_feedforward) + (b02_1 * x1));

            register int y = ((current_feedforward) + (a1 * y1));
            y = ((y) + (a2 * y2));
            y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);

            x1 = current_input;
            current_input = next_input;
            y2 = y1;
            y1 = y;
            current_feedforward = next_feedforward;
        }

        /* Pipeline stage 1: prepare i + 2 and complete i + 1. */
        {
            register int next_input = x[i + 2];
            register int next_feedforward = ((b02_1 * next_input) + ((b02_1 << 1) * current_input));
            next_feedforward = ((next_feedforward) + (b02_1 * x1));

            register int y = ((current_feedforward) + (a1 * y1));
            y = ((y) + (a2 * y2));
            y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);

            x1 = current_input;
            current_input = next_input;
            y2 = y1;
            y1 = y;
            current_feedforward = next_feedforward;
        }

        /* Pipeline stage 2: prepare i + 3 and complete i + 2. */
        {
            register int next_input = x[i + 3];
            register int next_feedforward = ((b02_1 * next_input) + ((b02_1 << 1) * current_input));
            next_feedforward = ((next_feedforward) + (b02_1 * x1));

            register int y = ((current_feedforward) + (a1 * y1));
            y = ((y) + (a2 * y2));
            y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);

            x1 = current_input;
            current_input = next_input;
            y2 = y1;
            y1 = y;
            current_feedforward = next_feedforward;
        }

        /* Pipeline stage 3: prepare i + 4 and complete i + 3. */
        {
            register int next_input = x[i + 4];
            register int next_feedforward = ((b02_1 * next_input) + ((b02_1 << 1) * current_input));
            next_feedforward = ((next_feedforward) + (b02_1 * x1));

            register int y = ((current_feedforward) + (a1 * y1));
            y = ((y) + (a2 * y2));
            y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);

            x1 = current_input;
            current_input = next_input;
            y2 = y1;
            y1 = y;
            current_feedforward = next_feedforward;
        }
    }

    /* Pipeline cleanup: prepare and complete any remaining samples. */
    for (; i + 1 < sample_count; i++) {
        register int next_input = x[i + 1];
        register int next_feedforward = ((b02_1 * next_input) + ((b02_1 << 1) * current_input));
        next_feedforward = ((next_feedforward) + (b02_1 * x1));

        register int y = ((current_feedforward) + (a1 * y1));
        y = ((y) + (a2 * y2));
        y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);

        x1 = current_input;
        current_input = next_input;
        y2 = y1;
        y1 = y;
        current_feedforward = next_feedforward;
    }

    /* Pipeline epilogue: complete the last prepared sample. */
    register int y = ((current_feedforward) + (a1 * y1));
    y = ((y) + (a2 * y2));
    y = (y >> 14) | ((y & ((1 << 14) - 1)) != 0);

    return y;
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