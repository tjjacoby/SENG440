#!/usr/bin/env python3
"""Count instructions in run_IIR across the four benchmark builds.

The -O0 builds keep run_IIR as a standalone function.  GCC inlines run_IIR
into main at -O2/-O3, so those builds are extracted using the verbose source
line annotations emitted by ``gcc -fverbose-asm -S``.  Only instructions
attributed to the C source lines inside run_IIR are counted.

Outputs:
  assembly_analysis/run_iir_instruction_counts.csv
  assembly_analysis/run_iir_loop_counts.csv
  assembly_analysis/run_iir_instruction_counts.md
"""

from __future__ import annotations

import csv
import re
from collections import Counter
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable


ROOT = Path(__file__).resolve().parent
OUTPUT_DIR = ROOT / "assembly_analysis"

CONFIG_DIRS = {
    "O0 Thumb": ROOT / "benchmark_results_O0",
    "O2 Thumb": ROOT / "benchmark_results_O2",
    "O2 ARM": ROOT / "benchmark_results_O2marm",
    "O3 ARM": ROOT / "benchmark_results_O3marm",
}

PROGRAM_SOURCES = {
    "noOpt": ROOT / "butterworth_noOpt.c",
    "pipelined": ROOT / "butterworth_pipelined.c",
    "smallOpts": ROOT / "butterworth_smallOpts.c",
    "unrolled": ROOT / "butterworth_unrolled.c",
    # script.py names butterworth_pipelined2.c's result "unrolled2".
    "unrolled2": ROOT / "butterworth_pipelined2.c",
    "unrolled4": ROOT / "butterworth_unrolled4.c",
    "unrolled5": ROOT / "butterworth_unrolled5.c",
    "unrolled6": ROOT / "butterworth_unrolled6.c",
    "unrolled7": ROOT / "butterworth_unrolled7.c",
    "unrolled8": ROOT / "butterworth_unrolled8.c",
    "unrolled10": ROOT / "butterworth_unrolled10.c",
    "unrolled20": ROOT / "butterworth_unrolled20.c",
}

PROGRAM_ORDER = [
    "noOpt",
    "smallOpts",
    "pipelined",
    "unrolled",
    "unrolled2",
    "unrolled4",
    "unrolled5",
    "unrolled6",
    "unrolled7",
    "unrolled8",
    "unrolled10",
    "unrolled20",
]

SOURCE_COMMENT_RE = re.compile(r"^\s*@\s+.*\.c:(\d+):\s?(.*)$")
INSTRUCTION_RE = re.compile(r"^\s*([A-Za-z][A-Za-z0-9.]*)\b\s*(.*?)\s*$")
LABEL_RE = re.compile(r"^\s*([.$A-Za-z_][.$A-Za-z0-9_]*):")
LOOP_HEADER_RE = re.compile(r"\b(?:for|while)\s*\(")
BRANCH_RE = re.compile(
    r"^(?:b(?:eq|ne|cs|hs|cc|lo|mi|pl|vs|vc|hi|ls|ge|lt|gt|le|al)?(?:\.w)?|cbz|cbnz)$"
)


@dataclass(frozen=True)
class Instruction:
    line_index: int
    line_number: int
    mnemonic: str
    operands: str
    source_line: int | None
    text: str


def find_function_range(source_path: Path) -> tuple[int, int, set[int]]:
    """Return inclusive run_IIR source line range and its loop-header lines."""
    lines = source_path.read_text(encoding="utf-8").splitlines()
    start = next(
        i
        for i, line in enumerate(lines)
        if re.search(r"\brun_IIR\s*\(", line)
    )

    brace_depth = 0
    saw_open = False
    end = None
    for i in range(start, len(lines)):
        # The project sources do not put braces in strings in run_IIR.  Strip
        # line comments so explanatory comments cannot affect brace matching.
        code = lines[i].split("//", 1)[0]
        opens = code.count("{")
        closes = code.count("}")
        if opens:
            saw_open = True
        brace_depth += opens - closes
        if saw_open and brace_depth == 0:
            end = i
            break

    if end is None:
        raise ValueError(f"Could not find end of run_IIR in {source_path}")

    # Convert Python indices to GCC's one-based source line numbers.
    start_line, end_line = start + 1, end + 1
    loop_lines = {
        i + 1
        for i in range(start, end + 1)
        if LOOP_HEADER_RE.search(lines[i])
    }
    return start_line, end_line, loop_lines


