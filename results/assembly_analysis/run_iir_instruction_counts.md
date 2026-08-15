# `run_IIR` assembly instruction counts

These are **static instruction occurrences**, not dynamically executed instructions or cycle counts. `hot-loop body` is the first repeated region identified by a backward branch, counted once. `hot-loop control` counts instructions in that region that GCC's verbose assembly attributes to a C `for`/`while` header inside `run_IIR`. `loop back branches` independently counts backward branch edges; a value of two indicates a separate cleanup/remainder loop. `LDR family`/`STR family` include sized variants such as `ldrd`, `ldrb`, and `strd`; the exact `LDR`/`STR` columns exclude those variants.

At `-O0`, `run_IIR` is standalone; its source-attributed instructions are counted and the unannotated argument-save prologue is excluded. At optimized levels GCC inlined `run_IIR`; all filter-attributed instructions between the two benchmark clock calls are counted, even where GCC interleaves timer setup with tail code. Timing setup, CSV output, and sine generation are excluded.

## O0 Thumb

| program | all instr. | hot-loop body | hot-loop control | back branches | LDR | STR | hot LDR/STR | hot LDM/STM | load/store family | MUL | MAC | assembly lines |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| noOpt | 86 | 69 | 7 | 1 | 27 | 19 | 25/14 | 0/0 | 27/19 | 5 | 0 | 148-268 |
| smallOpts | 53 | 41 | 4 | 1 | 5 | 0 | 5/0 | 0/0 | 5/0 | 5 | 0 | 138-222 |
| pipelined | 79 | 40 | 5 | 1 | 6 | 0 | 3/0 | 0/0 | 6/0 | 9 | 0 | 138-270 |
| unrolled | 117 | 72 | 5 | 1 | 8 | 0 | 5/0 | 0/0 | 8/0 | 15 | 0 | 138-326 |
| unrolled2 | 155 | 75 | 5 | 2 | 11 | 0 | 5/0 | 0/0 | 11/0 | 19 | 0 | 138-390 |
| unrolled4 | 190 | 140 | 5 | 2 | 12 | 0 | 9/0 | 0/0 | 12/0 | 25 | 0 | 138-445 |
| unrolled5 | 224 | 174 | 5 | 2 | 14 | 0 | 11/0 | 0/0 | 14/0 | 30 | 0 | 138-499 |
| unrolled6 | 258 | 208 | 5 | 2 | 16 | 0 | 13/0 | 0/0 | 16/0 | 35 | 0 | 138-553 |
| unrolled7 | 292 | 242 | 5 | 2 | 18 | 0 | 15/0 | 0/0 | 18/0 | 40 | 0 | 138-607 |
| unrolled8 | 326 | 276 | 5 | 2 | 20 | 0 | 17/0 | 0/0 | 20/0 | 45 | 0 | 138-661 |
| unrolled10 | 394 | 344 | 5 | 2 | 24 | 0 | 21/0 | 0/0 | 24/0 | 55 | 0 | 138-769 |
| unrolled20 | 734 | 684 | 5 | 2 | 44 | 0 | 41/0 | 0/0 | 44/0 | 105 | 0 | 138-1309 |

## O2 Thumb

| program | all instr. | hot-loop body | hot-loop control | back branches | LDR | STR | hot LDR/STR | hot LDM/STM | load/store family | MUL | MAC | assembly lines |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| noOpt | 26 | 17 | 2 | 1 | 1 | 0 | 1/0 | 0/0 | 1/0 | 1 | 4 | 105-148 |
| smallOpts | 26 | 17 | 2 | 1 | 1 | 0 | 1/0 | 0/0 | 1/0 | 1 | 4 | 105-148 |
| pipelined | 36 | 17 | 2 | 1 | 3 | 0 | 1/0 | 0/0 | 3/0 | 2 | 6 | 109-182 |
| unrolled | 36 | 27 | 3 | 1 | 2 | 0 | 2/0 | 0/0 | 2/0 | 2 | 8 | 107-170 |
| unrolled2 | 58 | 26 | 2 | 1 | 5 | 1 | 2/0 | 0/0 | 5/1 | 4 | 13 | 107-221 |
| unrolled4 | 58 | 47 | 3 | 1 | 4 | 1 | 4/0 | 0/0 | 4/1 | 4 | 14 | 107-214 |
| unrolled5 | 68 | 58 | 4 | 1 | 4 | 2 | 4/0 | 0/0 | 5/2 | 5 | 17 | 108-231 |
| unrolled6 | 105 | 69 | 4 | 1 | 8 | 2 | 5/0 | 0/0 | 9/2 | 8 | 26 | 107-303 |
| unrolled7 | 123 | 86 | 4 | 2 | 5 | 2 | 4/1 | 0/0 | 9/3 | 8 | 27 | 108-323 |
| unrolled8 | 101 | 90 | 4 | 1 | 5 | 2 | 5/0 | 0/0 | 7/2 | 8 | 26 | 108-292 |
| unrolled10 | 123 | 112 | 4 | 1 | 7 | 2 | 7/0 | 0/0 | 9/2 | 10 | 32 | 108-333 |
| unrolled20 | 228 | 218 | 4 | 1 | 9 | 2 | 9/0 | 0/0 | 15/2 | 20 | 62 | 108-526 |

