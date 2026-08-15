# Compiler comparison for `run_IIR`

## Scope and counting method

This analysis covers all 48 assembly files in `benchmark_results_O0`,
`benchmark_results_O2`, `benchmark_results_O2marm`, and
`benchmark_results_O3marm`.

The tables count only the filter implementation:

- In the 12 `-O0` files, `run_IIR` is a standalone function. Instructions with
  source annotations inside `run_IIR` are counted; the unannotated argument-save
  prologue is excluded.
- In all 36 optimized files, GCC completely inlines `run_IIR` into `main`.
  Filter-attributed instructions between the two `clock_gettime` calls are
  counted. Input generation, timing code, the volatile result store, and CSV
  printing are excluded.
- A **hot-loop body** is the static assembly from the primary loop label through
  its backward branch, counted once. It is not a dynamic instruction count or a
  cycle count.
- A **loop-control instruction** is an instruction GCC attributes to the C loop
  header, normally the pointer/counter update, comparison, and backward branch.
  A post-indexed load can combine the input load and pointer update, so some
  loops need only `cmp` plus `bne`.
- `LDR-family` means mnemonics beginning with `ldr`, so one `ldrd` counts as one
  instruction even though it transfers two words. `STR-family` is analogous.
  `ldm`/`stm` are reported separately because they do not begin with `ldr`/`str`
  and can transfer several registers.

The complete whole-filter exact counts and assembly line ranges are in
`run_iir_instruction_counts.md`. Per-loop counts, including cleanup loops, are
in `run_iir_loop_counts.csv`.

## Hot-loop results for every assembly file

Each cell is:

`hot-loop instructions / loop-control instructions / LDR-family / STR-family`

| Program | O0 Thumb | O2 Thumb | O2 ARM | O3 ARM |
| --- | ---: | ---: | ---: | ---: |
| `noOpt` | 69 / 7 / 25 / 14 | 17 / 2 / 1 / 0 | 16 / 2 / 1 / 0 | 16 / 2 / 1 / 0 |
| `smallOpts` | 41 / 4 / 5 / 0 | 17 / 2 / 1 / 0 | 16 / 2 / 1 / 0 | 16 / 2 / 1 / 0 |
| `pipelined` | 40 / 5 / 3 / 0 | 17 / 2 / 1 / 0 | 17 / 2 / 1 / 0 | 17 / 2 / 1 / 0 |
| `unrolled` | 72 / 5 / 5 / 0 | 27 / 3 / 2 / 0 | 25 / 3 / 2 / 0 | 25 / 3 / 2 / 0 |
| `unrolled2` | 75 / 5 / 5 / 0 | 26 / 2 / 2 / 0 | 24 / 2 / 2 / 0 | 24 / 2 / 2 / 0 |
| `unrolled4` | 140 / 5 / 9 / 0 | 47 / 3 / 4 / 0 | 43 / 3 / 4 / 0 | 43 / 3 / 4 / 0 |
| `unrolled5` | 174 / 5 / 11 / 0 | 58 / 4 / 5 / 0 | 54 / 4 / 6 / 0 | 54 / 4 / 6 / 0 |
| `unrolled6` | 208 / 5 / 13 / 0 | 69 / 4 / 6 / 0 | 63 / 4 / 6 / 0 | 63 / 4 / 6 / 0 |
| `unrolled7` | 242 / 5 / 15 / 0 | 86 / 4 / 7 / 1 | 81 / 4 / 9 / 1 | 73 / 4 / 7 / 0 |
| `unrolled8` | 276 / 5 / 17 / 0 | 90 / 4 / 7 / 0 | 84 / 4 / 9 / 0 | 84 / 4 / 9 / 0 |
| `unrolled10` | 344 / 5 / 21 / 0 | 112 / 4 / 9 / 0 | 102 / 4 / 5 / 0¹ | 102 / 4 / 5 / 0¹ |
| `unrolled20` | 684 / 5 / 41 / 0 | 218 / 4 / 15 / 0 | 203 / 4 / 18 / 0² | 203 / 4 / 18 / 0² |

