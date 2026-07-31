#include <stdio.h>
#include <math.h>

#define N 2000
#define SAMPLE_RATE 10000.0
#define PI 3.14159265358979323846

static const int b0 = 1105;
static const int b1 = 2210;
static const int b2 = 1105;
static const int a1 = 18727;
static const int a2 = -6763;

int main()
{
    int x[N];

    int x1_fixed = 0;
    int x2_fixed = 0;
    int y1_fixed = 0;
    int y2_fixed = 0;

    /*
     * Input containing:
     * 100 Hz, 500 Hz, 1000 Hz, 2000 Hz and 4000 Hz.
     *
     * The amplitudes add to less than 1.0 to avoid input overflow.
     */
    for (int n = 0; n < N; n++) {
        double time = (double)n / SAMPLE_RATE;

        double input =
            0.20 * sin(2.0 * PI * 100.0  * time) +
            0.20 * sin(2.0 * PI * 500.0  * time) +
            0.15 * sin(2.0 * PI * 1000.0 * time) +
            0.10 * sin(2.0 * PI * 2000.0 * time) +
            0.10 * sin(2.0 * PI * 4000.0 * time);

        x[n] = (int)(input * (1 << 14));
    }

    printf("time,input,output\n");

    for (int n = 0; n < N; n++) {
        int y_fixed = (
            b0 * x[n] +
            b1 * x1_fixed +
            b2 * x2_fixed +
            a1 * y1_fixed +
            a2 * y2_fixed
        ) >> 14;

        double time = (double)n / SAMPLE_RATE;

        printf(
            "%.6f,%.6f,%.6f\n",
            time,
            (double)x[n] / (1 << 14),
            (double)y_fixed / (1 << 14)
        );

        x2_fixed = x1_fixed;
        x1_fixed = x[n];

        y2_fixed = y1_fixed;
        y1_fixed = y_fixed;
    }

    return 0;
}