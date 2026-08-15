#!/usr/bin/env python3
"""Compile, disassemble, and benchmark every fixed-point filter variant.

Usage on the ARM VM:

    python3 script.py 4

Build configurations:

    0 -> gcc -Wall -Wextra -O0             -mcpu=cortex-a7 -I. ...
    2 -> gcc -Wall -Wextra -O2             -mcpu=cortex-a7 -I. ...
    3 -> gcc -Wall -Wextra -O3 -marm       -mcpu=cortex-a7 -I. ...
    4 -> gcc -Wall -Wextra -O2 -marm       -mcpu=cortex-a7 -I. ...

Configuration 4 is the default. Each executable is run ten times by default.
The script saves its executable, verbose assembly, raw timing CSV, and one
combined benchmark summary under benchmark_results_<configuration>/.
"""

from __future__ import annotations

import argparse
import csv
import statistics
import subprocess
import sys
from pathlib import Path


SCRIPT_DIR = Path(__file__).resolve().parent
DEFAULT_RUNS = 10

# logical benchmark name, source filename
# There is no butterworth_unrolled2.c in this repository. The existing
# pipeline-plus-two-way-unroll version is butterworth_pipelined2.c.
PROGRAMS = [
    ("noOpt", "butterworth_noOpt.c"),
    ("pipelined", "butterworth_pipelined.c"),
    ("smallOpts", "butterworth_smallOpts.c"),
    ("unrolled", "butterworth_unrolled.c"),
    ("unrolled2", "butterworth_pipelined2.c"),
    ("unrolled4", "butterworth_unrolled4.c"),
    ("unrolled5", "butterworth_unrolled5.c"),
    ("unrolled6", "butterworth_unrolled6.c"),
    ("unrolled7", "butterworth_unrolled7.c"),
    ("unrolled8", "butterworth_unrolled8.c"),
    ("unrolled10", "butterworth_unrolled10.c"),
    ("unrolled20", "butterworth_unrolled20.c"),
]

BUILD_CONFIGURATIONS = {
    0: {"tag": "O0", "flags": ["-O0"]},
    2: {"tag": "O2", "flags": ["-O2"]},
    3: {"tag": "O3marm", "flags": ["-O3", "-marm"]},
    4: {"tag": "O2marm", "flags": ["-O2", "-marm"]},
}

EXPECTED_HEADER = [
    "samples",
    "elapsed_ns",
    "ns_per_sample",
    "time",
    "input",
    "output",
]


def run_checked(command: list[str], description: str) -> subprocess.CompletedProcess[str]:
    """Run a command in the source directory or stop with a useful error."""
    result = subprocess.run(
        command,
        cwd=SCRIPT_DIR,
        capture_output=True,
        text=True,
    )
    if result.returncode != 0:
        sys.exit(
            f"{description} failed\n"
            f"Command: {' '.join(command)}\n"
            f"stdout:\n{result.stdout}\n"
            f"stderr:\n{result.stderr}"
        )
    return result


def parse_program_output(output: str, program_name: str, run_number: int) -> dict[str, str]:
    """Parse the two-line CSV emitted by each C benchmark."""
    lines = [line.strip() for line in output.splitlines() if line.strip()]
    if len(lines) != 2:
        sys.exit(
            f"{program_name} run {run_number} produced {len(lines)} non-empty "
            f"lines instead of two:\n{output}"
        )

    header = next(csv.reader([lines[0]]))
    values = next(csv.reader([lines[1]]))
    if header != EXPECTED_HEADER:
        sys.exit(
            f"{program_name} run {run_number} produced an unexpected header:\n"
            f"{lines[0]}"
        )
    if len(values) != len(header):
        sys.exit(
            f"{program_name} run {run_number} produced an invalid data row:\n"
            f"{lines[1]}"
        )
    return dict(zip(header, values))


def benchmark_program(
    logical_name: str,
    source_name: str,
    compiler: str,
    common_flags: list[str],
    tag: str,
    run_count: int,
    output_root: Path,
) -> dict[str, object]:
    source_path = SCRIPT_DIR / source_name
    program_directory = output_root / logical_name
    program_directory.mkdir(parents=True, exist_ok=True)

    binary_path = program_directory / f"{logical_name}_{tag}"
    assembly_path = program_directory / f"{logical_name}_{tag}.s"
    timing_path = program_directory / f"{logical_name}_{tag}_timings.csv"

    compile_command = [
        compiler,
        *common_flags,
        str(source_path),
        "-o",
        str(binary_path),
        "-lm",
        "-lrt",
    ]
    assembly_command = [
        compiler,
        *common_flags,
        "-S",
        "-fverbose-asm",
        str(source_path),
        "-o",
        str(assembly_path),
    ]

    print(f"\n[{logical_name}] {source_name}")
    print("  Compiling:          ", " ".join(compile_command))
    run_checked(compile_command, f"Compiling {source_name}")
    print("  Generating assembly:", " ".join(assembly_command))
    run_checked(assembly_command, f"Generating assembly for {source_name}")

    rows: list[dict[str, str]] = []
    print(f"  Running {run_count} times:", end="", flush=True)
    for run_number in range(1, run_count + 1):
        result = run_checked(
            [str(binary_path.resolve())],
            f"Running {logical_name}, iteration {run_number}",
        )
        row = parse_program_output(result.stdout, logical_name, run_number)
        rows.append(row)
        print(f" {run_number}", end="", flush=True)
    print()

    # A program must produce the same correctness fields on every run.
    correctness_fields = ("samples", "time", "input", "output")
    for field in correctness_fields:
        if len({row[field] for row in rows}) != 1:
            sys.exit(f"{logical_name} produced inconsistent {field} values")

    with timing_path.open("w", newline="", encoding="utf-8") as timing_file:
        writer = csv.writer(timing_file)
        writer.writerow(["run", *EXPECTED_HEADER])
        for run_number, row in enumerate(rows, start=1):
            writer.writerow([run_number, *(row[column] for column in EXPECTED_HEADER)])

    elapsed_values = [int(row["elapsed_ns"]) for row in rows]
    per_sample_values = [float(row["ns_per_sample"]) for row in rows]
    summary: dict[str, object] = {
        "program": logical_name,
        "source": source_name,
        "configuration": tag,
        "runs": run_count,
        "samples": rows[0]["samples"],
        "average_elapsed_ns": statistics.fmean(elapsed_values),
        "median_elapsed_ns": statistics.median(elapsed_values),
        "minimum_elapsed_ns": min(elapsed_values),
        "maximum_elapsed_ns": max(elapsed_values),
        "average_ns_per_sample": statistics.fmean(per_sample_values),
        "median_ns_per_sample": statistics.median(per_sample_values),
        "minimum_ns_per_sample": min(per_sample_values),
        "maximum_ns_per_sample": max(per_sample_values),
        "final_input": rows[0]["input"],
        "final_output": rows[0]["output"],
        "binary": str(binary_path),
        "assembly": str(assembly_path),
        "timings": str(timing_path),
    }

    print(
        f"  median={summary['median_ns_per_sample']:.3f} ns/sample, "
        f"average={summary['average_ns_per_sample']:.3f} ns/sample"
    )
    return summary