¹ The ARM ten-way loop also has two `ldm` instructions, each loading three
registers. ² The ARM twenty-way loop also has one three-register `ldm`.

`unrolled2` is the result name used by `script.py`, but its source is
`butterworth_pipelined2.c`; it is not a clean duplicate of the ordinary
two-way-unrolled implementation.

## What each compiler setting changed

### `-O0` (default Thumb)

The compiler translates the C very literally. The clearest example is
`noOpt_O0.s`: its hot loop has 25 loads and 14 stores for every sample. State,
temporary products, the loop index, and the loop bound repeatedly move between
registers and the 48-byte stack frame. Its primary loop is at assembly lines
164-259.

The manual refactoring is therefore very visible at `-O0`. `smallOpts` reduces
the loop from 69 to 41 instructions and removes all steady-loop stores;
`pipelined` similarly has a 40-instruction loop. The unrolled source files have
large static bodies, but their five control instructions run only once per
group. At this level the compiler does not form `mla`; the products use separate
`mul` and `add` instructions.

### `-O2` (default Thumb-2)

GCC performs the important transformations automatically:

- It inlines `run_IIR` into `main`, removing the call and standalone function
  overhead.
- It keeps `x1`, `x2`, `y1`, and `y2` in registers and removes the C temporary
  variables.
- It hoists filter coefficients out of the loop.
- It replaces integer indexing with pointer/end-pointer induction. In the
  baseline, `ldr r10, [r1, #4]!` both loads the next input and advances the
  pointer.
- It turns the five multiply/add terms into one `mul` followed by four `mla`
  instructions.
- It implements Von Neumann rounding without a branch using `ubfx`, `it ne`,
  `movne`, and `orr ... asr #14`.

As a result, `noOpt` and `smallOpts` become instruction-for-instruction
identical: a 17-instruction loop with one input load and no store. Manual small
temporary-variable refactoring no longer changes the optimized machine code.

Unrolling reduces the control overhead per output. For example, `unrolled4`
uses three control instructions per four samples, while factors 5-20 use four
control instructions per group. Some Thumb loops use `ldrd`, so their raw
LDR-family count is smaller than the number of input words transferred.

### `-O2 -marm`

The algorithmic optimizations are the same as `-O2`, but the instruction set
changes from Thumb-2 to 32-bit ARM state. ARM instructions can be conditionally
executed directly, so each rounding step uses `movne` without a separate Thumb
`it` instruction. That changes the baseline from 17 to 16 instructions, the
four-way loop from 47 to 43, and the twenty-way loop from 218 to 203.

ARM mode also changes load selection. The ten-way implementation uses two
three-register `ldm` loads, and the twenty-way implementation uses one. This is
why a simple count of only lines spelling `ldr` understates the real number of
input words loaded. ARM's smaller static instruction count also does not imply
smaller code: each ARM instruction is four bytes, whereas Thumb-2 uses a mix of
16- and 32-bit encodings.

### `-O3 -marm`

For 11 of the 12 programs, the hot-loop mnemonic sequence is identical to the
`-O2 -marm` version. The IIR recurrence prevents ordinary SIMD/vectorization:
the next output needs earlier output state, so `-O3` cannot treat successive
samples as independent.

`unrolled7` is the one meaningful exception. At `-O2 -marm`, GCC spills an
input value in the repeated loop and later reloads it; the loop has 81
instructions, nine LDR-family instructions, and one STR. At `-O3 -marm`, better
allocation removes that recurring spill, leaving 73 instructions, seven
LDR-family instructions, and no STR. Because 200000 modulo 7 is 3, `-O3` also
straightens the three residual samples instead of retaining a remainder loop.
That makes the total static filter block slightly larger even though the
frequently executed loop is shorter. The measured median improves from about
11.588 ns/sample to 10.461 ns/sample, which is consistent with this change.

