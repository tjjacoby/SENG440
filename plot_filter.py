"""Plot and verify the input/output data from the fixed-point IIR filter."""

from argparse import ArgumentParser
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd


SCRIPT_DIR = Path(__file__).resolve().parent
DEFAULT_CSV = SCRIPT_DIR / "fixedpoint_sin_output.csv"
DEFAULT_GRAPH = SCRIPT_DIR / "filter_graph.png"
REQUIRED_COLUMNS = {"time", "input", "output"}
TEST_FREQUENCIES = (100, 500, 1000, 2000, 4000)


def parse_args():
    parser = ArgumentParser(description=__doc__)
    parser.add_argument(
        "csv_file",
        nargs="?",
        type=Path,
        default=DEFAULT_CSV,
        help=f"filter CSV file (default: {DEFAULT_CSV.name})",
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


def load_filter_data(csv_file):
    data = pd.read_csv(csv_file)
    missing = REQUIRED_COLUMNS.difference(data.columns)
    if missing:
        missing_text = ", ".join(sorted(missing))
        raise ValueError(f"{csv_file} is missing columns: {missing_text}")
    if len(data) < 4:
        raise ValueError(f"{csv_file} does not contain enough samples")

    data = data.sort_values("time").reset_index(drop=True)
    sample_periods = np.diff(data["time"].to_numpy())
    if np.any(sample_periods <= 0):
        raise ValueError("time values must be strictly increasing")

    sample_rate = 1.0 / np.median(sample_periods)
    return data, sample_rate


def amplitude_spectrum(signal, sample_rate):
    """Return a single-sided, window-corrected amplitude spectrum."""
    signal = np.asarray(signal, dtype=float)
    signal = signal - np.mean(signal)
    window = np.hanning(len(signal))
    spectrum = np.fft.rfft(signal * window)
    amplitude = 2.0 * np.abs(spectrum) / np.sum(window)
    frequencies = np.fft.rfftfreq(len(signal), d=1.0 / sample_rate)
    return frequencies, amplitude


def amplitude_at(frequencies, amplitude, target_frequency):
    index = int(np.argmin(np.abs(frequencies - target_frequency)))
    return amplitude[index]


def print_attenuation_table(frequencies, input_amplitude, output_amplitude):
    print("\nMeasured steady-state response")
    print("frequency (Hz) | input amp | output amp | gain (dB)")
    print("---------------+-----------+------------+----------")

    for frequency in TEST_FREQUENCIES:
        input_at_frequency = amplitude_at(
            frequencies, input_amplitude, frequency
        )
        output_at_frequency = amplitude_at(
            frequencies, output_amplitude, frequency
        )
        gain_db = 20.0 * np.log10(
            max(output_at_frequency, np.finfo(float).tiny)
            / max(input_at_frequency, np.finfo(float).tiny)
        )
        print(
            f"{frequency:14.0f} | {input_at_frequency:9.5f} | "
            f"{output_at_frequency:10.5f} | {gain_db:8.2f}"
        )


def main():
    args = parse_args()
    csv_file = args.csv_file.resolve()
    output_file = args.output.resolve()
    data, sample_rate = load_filter_data(csv_file)

    # Use the second half for the spectrum so the filter startup transient is
    # excluded from the frequency-response check.
    steady_state = data.iloc[len(data) // 2 :]
    frequencies, input_amplitude = amplitude_spectrum(
        steady_state["input"], sample_rate
    )
    _, output_amplitude = amplitude_spectrum(
        steady_state["output"], sample_rate
    )

    print(f"Loaded {len(data)} samples from {csv_file.name}")
    print(f"Detected sample rate: {sample_rate:.2f} Hz")
    print_attenuation_table(frequencies, input_amplitude, output_amplitude)

    figure, (time_axis, spectrum_axis) = plt.subplots(
        2, 1, figsize=(12, 8), constrained_layout=True
    )

    # Two cycles of the lowest (100 Hz) test tone keep this plot readable.
    time_limit = min(0.020, float(data["time"].iloc[-1]))
    time_view = data[data["time"] <= time_limit]
    time_axis.plot(time_view["time"] * 1000.0, time_view["input"], label="Input")
    time_axis.plot(
        time_view["time"] * 1000.0,
        time_view["output"],
        label="Filtered output",
        linewidth=2.0,
    )
    time_axis.set(
        xlabel="Time (ms)",
        ylabel="Amplitude",
        title="IIR filter input and output (first 20 ms)",
    )
    time_axis.grid(True, alpha=0.3)
    time_axis.legend()

    tiny = np.finfo(float).tiny
    input_db = 20.0 * np.log10(np.maximum(input_amplitude, tiny))
    output_db = 20.0 * np.log10(np.maximum(output_amplitude, tiny))
    spectrum_axis.plot(frequencies, input_db, label="Input spectrum")
    spectrum_axis.plot(
        frequencies, output_db, label="Output spectrum", linewidth=2.0
    )
    spectrum_axis.axvline(
        1000, color="tab:orange", linestyle="--", alpha=0.8, label="1 kHz cutoff"
    )
    spectrum_axis.axvline(
        4000, color="tab:red", linestyle=":", alpha=0.8, label="4 kHz test"
    )
    spectrum_axis.set(
        xlim=(0, sample_rate / 2.0),
        ylim=(-100, 0),
        xlabel="Frequency (Hz)",
        ylabel="Amplitude (dBFS)",
        title="Steady-state frequency spectrum",
    )
    spectrum_axis.grid(True, alpha=0.3)
    spectrum_axis.legend()

    figure.savefig(output_file, dpi=200)
    print(f"\nSaved graph to {output_file}")
    if not args.no_show:
        plt.show()


if __name__ == "__main__":
    main()