def parse_assembly(lines: list[str]) -> tuple[list[Instruction], dict[str, int]]:
    instructions: list[Instruction] = []
    labels: dict[str, int] = {}
    active_source_line: int | None = None

    for index, original in enumerate(lines):
        source_match = SOURCE_COMMENT_RE.match(original)
        if source_match:
            active_source_line = int(source_match.group(1))
            continue

        label_match = LABEL_RE.match(original)
        if label_match:
            labels[label_match.group(1)] = index
            continue

        # ARM's '@' starts an assembler comment.
        code = original.split("@", 1)[0]
        stripped = code.strip()
        if not stripped or stripped.startswith((".", "#")):
            continue

        instruction_match = INSTRUCTION_RE.match(code)
        if not instruction_match:
            continue

        mnemonic = instruction_match.group(1).lower()
        operands = instruction_match.group(2).strip()
        instructions.append(
            Instruction(
                line_index=index,
                line_number=index + 1,
                mnemonic=mnemonic,
                operands=operands,
                source_line=active_source_line,
                text=original.rstrip(),
            )
        )

    return instructions, labels


def extract_run_iir(
    asm_path: Path,
    source_range: tuple[int, int],
) -> tuple[list[Instruction], dict[str, int], str]:
    lines = asm_path.read_text(encoding="utf-8", errors="replace").splitlines()
    all_instructions, labels = parse_assembly(lines)

    function_label = next(
        (i for i, line in enumerate(lines) if line.strip() == "run_IIR:"),
        None,
    )
    if function_label is not None:
        function_end = next(
            i
            for i in range(function_label + 1, len(lines))
            if re.match(r"^\s*\.size\s+run_IIR\b", lines[i])
        )
        # Apply the same source-attribution rule used for inlined builds.  This
        # excludes O0's argument-save prologue, which has no run_IIR source
        # annotation, and makes the four configurations directly comparable.
        start_line, end_line = source_range
        selected = [
            ins
            for ins in all_instructions
            if function_label < ins.line_index < function_end
            and ins.source_line is not None
            and start_line <= ins.source_line <= end_line
        ]
        return selected, labels, "standalone/source-attributed"

    # At -O2/-O3 GCC inlines run_IIR into main.  Restrict the search to the
    # timed interval and then select the first contiguous instruction region
    # attributed to source lines within run_IIR.
    clock_calls = [
        ins.line_index
        for ins in all_instructions
        if ins.mnemonic in {"bl", "blx"} and "__clock_gettime64" in ins.operands
    ]
    if len(clock_calls) < 2:
        raise ValueError(f"Cannot locate timed interval in {asm_path}")

    first_clock, second_clock = clock_calls[0], clock_calls[1]
    start_line, end_line = source_range
    candidates = [
        ins
        for ins in all_instructions
        if first_clock < ins.line_index < second_clock
    ]

    # GCC can interleave setup for the second clock call with the last few
    # filter instructions (notably O3 ARM unrolled7).  Select by source line
    # throughout the timed interval instead of assuming one uninterrupted run.
    selected = [
        ins
        for ins in candidates
        if ins.source_line is not None and start_line <= ins.source_line <= end_line
    ]

    if not selected:
        raise ValueError(f"Cannot locate inlined run_IIR body in {asm_path}")
    return selected, labels, "inlined"


def backward_branches(
    instructions: Iterable[Instruction], labels: dict[str, int]
) -> list[tuple[Instruction, str, int]]:
    back_edges: list[tuple[Instruction, str, int]] = []
    for ins in instructions:
        if not BRANCH_RE.match(ins.mnemonic):
            continue
        targets = re.findall(r"[.$A-Za-z_][.$A-Za-z0-9_]*", ins.operands)
        if not targets:
            continue
        target = targets[-1]
        if target in labels and labels[target] < ins.line_index:
            back_edges.append((ins, target, labels[target]))
    return back_edges


def loop_rows(
    config: str,
    program: str,
    asm_path: Path,
    instructions: list[Instruction],
    labels: dict[str, int],
    loop_lines: set[int],
) -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    for loop_number, (branch, target, target_index) in enumerate(
        backward_branches(instructions, labels), start=1
    ):
        body = [
            ins
            for ins in instructions
            if target_index < ins.line_index <= branch.line_index
        ]
        rows.append(
            {
                "config": config,
                "program": program,
                "assembly_file": asm_path.relative_to(ROOT).as_posix(),
                "loop_number": loop_number,
                "role": "hot/main" if loop_number == 1 else "cleanup/remainder",
                "target_label": target,
                "back_branch": branch.mnemonic,
                "asm_first_line": body[0].line_number,
                "asm_last_line": body[-1].line_number,
                "body_instructions": len(body),
                "control_instructions": sum(
                    ins.source_line in loop_lines for ins in body
                ),
                "ldr": sum(ins.mnemonic == "ldr" for ins in body),
                "ldr_family": sum(ins.mnemonic.startswith("ldr") for ins in body),
                "str": sum(ins.mnemonic == "str" for ins in body),
                "str_family": sum(ins.mnemonic.startswith("str") for ins in body),
                "ldm_family": sum(ins.mnemonic.startswith("ldm") for ins in body),
                "stm_family": sum(ins.mnemonic.startswith("stm") for ins in body),
            }
        )
    return rows


