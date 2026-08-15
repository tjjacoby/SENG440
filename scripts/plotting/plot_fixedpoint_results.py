"""Plot VM-generated fixed-point results and compare them with float results."""

from __future__ import annotations

import argparse
import csv
from pathlib import Path

import matplotlib

matplotlib.use("Agg")
import matplotlib.pyplot as plt
import numpy as np


EXPECTED_SIGNAL_ORDER = [
    "multitone_2000",
    "peak_pattern_1000",
    "sine_1000hz_2000",
    "sine_100hz_2000",
    "sine_2000hz_2000",
    "sine_4000hz_2000",
    "sine_500hz_2000",
    "step",
    "impulse",
]


def load_named_csv(path: Path, required_columns: set[str]) -> np.ndarray:
    data = np.genfromtxt(path, delimiter=",", names=True, dtype=np.float64)
    if data.dtype.names is None:
        raise ValueError(f"{path} does not have a CSV header")
    missing = required_columns.difference(data.dtype.names)
    if missing:
        raise ValueError(f"{path} is missing columns: {', '.join(sorted(missing))}")
    data = np.atleast_1d(data)
    if data.size == 0:
        raise ValueError(f"{path} contains no data rows")
    for column in required_columns:
        if not np.all(np.isfinite(data[column])):
            raise ValueError(f"{path} contains a non-finite {column} value")
    return data


def load_signal_results(directory: Path) -> dict[str, np.ndarray]:
    results: dict[str, np.ndarray] = {}
    for path in directory.glob("*_input_output.csv"):
        name = path.name.removesuffix("_input_output.csv")
        results[name] = load_named_csv(path, {"time", "input", "output"})

    missing = [name for name in EXPECTED_SIGNAL_ORDER if name not in results]
    if missing:
        raise ValueError(
            f"{directory} is missing expected signals: {', '.join(missing)}"
        )
    return results


def sample_rate_from_time(time_seconds: np.ndarray) -> float:
    if time_seconds.size < 2:
        raise ValueError("at least two time samples are required")
    differences = np.diff(time_seconds)
    if np.any(differences <= 0.0):
        raise ValueError("CSV time values must increase")
    return 1.0 / float(np.median(differences))


def amplitude_spectrum(
    samples: np.ndarray, sample_rate_hz: float
) -> tuple[np.ndarray, np.ndarray]:
    frequency = np.fft.rfftfreq(samples.size, d=1.0 / sample_rate_hz)
    amplitude = np.abs(np.fft.rfft(samples)) / samples.size
    if samples.size > 1:
        amplitude[1:-1] *= 2.0
    return frequency, amplitude


def save_signal_plot(destination: Path, name: str, data: np.ndarray) -> None:
    time_seconds = data["time"]
    time_ms = 1000.0 * time_seconds
    input_samples = data["input"]
    output_samples = data["output"]
    sample_rate_hz = sample_rate_from_time(time_seconds)
    zoom_count = min(
        data.size,
        max(1, int(round(0.020 * sample_rate_hz))),
    )
    input_frequency, input_amplitude = amplitude_spectrum(
        input_samples, sample_rate_hz
    )
    output_frequency, output_amplitude = amplitude_spectrum(
        output_samples, sample_rate_hz
    )

    figure, axes = plt.subplots(3, 1, figsize=(12, 10), constrained_layout=True)

    axes[0].plot(time_ms, input_samples, label="Input", linewidth=1.0)
    axes[0].plot(time_ms, output_samples, label="Fixed-point output", linewidth=1.1)
    axes[0].set_title(f"{name}: complete input and fixed-point output ({data.size} samples)")
    axes[0].set_xlabel("Time (ms)")
    axes[0].set_ylabel("Amplitude")
    axes[0].grid(True, alpha=0.3)
    axes[0].legend()

    axes[1].plot(time_ms[:zoom_count], input_samples[:zoom_count], label="Input")
    axes[1].plot(
        time_ms[:zoom_count],
        output_samples[:zoom_count],
        label="Fixed-point output",
    )
    axes[1].set_title("First 20 ms (or the complete signal if shorter)")
    axes[1].set_xlabel("Time (ms)")
    axes[1].set_ylabel("Amplitude")
    axes[1].grid(True, alpha=0.3)
    axes[1].legend()

    floor = 1.0e-8
    axes[2].plot(
        input_frequency,
        20.0 * np.log10(np.maximum(input_amplitude, floor)),
        label="Input spectrum",
    )
    axes[2].plot(
        output_frequency,
        20.0 * np.log10(np.maximum(output_amplitude, floor)),
        label="Fixed-point output spectrum",
    )
    axes[2].set_xlim(0.0, sample_rate_hz / 2.0)
    axes[2].set_ylim(-120.0, 5.0)
    axes[2].set_title("Single-sided amplitude spectra")
    axes[2].set_xlabel("Frequency (Hz)")
    axes[2].set_ylabel("Amplitude (dBFS)")
    axes[2].grid(True, alpha=0.3)
    axes[2].legend()

    figure.savefig(destination, dpi=160)
    plt.close(figure)