def write_summary(
    summary_path: Path,
    summaries: list[dict[str, object]],
    compiler_flags: list[str],
) -> None:
    columns = [
        "program",
        "source",
        "configuration",
        "compiler_flags",
        "runs",
        "samples",
        "average_elapsed_ns",
        "median_elapsed_ns",
        "minimum_elapsed_ns",
        "maximum_elapsed_ns",
        "average_ns_per_sample",
        "median_ns_per_sample",
        "minimum_ns_per_sample",
        "maximum_ns_per_sample",
        "final_input",
        "final_output",
        "binary",
        "assembly",
        "timings",
    ]
    with summary_path.open("w", newline="", encoding="utf-8") as summary_file:
        writer = csv.DictWriter(summary_file, fieldnames=columns)
        writer.writeheader()
        flags_text = " ".join(compiler_flags)
        for summary in summaries:
            output_row = dict(summary)
            output_row["compiler_flags"] = flags_text
            writer.writerow(output_row)


def parse_arguments() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "configuration",
        type=int,
        nargs="?",
        default=4,
        choices=sorted(BUILD_CONFIGURATIONS),
        help="build configuration number (default: 4, meaning -O2 -marm)",
    )
    parser.add_argument(
        "--runs",
        type=int,
        default=DEFAULT_RUNS,
        help=f"runs per executable (default: {DEFAULT_RUNS})",
    )
    parser.add_argument(
        "--compiler",
        default="gcc",
        help="C compiler command (default: gcc)",
    )
    parser.add_argument(
        "--output-dir",
        type=Path,
        help="result directory (default: benchmark_results_<configuration>)",
    )
    arguments = parser.parse_args()
    if arguments.runs <= 0:
        parser.error("--runs must be greater than zero")
    return arguments


def main() -> None:
    arguments = parse_arguments()
    configuration = BUILD_CONFIGURATIONS[arguments.configuration]
    tag = str(configuration["tag"])
    optimization_flags = list(configuration["flags"])
    common_flags = [
        "-Wall",
        "-Wextra",
        *optimization_flags,
        "-mcpu=cortex-a7",
        "-I.",
    ]

    output_root = (
        arguments.output_dir.resolve()
        if arguments.output_dir is not None
        else SCRIPT_DIR / f"benchmark_results_{tag}"
    )
    output_root.mkdir(parents=True, exist_ok=True)

    missing_sources = [
        source_name
        for _, source_name in PROGRAMS
        if not (SCRIPT_DIR / source_name).is_file()
    ]
    if missing_sources:
        sys.exit("Missing source files:\n  " + "\n  ".join(missing_sources))

    compiler_version = run_checked(
        [arguments.compiler, "--version"], "Checking the compiler"
    ).stdout.splitlines()[0]
    print(f"Compiler:      {compiler_version}")
    print(f"Configuration: {arguments.configuration} ({tag})")
    print(f"Flags:         {' '.join(common_flags)}")
    print(f"Programs:      {len(PROGRAMS)}")
    print(f"Runs/program:  {arguments.runs}")
    print(f"Output:        {output_root}")

    summaries = [
        benchmark_program(
            logical_name,
            source_name,
            arguments.compiler,
            common_flags,
            tag,
            arguments.runs,
            output_root,
        )
        for logical_name, source_name in PROGRAMS
    ]

    summary_path = output_root / f"benchmark_summary_{tag}.csv"
    write_summary(summary_path, summaries, common_flags)

    final_outputs = {str(summary["final_output"]) for summary in summaries}
    print("\nDone.")
    print(f"Summary CSV: {summary_path}")
    print(f"Detailed results and assembly: {output_root}")
    if len(final_outputs) == 1:
        print(f"All programs produced final output {next(iter(final_outputs))}.")
    else:
        print("WARNING: programs did not all produce the same final output:")
        for summary in summaries:
            print(f"  {summary['program']}: {summary['final_output']}")


if __name__ == "__main__":
    main()