## O2 ARM

| program | all instr. | hot-loop body | hot-loop control | back branches | LDR | STR | hot LDR/STR | hot LDM/STM | load/store family | MUL | MAC | assembly lines |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| noOpt | 25 | 16 | 2 | 1 | 1 | 0 | 1/0 | 0/0 | 1/0 | 1 | 4 | 105-147 |
| smallOpts | 25 | 16 | 2 | 1 | 1 | 0 | 1/0 | 0/0 | 1/0 | 1 | 4 | 105-147 |
| pipelined | 32 | 17 | 2 | 1 | 2 | 0 | 1/0 | 0/0 | 2/0 | 2 | 6 | 105-166 |
| unrolled | 34 | 25 | 3 | 1 | 2 | 0 | 2/0 | 0/0 | 2/0 | 2 | 8 | 106-167 |
| unrolled2 | 57 | 24 | 2 | 1 | 5 | 1 | 2/0 | 0/0 | 5/1 | 4 | 13 | 104-211 |
| unrolled4 | 56 | 43 | 3 | 1 | 4 | 1 | 4/0 | 0/0 | 4/1 | 4 | 14 | 104-209 |
| unrolled5 | 66 | 54 | 4 | 1 | 6 | 2 | 6/0 | 0/0 | 6/2 | 5 | 17 | 104-229 |
| unrolled6 | 104 | 63 | 4 | 1 | 7 | 2 | 5/0 | 0/0 | 8/2 | 8 | 26 | 104-297 |
| unrolled7 | 121 | 81 | 4 | 2 | 12 | 4 | 8/1 | 0/0 | 13/4 | 8 | 27 | 106-324 |
| unrolled8 | 96 | 84 | 4 | 1 | 9 | 2 | 9/0 | 0/0 | 9/2 | 8 | 26 | 104-289 |
| unrolled10 | 114 | 102 | 4 | 1 | 5 | 2 | 5/0 | 2/0 | 5/2 | 10 | 32 | 104-323 |
| unrolled20 | 216 | 203 | 4 | 1 | 18 | 2 | 18/0 | 1/0 | 18/2 | 20 | 62 | 104-538 |

## O3 ARM

| program | all instr. | hot-loop body | hot-loop control | back branches | LDR | STR | hot LDR/STR | hot LDM/STM | load/store family | MUL | MAC | assembly lines |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| noOpt | 25 | 16 | 2 | 1 | 1 | 0 | 1/0 | 0/0 | 1/0 | 1 | 4 | 105-147 |
| smallOpts | 25 | 16 | 2 | 1 | 1 | 0 | 1/0 | 0/0 | 1/0 | 1 | 4 | 105-147 |
| pipelined | 32 | 17 | 2 | 1 | 2 | 0 | 1/0 | 0/0 | 2/0 | 2 | 6 | 105-166 |
| unrolled | 34 | 25 | 3 | 1 | 2 | 0 | 2/0 | 0/0 | 2/0 | 2 | 8 | 106-167 |
| unrolled2 | 57 | 24 | 2 | 1 | 5 | 1 | 2/0 | 0/0 | 5/1 | 4 | 13 | 104-211 |
| unrolled4 | 56 | 43 | 3 | 1 | 4 | 1 | 4/0 | 0/0 | 4/1 | 4 | 14 | 104-209 |
| unrolled5 | 66 | 54 | 4 | 1 | 6 | 2 | 6/0 | 0/0 | 6/2 | 5 | 17 | 104-229 |
| unrolled6 | 104 | 63 | 4 | 1 | 7 | 2 | 5/0 | 0/0 | 8/2 | 8 | 26 | 104-297 |
| unrolled7 | 130 | 73 | 4 | 1 | 11 | 2 | 6/0 | 0/0 | 12/2 | 10 | 32 | 104-353 |
| unrolled8 | 96 | 84 | 4 | 1 | 9 | 2 | 9/0 | 0/0 | 9/2 | 8 | 26 | 104-289 |
| unrolled10 | 114 | 102 | 4 | 1 | 5 | 2 | 5/0 | 2/0 | 5/2 | 10 | 32 | 104-323 |
| unrolled20 | 216 | 203 | 4 | 1 | 18 | 2 | 18/0 | 1/0 | 18/2 | 20 | 62 | 104-538 |