def save_overview_plot(
    destination: Path, results: dict[str, np.ndarray]
) -> None:
    figure, axes = plt.subplots(
        len(EXPECTED_SIGNAL_ORDER),
        1,
        figsize=(14, 2.5 * len(EXPECTED_SIGNAL_ORDER)),
        constrained_layout=True,
    )

    for axis, name in zip(axes, EXPECTED_SIGNAL_ORDER):
        data = results[name]
        time_ms = 1000.0 * data["time"]
        axis.plot(time_ms, data["input"], label="Input", linewidth=0.9, alpha=0.8)
        axis.plot(
            time_ms,
            data["output"],
            label="Fixed-point output",
            linewidth=1.0,
        )
        axis.set_title(name)
        axis.set_xlabel("Time (ms)")
        axis.set_ylabel("Amplitude")
        axis.grid(True, alpha=0.25)
        axis.legend(loc="upper right")

    sample_rate_hz = sample_rate_from_time(results[EXPECTED_SIGNAL_ORDER[0]]["time"])
    figure.suptitle(
        f"Four-times-unrolled Q14 filter: complete signals at {sample_rate_hz:g} Hz",
        fontsize=16,
    )
    figure.savefig(destination, dpi=160)
    plt.close(figure)


def load_frequency_response(path: Path) -> np.ndarray:
    data = load_named_csv(
        path,
        {"frequency_hz", "magnitude", "magnitude_db", "phase_degrees"},
    )
    if np.any(np.diff(data["frequency_hz"]) <= 0.0):
        raise ValueError(f"{path} frequencies must increase")
    return data


def masked_phase(data: np.ndarray, floor_db: float = -60.0) -> np.ndarray:
    """Hide phase where an almost-zero response makes phase meaningless."""
    phase = np.degrees(np.unwrap(np.radians(data["phase_degrees"])))
    phase[data["magnitude_db"] < floor_db] = np.nan
    return phase


def save_fixed_frequency_response(destination: Path, fixed: np.ndarray) -> None:
    figure, axes = plt.subplots(2, 1, figsize=(11, 8), constrained_layout=True)

    axes[0].plot(
        fixed["frequency_hz"],
        fixed["magnitude_db"],
        label="Measured Q14 response",
    )
    axes[0].axvline(1000.0, color="tab:red", linestyle=":", label="1 kHz cutoff")
    axes[0].axhline(-3.0, color="gray", linestyle=":", linewidth=0.9)
    axes[0].set_xlim(0.0, 5000.0)
    axes[0].set_ylim(-100.0, 5.0)
    axes[0].set_title("Fixed-point Butterworth magnitude response")
    axes[0].set_xlabel("Frequency (Hz)")
    axes[0].set_ylabel("Magnitude (dB)")
    axes[0].grid(True, alpha=0.3)
    axes[0].legend()

    axes[1].plot(fixed["frequency_hz"], masked_phase(fixed))
    axes[1].set_xlim(0.0, 5000.0)
    axes[1].set_ylim(-185.0, 5.0)
    axes[1].set_title("Fixed-point Butterworth phase response")
    axes[1].set_xlabel("Frequency (Hz)")
    axes[1].set_ylabel("Phase (degrees)")
    axes[1].grid(True, alpha=0.3)

    figure.savefig(destination, dpi=160)
    plt.close(figure)


