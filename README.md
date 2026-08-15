# SENG 440 IIR Filter Optimization

This project compares Q14 fixed-point Butterworth IIR implementations on an
ARMv7 VM, including baseline, software-pipelined, and loop-unrolled versions.

- `src/non_barrc/` and `src/barrc/`: C implementations
- `scripts/`: benchmark and VM-transfer scripts
- `assembly/`: generated ARM assembly
- `results/`: timing summaries, raw timings, and instruction counts
- `tests/` and `graphs/`: test code and generated plots

Run one version on the ARM VM:

```bash
mkdir -p build
gcc -Wall -Wextra -O2 -marm -mcpu=cortex-a7 \
    src/non_barrc/butterworth_unrolled4.c -o build/filter -lm -lrt
./build/filter
```

Use the matching file under `src/barrc/` to build a BARR-C version.

To rerun all benchmarks without changing the archived script:

```bash
mkdir -p vm_run
cp src/non_barrc/*.c scripts/script.py vm_run/
cd vm_run && python3 script.py 4
```

Configuration `4` is `-O2 -marm` with ten runs per program. The main results
are in `results/benchmarks/*/benchmark_summary_*.csv`.

Regenerate the fixed-point comparison graphs (requires NumPy and Matplotlib):

```bash
python3 scripts/plotting/plot_fixedpoint_results.py \
    --fixed-dir results/filter_outputs/fixed_point \
    --float-dir results/filter_outputs/floating_point \
    --output-dir graphs/fixed_point
```

The original signal, floating-point, CSV, and assembly-analysis Python scripts
are under `scripts/plotting/` and `scripts/analyze_run_iir_assembly.py`.
