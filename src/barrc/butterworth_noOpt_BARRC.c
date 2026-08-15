/*
 * File: butterworth_noOpt_BARRC.c
 *
 * Purpose: Baseline fixed-point Butterworth IIR benchmark.
 *
 * Coding standard: Embedded C Coding Standard (BARR-C:2018), Barr Group.
 *
 * Project deviations:
 * - The requested filename retains mixed case and does not contain "main".
 * - This standalone benchmark exports no module interface, so an empty module
 *   header is not provided.
 */

#define _POSIX_C_SOURCE (199309L)

#include <inttypes.h>
#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define INPUT_SAMPLE_COUNT          (UINT32_C(200000))
#define SAMPLE_RATE_HZ              (10000.0)
#define PI_VALUE                    (3.14159265358979323846)
#define INPUT_AMPLITUDE             (0.80)
#define INPUT_FREQUENCY_HZ          (100.0)
#define FIXED_POINT_SCALE           (INT32_C(16384))
#define FILTER_FEEDFORWARD_OUTER    (INT32_C(1105))
#define FILTER_FEEDFORWARD_CENTER   (INT32_C(2210))
#define FILTER_FEEDBACK_RECENT      (INT32_C(18727))
#define FILTER_FEEDBACK_OLDER       (-INT32_C(6763))
#define ROUNDING_PARITY_DIVISOR     (INT32_C(2))
#define NANOSECONDS_PER_SECOND      (INT64_C(1000000000))

/*
 * Return the elapsed time between two CLOCK_MONOTONIC timestamps.
 */
static uint64_t
benchmark_elapsed_nanoseconds (struct timespec const * const p_start_time,
                               struct timespec const * const p_end_time)
{
    int64_t const elapsed_seconds =
        (int64_t)p_end_time->tv_sec - (int64_t)p_start_time->tv_sec;
    int64_t const elapsed_subseconds =
        (int64_t)p_end_time->tv_nsec - (int64_t)p_start_time->tv_nsec;

    return ((uint64_t)((elapsed_seconds * NANOSECONDS_PER_SECOND)
                      + elapsed_subseconds));
}

/*
 * Reduce a Q28 accumulator to Q14 using round-to-odd (von Neumann rounding).
 * Division and remainder are used to avoid bitwise operations on signed data.
 */
static inline int32_t
filter_round_to_odd (int32_t const accumulator)
{
    int32_t rounded_value = accumulator / FIXED_POINT_SCALE;
    int32_t const discarded_value = accumulator % FIXED_POINT_SCALE;

    if ((0 != discarded_value)
        && (0 == (rounded_value % ROUNDING_PARITY_DIVISOR)))
    {
        if (0 < accumulator)
        {
            rounded_value += 1;
        }
        else
        {
            rounded_value -= 1;
        }
    }

    return (rounded_value);
}

/*
 * Run the baseline direct-form IIR filter.
 *
 * The benchmark input and the stable filter state are bounded so every Q28
 * product sum remains representable by int32_t.
 */
static int32_t
filter_run_iir (int32_t const * const p_input_samples,
                uint32_t const sample_count)
{
    int32_t input_history_recent = 0;
    int32_t input_history_older = 0;
    int32_t output_history_recent = 0;
    int32_t output_history_older = 0;
    int32_t current_product = 0;
    int32_t recent_input_product = 0;
    int32_t older_input_product = 0;
    int32_t recent_output_product = 0;

    for (uint32_t sample_index = 0U;
         sample_index < sample_count;
         sample_index++)
    {
        int32_t accumulator = 0;
        int32_t current_output = 0;

        current_product =
            FILTER_FEEDFORWARD_OUTER * p_input_samples[sample_index];
        recent_input_product =
            FILTER_FEEDFORWARD_CENTER * input_history_recent;
        older_input_product =
            FILTER_FEEDFORWARD_OUTER * input_history_older;
        recent_output_product = FILTER_FEEDBACK_RECENT
                                * output_history_recent;

        accumulator = current_product + recent_input_product;
        accumulator += older_input_product;
        accumulator += recent_output_product;
        accumulator += FILTER_FEEDBACK_OLDER * output_history_older;
        current_output = filter_round_to_odd (accumulator);

        input_history_older = input_history_recent;
        input_history_recent = p_input_samples[sample_index];
        output_history_older = output_history_recent;
        output_history_recent = current_output;
    }

    return (output_history_recent);
}

/*
 * Generate the benchmark input, time the filter kernel, and print one CSV row.
 */
int
main (void)
{
    static int32_t input_samples[INPUT_SAMPLE_COUNT] = { 0 };
    struct timespec start_time = { 0 };
    struct timespec end_time = { 0 };
    int32_t volatile filter_output = 0;

    for (uint32_t sample_index = 0U;
         sample_index < INPUT_SAMPLE_COUNT;
         sample_index++)
    {
        double const sample_time_seconds =
            (double)sample_index / SAMPLE_RATE_HZ;
        double const input_value = INPUT_AMPLITUDE
            * sin ((2.0 * PI_VALUE * INPUT_FREQUENCY_HZ)
                   * sample_time_seconds);

        input_samples[sample_index] =
            (int32_t)(input_value * (double)FIXED_POINT_SCALE);
    }

    if (0 != clock_gettime (CLOCK_MONOTONIC, &start_time))
    {
        perror ("Unable to start benchmark timer");
        return (EXIT_FAILURE);
    }

    filter_output = filter_run_iir (input_samples, INPUT_SAMPLE_COUNT);

    if (0 != clock_gettime (CLOCK_MONOTONIC, &end_time))
    {
        perror ("Unable to stop benchmark timer");
        return (EXIT_FAILURE);
    }

    uint64_t const elapsed_nanoseconds =
        benchmark_elapsed_nanoseconds (&start_time, &end_time);
    double const nanoseconds_per_sample =
        (double)elapsed_nanoseconds / (double)INPUT_SAMPLE_COUNT;
    double const final_time_seconds =
        (double)(INPUT_SAMPLE_COUNT - 1U) / SAMPLE_RATE_HZ;

    if (0 > printf (
        "samples,elapsed_ns,ns_per_sample,time,input,output\n"
        "%" PRIu32 ",%" PRIu64 ",%.3f,%.6f,%.6f,%.6f\n",
        INPUT_SAMPLE_COUNT,
        elapsed_nanoseconds,
        nanoseconds_per_sample,
        final_time_seconds,
        (double)input_samples[INPUT_SAMPLE_COUNT - 1U]
            / (double)FIXED_POINT_SCALE,
        (double)filter_output / (double)FIXED_POINT_SCALE))
    {
        perror ("Unable to print benchmark result");
        return (EXIT_FAILURE);
    }

    return (EXIT_SUCCESS);
}