def count_file(
    config: str,
    program: str,
    asm_path: Path,
    source_path: Path,
) -> dict[str, object]:
    start_line, end_line, loop_lines = find_function_range(source_path)
    instructions, labels, extraction = extract_run_iir(
        asm_path, (start_line, end_line)
    )
    mnemonics = Counter(ins.mnemonic for ins in instructions)
    back_edges = backward_branches(instructions, labels)
    back_edge_mnemonics = "; ".join(
        f"{ins.mnemonic} {target}" for ins, target, _ in back_edges
    )

    # A static repeated-loop body is the union of instructions from each
    # backward branch's target through that branch.  This includes each body
    # once, not sample_count times, and naturally includes remainder loops.
    repeated_loop_instructions = {
        ins.line_index
        for branch, _, target_index in back_edges
        for ins in instructions
        if target_index < ins.line_index <= branch.line_index
    }
    repeated_loop_body = [
        ins for ins in instructions if ins.line_index in repeated_loop_instructions
    ]
    loops = loop_rows(
        config, program, asm_path, instructions, labels, loop_lines
    )
    hot_loop = loops[0] if loops else None

    loop_control = sum(ins.source_line in loop_lines for ins in instructions)
    ldr_family = sum(ins.mnemonic.startswith("ldr") for ins in instructions)
    str_family = sum(ins.mnemonic.startswith("str") for ins in instructions)
    multiply = sum(
        ins.mnemonic in {"mul", "muls", "smull", "umull"}
        for ins in instructions
    )
    mac = sum(
        ins.mnemonic.startswith(("mla", "mls", "smla", "smls", "smlal", "umaal"))
        for ins in instructions
    )
    compare_test = sum(
        ins.mnemonic in {"cmp", "cmn", "tst", "teq"}
        for ins in instructions
    )
    branch = sum(bool(BRANCH_RE.match(ins.mnemonic)) for ins in instructions)

    return {
        "config": config,
        "program": program,
        "assembly_file": asm_path.relative_to(ROOT).as_posix(),
        "source_file": source_path.name,
        "extraction": extraction,
        "asm_first_line": instructions[0].line_number,
        "asm_last_line": instructions[-1].line_number,
        "total_instructions": len(instructions),
        "loop_control_instructions": loop_control,
        "repeated_loop_body_instructions": len(repeated_loop_body),
        "loop_body_ldr": sum(ins.mnemonic == "ldr" for ins in repeated_loop_body),
        "loop_body_str": sum(ins.mnemonic == "str" for ins in repeated_loop_body),
        "hot_loop_body_instructions": hot_loop["body_instructions"] if hot_loop else 0,
        "hot_loop_control_instructions": hot_loop["control_instructions"] if hot_loop else 0,
        "hot_loop_ldr": hot_loop["ldr"] if hot_loop else 0,
        "hot_loop_ldr_family": hot_loop["ldr_family"] if hot_loop else 0,
        "hot_loop_str": hot_loop["str"] if hot_loop else 0,
        "hot_loop_str_family": hot_loop["str_family"] if hot_loop else 0,
        "hot_loop_ldm_family": hot_loop["ldm_family"] if hot_loop else 0,
        "hot_loop_stm_family": hot_loop["stm_family"] if hot_loop else 0,
        "loop_back_branches": len(back_edges),
        "loop_back_branch_mnemonics": back_edge_mnemonics,
        "ldr": mnemonics["ldr"],
        "ldr_family": ldr_family,
        "str": mnemonics["str"],
        "str_family": str_family,
        "ldm_family": sum(ins.mnemonic.startswith("ldm") for ins in instructions),
        "stm_family": sum(ins.mnemonic.startswith("stm") for ins in instructions),
        "compare_test": compare_test,
        "branch": branch,
        "multiply": multiply,
        "mac": mac,
        "push": mnemonics["push"],
        "pop": mnemonics["pop"],
    }


def markdown_table(headers: list[str], rows: list[list[object]]) -> str:
    def clean(value: object) -> str:
        return str(value).replace("|", "\\|")

    output = [
        "| " + " | ".join(headers) + " |",
        "| " + " | ".join("---" for _ in headers) + " |",
    ]
    output.extend("| " + " | ".join(clean(v) for v in row) + " |" for row in rows)
    return "\n".join(output)


