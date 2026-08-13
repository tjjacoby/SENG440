#!/usr/bin/env python3
"""
script.py <c_file> [opt_level]

opt_level is 0, 2, or 3 (default 3). It maps to exactly the three
gcc invocations you're using:

    0 -> gcc -Wall -Wextra -O0             -mcpu=cortex-a7 -I. <file> -o <bin> -lm -lrt
    2 -> gcc -Wall -Wextra -O2             -mcpu=cortex-a7 -I. <file> -o <bin> -lm -lrt
    3 -> gcc -Wall -Wextra -O3 -marm       -mcpu=cortex-a7 -I. <file> -o <bin> -lm -lrt

For the given C file, this:
  1. Creates a folder named after the C file (reuses it if it already exists).
  2. Compiles the binary at the requested optimization level.
  3. Generates the matching assembly listing (.s).
  4. Runs the binary NUM_RUNS times and writes every run's CSV data
     row into a single combined .csv file in that folder, plus a
     final "median" row with the median elapsed_ns and ns_per_sample.
"""

import argparse
import statistics
import subprocess
import sys
from pathlib import Path

NUM_RUNS = 10  # how many times to execute the binary per benchmark

OPT_FLAGS = {
    0: ["-O0"],
    2: ["-O2"],
    3: ["-O3", "-marm"],
}


def run_checked(cmd):
    result = subprocess.run(cmd, capture_output=True, text=True)
    if result.returncode != 0:
        sys.exit(f"Command failed: {' '.join(cmd)}\n{result.stderr}")
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("c_file", help="Path to the .c source file")
    parser.add_argument(
        "opt_level",
        type=int,
        nargs="?",
        default=3,
        choices=[0, 2, 3],
        help="Optimization level: 0, 2, or 3 (default 3, includes -marm)",
    )
    args = parser.parse_args()

    c_path = Path(args.c_file).resolve()
    if not c_path.is_file():
        sys.exit(f"Error: '{c_path}' does not exist.")
    if c_path.suffix != ".c":
        sys.exit(f"Error: '{c_path}' is not a .c file.")

    stem = c_path.stem
    out_dir = Path(stem)
    out_dir.mkdir(exist_ok=True)

    tag = f"O{args.opt_level}" + ("marm" if args.opt_level == 3 else "")
    binary_path = out_dir / f"{stem}_{tag}"
    asm_path = out_dir / f"{stem}_{tag}.s"
    csv_path = out_dir / f"{stem}_{tag}.csv"

    common_flags = ["-Wall", "-Wextra", *OPT_FLAGS[args.opt_level], "-mcpu=cortex-a7", "-I."]

    compile_cmd = ["gcc", *common_flags, str(c_path), "-o", str(binary_path), "-lm", "-lrt"]
    print("Compiling:", " ".join(compile_cmd))
    run_checked(compile_cmd)

    asm_cmd = ["gcc", *common_flags, "-S", "-fverbose-asm", str(c_path), "-o", str(asm_path)]
    print("Generating assembly:", " ".join(asm_cmd))
    run_checked(asm_cmd)

    print(f"Running {binary_path.name} {NUM_RUNS} times...")
    header = None
    rows = []
    for run_index in range(1, NUM_RUNS + 1):
        result = subprocess.run([str(binary_path)], capture_output=True, text=True)
        if result.returncode != 0:
            sys.exit(f"Run {run_index} failed:\n{result.stderr}")
        lines = result.stdout.strip().splitlines()
        if len(lines) != 2:
            sys.exit(f"Error: unexpected output on run {run_index}:\n{result.stdout}")
        if header is None:
            header = lines[0]
        rows.append(lines[1])

    # header: samples,elapsed_ns,ns_per_sample,time,input,output
    elapsed_values = [int(row.split(",")[1]) for row in rows]
    ns_per_sample_values = [float(row.split(",")[2]) for row in rows]
    median_elapsed = statistics.median(elapsed_values)
    median_ns_per_sample = statistics.median(ns_per_sample_values)
    median_row = f"median,{median_elapsed},{median_ns_per_sample:.3f},,,"

    csv_path.write_text(header + "\n" + "\n".join(rows) + "\n" + median_row + "\n")

    print("Done.")
    print(f"  Binary:   {binary_path}")
    print(f"  Assembly: {asm_path}")
    print(f"  CSV:      {csv_path}  ({NUM_RUNS} runs)")
    print(f"  Median elapsed_ns:    {median_elapsed}")
    print(f"  Median ns_per_sample: {median_ns_per_sample:.3f}")


if __name__ == "__main__":
    main()