## Comments by source variant

| Variant | Compiler result |
| --- | --- |
| `noOpt` | Worst at `-O0` because almost every state operation hits the stack. At `-O2`, it becomes the same compact register loop as `smallOpts`. |
| `smallOpts` | Manual register-friendly refactoring matters at `-O0`; it provides no assembly difference from `noOpt` at optimized levels. |
| `pipelined` | Compact at `-O0`, but the optimized hot loop still handles one output per branch. In ARM mode a coefficient `movw` remains in the repeated loop, making it 17 rather than the baseline's 16 instructions. |
| `unrolled` | The ordinary two-way version amortizes one branch over two outputs: 25 ARM instructions per group, or 12.5 static hot-loop instructions per sample. |
| `unrolled2` | This is the pipelined/two-way source, not a pure second unrolling test. Its ARM loop is 24 instructions per two outputs. |
| `unrolled4` | Clean allocation: four input loads, no repeated store, and one back branch. It is a strong balance between overhead reduction and code size. |
| `unrolled5` | Still no repeated store, but the optimized loop reloads a saved loop-end value. The cost is amortized over five samples. |
| `unrolled6` | Similar allocation to factor five. Since 200000 modulo 6 is 2, optimized code includes a specialized two-sample tail outside the hot loop. |
| `unrolled7` | The register-pressure edge case: `-O2` spills inside the hot loop, while `-O3 -marm` eliminates the spill and straightens the three-sample tail. |
| `unrolled8` | No repeated store, but the load count includes a bound reload; Thumb also combines some input loads with `ldrd`. |
| `unrolled10` | One branch per ten samples. ARM uses two `ldm` instructions to load six of the input words, so its five `ldr` spellings are not the complete memory-transfer story. |
| `unrolled20` | Lowest loop-control overhead per sample, but the loop is 203 ARM instructions and GCC inserts a literal pool with a branch around it. This raises code-size and instruction-cache concerns even without state spills. |

## Lines worth inspecting

- `benchmark_results_O0/noOpt/noOpt_O0.s`, lines 138-269: standalone
  function and stack-heavy `-O0` code; lines 164-259 are the hot loop.
- `benchmark_results_O2/noOpt/noOpt_O2.s`, lines 120-148: optimized
  baseline showing post-indexed `ldr`, `mul`/`mla`, Thumb `it`, and the back
  branch.
- `benchmark_results_O2marm/noOpt/noOpt_O2marm.s`, lines 120-147: the same
  loop in ARM state without `it`.
- `benchmark_results_O2/unrolled4/unrolled4_O2.s`, lines 125-214, versus
  `benchmark_results_O2marm/unrolled4/unrolled4_O2marm.s`, lines 125-209:
  four Thumb `it` instructions account for most of the static difference.
- `benchmark_results_O2marm/unrolled7/unrolled7_O2marm.s`, lines 125-281,
  versus `benchmark_results_O3marm/unrolled7/unrolled7_O3marm.s`, lines
  125-266: the important spill/removal comparison.
- `benchmark_results_O2marm/unrolled10/unrolled10_O2marm.s`, especially the
  `ldm` instructions near lines 167 and 224.
- `benchmark_results_O2marm/unrolled20/unrolled20_O2marm.s`, lines 124-140
  for the branch-over literal pool and lines 140-538 for the hot loop.

## Interpretation cautions

Static assembly count is useful for explaining structure, but it is not cycle
count. Multiply latency, load-use latency, branch prediction, instruction-cache
behavior, dual issue, and alignment all affect execution time. For unrolled
programs, divide loop-control instructions by the unroll factor to compare
control overhead per sample. Also keep the cleanup path separate: 200000 is
divisible by 2, 4, 5, 8, 10, and 20, but leaves two samples for factor 6 and
three for factor 7.