def save_float_fixed_comparison(
    destination: Path, floating: np.ndarray, fixed: np.ndarray
) -> None:
    figure, axes = plt.subplots(2, 1, figsize=(11, 8), constrained_layout=True)

    axes[0].plot(
        floating["frequency_hz"],
        floating["magnitude_db"],
        label="Floating point",
        linewidth=2.0,
    )
    axes[0].plot(
        fixed["frequency_hz"],
        fixed["magnitude_db"],
        "--",
        label="Fixed point (Q14 measured)",
        linewidth=1.4,
    )
    axes[0].axvline(1000.0, color="tab:red", linestyle=":", label="1 kHz cutoff")
    axes[0].axhline(-3.0, color="gray", linestyle=":", linewidth=0.9)
    axes[0].set_xlim(0.0, 5000.0)
    axes[0].set_ylim(-100.0, 5.0)
    axes[0].set_title("Floating-point versus fixed-point magnitude response")
    axes[0].set_xlabel("Frequency (Hz)")
    axes[0].set_ylabel("Magnitude (dB)")
    axes[0].grid(True, alpha=0.3)
    axes[0].legend()

    axes[1].plot(
        floating["frequency_hz"],
        masked_phase(floating),
        label="Floating point",
        linewidth=2.0,
    )
    axes[1].plot(
        fixed["frequency_hz"],
        masked_phase(fixed),
        "--",
        label="Fixed point (Q14 measured)",
        linewidth=1.4,
    )
    axes[1].set_xlim(0.0, 5000.0)
    axes[1].set_ylim(-185.0, 5.0)
    axes[1].set_title("Floating-point versus fixed-point phase response")
    axes[1].set_xlabel("Frequency (Hz)")
    axes[1].set_ylabel("Phase (degrees)")
    axes[1].grid(True, alpha=0.3)
    axes[1].legend()

    figure.savefig(destination, dpi=160)
    plt.close(figure)


def save_selected_signal_comparison(
    destination: Path,
    floating_signals: dict[str, np.ndarray],
    fixed_signals: dict[str, np.ndarray],
) -> None:
    selections = [
        ("sine_100hz_2000", "100 Hz sine wave", 50.0),
        ("step", "Step response", 5.0),
        ("peak_pattern_1000", "Peak-pattern response", None),
    ]
    figure, axes = plt.subplots(3, 1, figsize=(12, 10), constrained_layout=True)

    for axis, (name, title, maximum_time_ms) in zip(axes, selections):
        floating = floating_signals[name]
        fixed = fixed_signals[name]
        time_ms = 1000.0 * floating["time"]

        axis.plot(
            time_ms,
            floating["input"],
            color="black",
            linewidth=1.2,
            alpha=0.65,
            label="Input",
        )
        axis.plot(
            time_ms,
            floating["output"],
            color="tab:blue",
            linewidth=2.2,
            label="Floating-point output",
        )
        axis.plot(
            time_ms,
            fixed["output"],
            color="tab:orange",
            linestyle="--",
            linewidth=1.7,
            label="Fixed-point Q14 output",
        )
        if maximum_time_ms is not None:
            axis.set_xlim(0.0, maximum_time_ms)
        else:
            axis.set_xlim(float(time_ms[0]), float(time_ms[-1]))
        axis.set_title(title)
        axis.set_xlabel("Time (ms)")
        axis.set_ylabel("Amplitude")
        axis.grid(True, alpha=0.3)
        axis.legend(loc="best")

    figure.suptitle(
        "Floating-point versus fixed-point Q14 filter outputs",
        fontsize=16,
    )
    figure.savefig(destination, dpi=180)
    plt.close(figure)


def write_selected_comparison(
    destination: Path,
    floating: np.ndarray,
    fixed: np.ndarray,
) -> list[tuple[float, float, float, float]]:
    rows: list[tuple[float, float, float, float]] = []
    for frequency_hz in (100.0, 500.0, 1000.0, 2000.0, 4000.0):
        floating_db = float(
            np.interp(
                frequency_hz,
                floating["frequency_hz"],
                floating["magnitude_db"],
            )
        )
        fixed_db = float(
            np.interp(
                frequency_hz,
                fixed["frequency_hz"],
                fixed["magnitude_db"],
            )
        )
        rows.append((frequency_hz, floating_db, fixed_db, fixed_db - floating_db))

    with destination.open("w", newline="", encoding="utf-8") as csv_file:
        writer = csv.writer(csv_file)
        writer.writerow(
            (
                "frequency_hz",
                "floating_magnitude_db",
                "fixed_magnitude_db",
                "fixed_minus_floating_db",
            )
        )
        writer.writerows(rows)
    return rows


