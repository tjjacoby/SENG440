#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <limits.h>
#include <stdint.h>
#include <math.h>

//#define N 2000
#define SAMPLE_RATE 10000.0
#define PI 3.14159265358979323846

static const int b0 = 1105;
static const int b1 = 2210;
static const int b2 = 1105;
static const int a1 = 18727;
static const int a2 = -6763;

int main(int argc, char *argv[])
{
 

    int x1_fixed = 0;
    int x2_fixed = 0;
    int y1_fixed = 0;
    int y2_fixed = 0;

    // Take an input file, with the input signal. Need to scale input, and make it fixedpoint
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <input_file> <number_of_samples>\n", argv[0]);
        return 1;
    }

    errno = 0;
    char *end_pointer = NULL;
    long parsed_sample_count = strtol(argv[2], &end_pointer, 10);

    if (errno != 0 || end_pointer == argv[2] || *end_pointer != '\0' ||
        parsed_sample_count <= 0 || parsed_sample_count > INT_MAX) {
        fprintf(stderr, "Invalid number of samples: '%s'\n", argv[2]);
        return 1;
    }

    int N = (int)parsed_sample_count;
    if ((size_t)N > SIZE_MAX / sizeof(int)) {
        fprintf(stderr, "Sample count is too large for this system: %d\n", N);
        return 1;
    }

    int *x = malloc((size_t)N * sizeof(*x));
    if (!x) {
        fprintf(stderr, "Unable to allocate memory for %d samples\n", N);
        return 1;
    }

    FILE *input_file = fopen(argv[1], "r");
    if (!input_file) {
        perror("Error opening input file");
        free(x);
        return 1;
    }

    for (int n = 0; n < N; n++) {
        double input_sample;
        int read_result = fscanf(input_file, "%lf", &input_sample);

        if (read_result == EOF) {
            fprintf(stderr,
                    "Input file ended at sample %d; expected %d samples\n",
                    n, N);
            fclose(input_file);
            free(x);
            return 1;
        }
        if (read_result != 1) {
            fprintf(stderr, "Invalid input value at sample %d\n", n);
            fclose(input_file);
            free(x);
            return 1;
        }
        if (!isfinite(input_sample) || input_sample < -1.0 || input_sample > 1.0) {
            fprintf(stderr,
                    "Input sample %d is outside the allowed range [-1.0, 1.0]: %.8f\n",
                    n, input_sample);
            fclose(input_file);
            free(x);
            return 1;
        }

        x[n] = (int)lround(input_sample * (1 << 14));
    }

    fclose(input_file);
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

    free(x);
    return 0;
}