def write_markdown(results: list[dict[str, object]], output_path: Path) -> None:
    sections = [
        "# `run_IIR` assembly instruction counts",
        "",
        "These are **static instruction occurrences**, not dynamically executed "
        "instructions or cycle counts. `hot-loop body` is the first repeated "
        "region identified by a backward branch, counted once. `hot-loop control` "
        "counts instructions in that region that "
        "GCC's verbose assembly attributes to a C `for`/`while` header inside "
        "`run_IIR`. `loop back branches` independently counts backward branch "
        "edges; a value of two indicates a separate cleanup/remainder loop. "
        "`LDR family`/`STR family` include sized variants such as `ldrd`, "
        "`ldrb`, and `strd`; the exact `LDR`/`STR` columns exclude those variants.",
        "",
        "At `-O0`, `run_IIR` is standalone; its source-attributed instructions are "
        "counted and the unannotated argument-save prologue is excluded. At optimized "
        "levels GCC inlined `run_IIR`; all filter-attributed instructions between the "
        "two benchmark clock calls are counted, even where GCC interleaves timer setup "
        "with tail code. Timing setup, CSV output, and sine generation are excluded.",
        "",
    ]

    for config in CONFIG_DIRS:
        config_results = [r for r in results if r["config"] == config]
        by_program = {str(r["program"]): r for r in config_results}
        rows: list[list[object]] = []
        for program in PROGRAM_ORDER:
            r = by_program[program]
            rows.append(
                [
                    program,
                    r["total_instructions"],
                    r["hot_loop_body_instructions"],
                    r["hot_loop_control_instructions"],
                    r["loop_back_branches"],
                    r["ldr"],
                    r["str"],
                    f'{r["hot_loop_ldr"]}/{r["hot_loop_str"]}',
                    f'{r["hot_loop_ldm_family"]}/{r["hot_loop_stm_family"]}',
                    f'{r["ldr_family"]}/{r["str_family"]}',
                    r["multiply"],
                    r["mac"],
                    f'{r["asm_first_line"]}-{r["asm_last_line"]}',
                ]
            )
        sections.extend(
            [
                f"## {config}",
                "",
                markdown_table(
                    [
                        "program",
                        "all instr.",
                        "hot-loop body",
                        "hot-loop control",
                        "back branches",
                        "LDR",
                        "STR",
                        "hot LDR/STR",
                        "hot LDM/STM",
                        "load/store family",
                        "MUL",
                        "MAC",
                        "assembly lines",
                    ],
                    rows,
                ),
                "",
            ]
        )

    output_path.write_text("\n".join(sections), encoding="utf-8")


def main() -> None:
    results: list[dict[str, object]] = []
    for config, config_dir in CONFIG_DIRS.items():
        for program in PROGRAM_ORDER:
            source_path = PROGRAM_SOURCES[program]
            candidates = sorted((config_dir / program).glob("*.s"))
            if len(candidates) != 1:
                raise ValueError(
                    f"Expected one .s file in {config_dir / program}, found {len(candidates)}"
                )
            results.append(
                count_file(config, program, candidates[0], source_path)
            )

    OUTPUT_DIR.mkdir(exist_ok=True)
    csv_path = OUTPUT_DIR / "run_iir_instruction_counts.csv"
    with csv_path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=list(results[0]))
        writer.writeheader()
        writer.writerows(results)

    detailed_loops: list[dict[str, object]] = []
    for config, config_dir in CONFIG_DIRS.items():
        for program in PROGRAM_ORDER:
            source_path = PROGRAM_SOURCES[program]
            start_line, end_line, loop_lines = find_function_range(source_path)
            asm_path = next((config_dir / program).glob("*.s"))
            instructions, labels, _ = extract_run_iir(
                asm_path, (start_line, end_line)
            )
            detailed_loops.extend(
                loop_rows(
                    config,
                    program,
                    asm_path,
                    instructions,
                    labels,
                    loop_lines,
                )
            )
    loop_csv_path = OUTPUT_DIR / "run_iir_loop_counts.csv"
    with loop_csv_path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=list(detailed_loops[0]))
        writer.writeheader()
        writer.writerows(detailed_loops)

    markdown_path = OUTPUT_DIR / "run_iir_instruction_counts.md"
    write_markdown(results, markdown_path)
    print(f"Analyzed {len(results)} assembly files")
    print(csv_path)
    print(loop_csv_path)
    print(markdown_path)


if __name__ == "__main__":
    main()
