#include <stdio.h>
#include <math.h>

#define N 2000
#define SAMPLE_RATE 10000.0
#define PI 3.14159265358979323846
#define INPUT_AMPLITUDE 0.80

/* Set this to 100 or 1000. It can also be overridden with gcc -D. */
#ifndef INPUT_FREQUENCY_HZ
#define INPUT_FREQUENCY_HZ 100
#endif

#if INPUT_FREQUENCY_HZ != 100 && INPUT_FREQUENCY_HZ != 1000
#error "INPUT_FREQUENCY_HZ must be 100 or 1000"
#endif

static const int b0 = 1105;
static const int b1 = 2210;
static const int b2 = 1105;
static const int a1 = 18727;
static const int a2 = -6763;


static int run_IIR(const int *x, int sample_count)
{
    int x1 = 0;
    int x2 = 0;
    int y1 = 0;
    int y2 = 0;

    for (int n = 0; n < sample_count; n++) {
      
        int y = (
            b0 * x[n] +
            b1 * x1 +
            b2 * x2 +
            a1 * y1 +
            a2 * y2
        ) >> 14;

        x2 = x1;
        x1 = x[n];

        y2 = y1;
        y1 = y;
    }
    return y1;
}



int main()
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

    printf("time,input,output\n");
    int y = run_IIR(x, N);
    
    double time = (double)N / SAMPLE_RATE;

    printf(
        "%.6f,%.6f,%.6f\n",
        time,
        (double)x[N - 1] / (1 << 14),
        (double)y / (1 << 14)
    );

    return 0;
}