def write_rmse_comparison(
    destination: Path,
    floating_signals: dict[str, np.ndarray],
    fixed_signals: dict[str, np.ndarray],
) -> list[tuple[str, int, float, float, float, float, float]]:
    rows: list[tuple[str, int, float, float, float, float, float]] = []
    all_errors: list[np.ndarray] = []

    for name in EXPECTED_SIGNAL_ORDER:
        floating = floating_signals[name]
        fixed = fixed_signals[name]
        if floating.size != fixed.size or not np.allclose(
            floating["time"], fixed["time"], atol=1.0e-12, rtol=0.0
        ):
            raise ValueError(f"floating and fixed samples do not align for {name}")

        error = fixed["output"] - floating["output"]
        steady_error = error[error.size // 2 :]
        rmse = float(np.sqrt(np.mean(error**2)))
        steady_rmse = float(np.sqrt(np.mean(steady_error**2)))
        maximum_absolute_error = float(np.max(np.abs(error)))
        rows.append(
            (
                name,
                error.size,
                rmse,
                rmse * 16384.0,
                rmse * 100.0,
                steady_rmse,
                maximum_absolute_error,
            )
        )
        all_errors.append(error)

    combined_error = np.concatenate(all_errors)
    combined_rmse = float(np.sqrt(np.mean(combined_error**2)))

    with destination.open("w", newline="", encoding="utf-8") as csv_file:
        writer = csv.writer(csv_file)
        writer.writerow(
            (
                "signal",
                "samples",
                "rmse",
                "rmse_q14_lsb",
                "rmse_percent_of_unit_full_scale",
                "steady_state_rmse",
                "maximum_absolute_error",
            )
        )
        writer.writerows(rows)
        writer.writerow(
            (
                "ALL_WEIGHTED",
                combined_error.size,
                combined_rmse,
                combined_rmse * 16384.0,
                combined_rmse * 100.0,
                "",
                float(np.max(np.abs(combined_error))),
            )
        )
    return rows


def parse_arguments() -> argparse.Namespace:
    script_directory = Path(__file__).resolve().parent
    parser = argparse.ArgumentParser(
        description="Plot fixed-point VM results and compare them with float results"
    )
    parser.add_argument(
        "--fixed-dir",
        type=Path,
        default=script_directory / "butterworth_unrolled4_analysis_results",
    )
    parser.add_argument(
        "--float-dir",
        type=Path,
        default=script_directory / "butterworth_float_results",
    )
    parser.add_argument(
        "--output-dir",
        type=Path,
        default=script_directory / "butterworth_fixedpoint_graphs",
    )
    return parser.parse_args()


def main() -> None:
    arguments = parse_arguments()
    fixed_directory = arguments.fixed_dir.resolve()
    floating_directory = arguments.float_dir.resolve()
    output_directory = arguments.output_dir.resolve()
    individual_directory = output_directory / "plots"
    output_directory.mkdir(parents=True, exist_ok=True)
    individual_directory.mkdir(parents=True, exist_ok=True)

    fixed_signals = load_signal_results(fixed_directory)
    floating_signals = load_signal_results(floating_directory / "csv")
    for name in EXPECTED_SIGNAL_ORDER:
        save_signal_plot(
            individual_directory / f"{name}.png",
            name,
            fixed_signals[name],
        )

    save_overview_plot(output_directory / "all_input_output.png", fixed_signals)

    fixed_response = load_frequency_response(
        fixed_directory / "frequency_response.csv"
    )
    floating_response = load_frequency_response(
        floating_directory / "frequency_response.csv"
    )
    save_fixed_frequency_response(
        output_directory / "frequency_response.png", fixed_response
    )
    save_float_fixed_comparison(
        output_directory / "floating_vs_fixed_frequency_response.png",
        floating_response,
        fixed_response,
    )
    save_selected_signal_comparison(
        output_directory / "floating_vs_fixed_selected_signals.png",
        floating_signals,
        fixed_signals,
    )
    comparison_rows = write_selected_comparison(
        output_directory / "selected_frequency_comparison.csv",
        floating_response,
        fixed_response,
    )
    rmse_rows = write_rmse_comparison(
        output_directory / "output_rmse_comparison.csv",
        floating_signals,
        fixed_signals,
    )

    print(f"Wrote fixed-point graphs to: {output_directory}")
    print("Magnitude comparison:")
    for frequency_hz, floating_db, fixed_db, difference_db in comparison_rows:
        print(
            f"  {frequency_hz:7.1f} Hz: float={floating_db:+.4f} dB, "
            f"fixed={fixed_db:+.4f} dB, difference={difference_db:+.4f} dB"
        )
    print("Output RMSE (fixed minus floating):")
    for name, _, rmse, rmse_lsb, _, _, _ in rmse_rows:
        print(f"  {name:25s}: {rmse:.9g} ({rmse_lsb:.3f} Q14 LSB)")


if __name__ == "__main__":
    main()
