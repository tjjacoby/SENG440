#ifndef SENG440_CMSIS_COMPILER_H
#define SENG440_CMSIS_COMPILER_H

/*
 * Minimal CMSIS-compatible intrinsic used by this project.
 *
 * The full CMSIS compiler header is not installed on the ARM VM. This
 * definition follows the CMSIS __QADD interface and emits the AArch32 QADD
 * instruction directly. It intentionally provides only the intrinsic needed
 * by the filter.
 */

#include <stdint.h>

#if !defined(__arm__) && !defined(__thumb__)
#error "__QADD requires an AArch32 target"
#endif

__attribute__((always_inline)) static inline int32_t
__QADD(int32_t first, int32_t second)
{
    int32_t result;

    __asm__ volatile (
        "qadd %0, %1, %2"
        : "=r" (result)
        : "r" (first), "r" (second)
        : "cc"
    );

    return result;
}

#endif
