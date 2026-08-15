"""Plot one or more normalized input-signal text files."""

from argparse import ArgumentParser
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np


SCRIPT_DIR = Path(__file__).resolve().parent
INPUT_DIR = SCRIPT_DIR / "inputs"
DEFAULT_GRAPH = SCRIPT_DIR / "input_graphs.png"


def parse_args():
    parser = ArgumentParser(description=__doc__)
    parser.add_argument(
        "files",
        nargs="*",
        type=Path,
        help="input text files or directories (default: every .txt file in inputs)",
    )
    parser.add_argument(
        "--sample-rate",
        type=float,
        default=10_000.0,
        help="sample rate in Hz (default: 10000)",
    )
    parser.add_argument(
        "--duration-ms",
        type=float,
        help="only display the first specified number of milliseconds",
    )
    parser.add_argument(
        "--output",
        type=Path,
        default=DEFAULT_GRAPH,
        help=f"output image (default: {DEFAULT_GRAPH.name})",
    )
    parser.add_argument(
        "--no-show",
        action="store_true",
        help="save the graph without opening a plot window",
    )
    return parser.parse_args()


def collect_files(paths):
    if not paths:
        files = sorted(INPUT_DIR.glob("*.txt"))
    else:
        files = []
        for path in paths:
            if path.is_dir():
                files.extend(sorted(path.glob("*.txt")))
            else:
                files.append(path)

    if not files:
        raise ValueError("No input .txt files were found")

    missing = [path for path in files if not path.is_file()]
    if missing:
        names = ", ".join(str(path) for path in missing)
        raise FileNotFoundError(f"Input files not found: {names}")

    return files


def load_samples(path):
    samples = np.asarray(np.loadtxt(path, dtype=float))
    if samples.ndim == 0:
        samples = samples.reshape(1)
    if samples.ndim != 1 or len(samples) == 0:
        raise ValueError(f"{path} must contain one sample per line")
    if not np.all(np.isfinite(samples)):
        raise ValueError(f"{path} contains a non-finite sample")
    if np.any(np.abs(samples) > 1.0):
        raise ValueError(f"{path} contains a sample outside [-1.0, 1.0]")
    return samples


def main():
    args = parse_args()
    if args.sample_rate <= 0:
        raise ValueError("sample rate must be positive")
    if args.duration_ms is not None and args.duration_ms <= 0:
        raise ValueError("duration must be positive")

    files = collect_files(args.files)
    columns = 2 if len(files) > 1 else 1
    rows = (len(files) + columns - 1) // columns
    figure, axes = plt.subplots(
        rows,
        columns,
        figsize=(13, 3.2 * rows),
        constrained_layout=True,
        squeeze=False,
    )
    axes = axes.ravel()

    for axis, path in zip(axes, files):
        samples = load_samples(path)
        sample_count = len(samples)

        if args.duration_ms is not None:
            requested_samples = int(
                np.ceil(args.duration_ms * args.sample_rate / 1000.0)
            )
            sample_count = min(sample_count, max(1, requested_samples))

        visible_samples = samples[:sample_count]
        time_ms = np.arange(sample_count) * 1000.0 / args.sample_rate

        axis.plot(time_ms, visible_samples, linewidth=1.4)
        axis.set_title(
            f"{path.name}  "
            f"(min={samples.min():+.3f}, max={samples.max():+.3f})"
        )
        axis.set_xlabel("Time (ms)")
        axis.set_ylabel("Amplitude")
        axis.set_ylim(-1.05, 1.05)
        axis.grid(True, alpha=0.3)

        print(
            f"{path.name}: samples={len(samples)}, "
            f"min={samples.min():+.6f}, max={samples.max():+.6f}"
        )

    for unused_axis in axes[len(files) :]:
        unused_axis.set_visible(False)

    output_file = args.output.resolve()
    figure.suptitle(f"Input signals at {args.sample_rate:g} Hz", fontsize=16)
    figure.savefig(output_file, dpi=200)
    print(f"Saved graph to {output_file}")

    if not args.no_show:
        plt.show()


if __name__ == "__main__":
    main()
