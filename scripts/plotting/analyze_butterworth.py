"""Analyze the floating-point IIR implemented in test_files/butterworth.c.

The script does not modify or compile the C source.  It applies the same
coefficients, equation, initial conditions, and state-update order to every
text file in inputs/, and to generated step and impulse inputs.
"""

from __future__ import annotations

import argparse
import csv
from pathlib import Path

import matplotlib

matplotlib.use("Agg")
import matplotlib.pyplot as plt
import numpy as np


SAMPLE_RATE_HZ = 10_000.0
GENERATED_SAMPLE_COUNT = 2_000

# Exact coefficient values written in test_files/butterworth.c.
B0 = 0.067455
B1 = 0.134910
B2 = 0.067455
A1 = 1.142981
A2 = -0.412795


def run_butterworth(samples: np.ndarray) -> np.ndarray:
    """Run the recurrence from butterworth.c with zero initial state."""
    output = np.empty(samples.size, dtype=np.float64)
    x1 = x2 = 0.0
    y1 = y2 = 0.0

    for index, current_input in enumerate(samples):
        current_output = (
            B0 * current_input
            + B1 * x1
            + B2 * x2
            + A1 * y1
            + A2 * y2
        )
        output[index] = current_output

        x2 = x1
        x1 = current_input
        y2 = y1
        y1 = current_output

    return output


def load_inputs(input_directory: Path) -> dict[str, np.ndarray]:
    signals: dict[str, np.ndarray] = {}
    for input_path in sorted(input_directory.glob("*.txt")):
        values = np.loadtxt(input_path, dtype=np.float64)
        values = np.atleast_1d(values).reshape(-1)
        if values.size == 0:
            raise ValueError(f"{input_path} contains no samples")
        if not np.all(np.isfinite(values)):
            raise ValueError(f"{input_path} contains a non-finite value")
        signals[input_path.stem] = values
    return signals


def generated_inputs(sample_count: int) -> dict[str, np.ndarray]:
    step = np.ones(sample_count, dtype=np.float64)
    impulse = np.zeros(sample_count, dtype=np.float64)
    impulse[0] = 1.0
    return {"step": step, "impulse": impulse}


def theoretical_frequency_response(
    sample_rate_hz: float, point_count: int = 8193
) -> tuple[np.ndarray, np.ndarray]:
    frequencies = np.linspace(0.0, sample_rate_hz / 2.0, point_count)
    omega = 2.0 * np.pi * frequencies / sample_rate_hz
    z_inverse = np.exp(-1j * omega)
    numerator = B0 + B1 * z_inverse + B2 * z_inverse**2
    denominator = 1.0 - A1 * z_inverse - A2 * z_inverse**2
    return frequencies, numerator / denominator


def amplitude_spectrum(
    samples: np.ndarray, sample_rate_hz: float
) -> tuple[np.ndarray, np.ndarray]:
    """Return a single-sided amplitude spectrum without removing DC."""
    frequency = np.fft.rfftfreq(samples.size, d=1.0 / sample_rate_hz)
    amplitude = np.abs(np.fft.rfft(samples)) / samples.size
    if samples.size > 1:
        amplitude[1:-1] *= 2.0
    return frequency, amplitude


def write_input_output_csv(
    destination: Path,
    input_samples: np.ndarray,
    output_samples: np.ndarray,
    sample_rate_hz: float,
) -> None:
    time_seconds = np.arange(input_samples.size, dtype=np.float64) / sample_rate_hz
    data = np.column_stack((time_seconds, input_samples, output_samples))
    np.savetxt(
        destination,
        data,
        delimiter=",",
        header="time,input,output",
        comments="",
        fmt="%.12g",
    )


def save_signal_plot(
    destination: Path,
    name: str,
    input_samples: np.ndarray,
    output_samples: np.ndarray,
    sample_rate_hz: float,
) -> None:
    time_ms = np.arange(input_samples.size) * 1000.0 / sample_rate_hz
    zoom_count = min(input_samples.size, max(1, round(0.020 * sample_rate_hz)))
    input_frequency, input_amplitude = amplitude_spectrum(input_samples, sample_rate_hz)
    output_frequency, output_amplitude = amplitude_spectrum(output_samples, sample_rate_hz)

    figure, axes = plt.subplots(3, 1, figsize=(12, 10), constrained_layout=True)

    axes[0].plot(time_ms, input_samples, label="Input", linewidth=1.0)
    axes[0].plot(time_ms, output_samples, label="Output", linewidth=1.1)
    axes[0].set_title(f"{name}: complete input and output ({input_samples.size} samples)")
    axes[0].set_xlabel("Time (ms)")
    axes[0].set_ylabel("Amplitude")
    axes[0].grid(True, alpha=0.3)
    axes[0].legend()

    axes[1].plot(time_ms[:zoom_count], input_samples[:zoom_count], label="Input")
    axes[1].plot(time_ms[:zoom_count], output_samples[:zoom_count], label="Output")
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
        label="Output spectrum",
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
    destination: Path,
    results: dict[str, tuple[np.ndarray, np.ndarray]],
    sample_rate_hz: float,
) -> None:
    figure, axes = plt.subplots(
        len(results), 1, figsize=(14, 2.5 * len(results)), constrained_layout=True
    )
    axes = np.atleast_1d(axes)

    for axis, (name, (input_samples, output_samples)) in zip(axes, results.items()):
        time_ms = np.arange(input_samples.size) * 1000.0 / sample_rate_hz
        axis.plot(time_ms, input_samples, label="Input", linewidth=0.9, alpha=0.8)
        axis.plot(time_ms, output_samples, label="Output", linewidth=1.0)
        axis.set_title(name)
        axis.set_xlabel("Time (ms)")
        axis.set_ylabel("Amplitude")
        axis.grid(True, alpha=0.25)
        axis.legend(loc="upper right")

    figure.suptitle(
        f"butterworth.c: complete input and output signals at {sample_rate_hz:g} Hz",
        fontsize=16,
    )
    figure.savefig(destination, dpi=160)
    plt.close(figure)


def save_frequency_response(
    destination: Path,
    csv_destination: Path,
    impulse_output: np.ndarray,
    sample_rate_hz: float,
) -> None:
    frequency, response = theoretical_frequency_response(sample_rate_hz)
    magnitude_db = 20.0 * np.log10(np.maximum(np.abs(response), 1.0e-12))
    phase_degrees = np.unwrap(np.angle(response)) * 180.0 / np.pi

    with csv_destination.open("w", newline="", encoding="utf-8") as csv_file:
        writer = csv.writer(csv_file)
        writer.writerow(("frequency_hz", "magnitude", "magnitude_db", "phase_degrees"))
        writer.writerows(zip(frequency, np.abs(response), magnitude_db, phase_degrees))

    impulse_frequency = np.fft.rfftfreq(
        impulse_output.size, d=1.0 / sample_rate_hz
    )
    impulse_response_db = 20.0 * np.log10(
        np.maximum(np.abs(np.fft.rfft(impulse_output)), 1.0e-12)
    )

    figure, axes = plt.subplots(2, 1, figsize=(11, 8), constrained_layout=True)
    axes[0].plot(frequency, magnitude_db, label="Equation from butterworth.c")
    axes[0].plot(
        impulse_frequency,
        impulse_response_db,
        "--",
        linewidth=1.0,
        label="Measured from generated impulse",
    )
    axes[0].axvline(1000.0, color="tab:red", linestyle=":", label="1 kHz cutoff")
    axes[0].axhline(-3.0, color="gray", linestyle=":", linewidth=0.9)
    axes[0].set_xlim(0.0, sample_rate_hz / 2.0)
    axes[0].set_ylim(-100.0, 5.0)
    axes[0].set_title("Butterworth magnitude response")
    axes[0].set_xlabel("Frequency (Hz)")
    axes[0].set_ylabel("Magnitude (dB)")
    axes[0].grid(True, alpha=0.3)
    axes[0].legend()

    axes[1].plot(frequency, phase_degrees)
    axes[1].set_xlim(0.0, sample_rate_hz / 2.0)
    axes[1].set_title("Butterworth phase response")
    axes[1].set_xlabel("Frequency (Hz)")
    axes[1].set_ylabel("Phase (degrees)")
    axes[1].grid(True, alpha=0.3)

    figure.savefig(destination, dpi=160)
    plt.close(figure)


def write_gain_summary(
    destination: Path, sample_rate_hz: float, test_frequencies: list[float]
) -> list[tuple[float, float, float]]:
    frequency, response = theoretical_frequency_response(sample_rate_hz)
    rows: list[tuple[float, float, float]] = []
    for test_frequency in test_frequencies:
        index = int(np.argmin(np.abs(frequency - test_frequency)))
        magnitude = float(np.abs(response[index]))
        rows.append((test_frequency, magnitude, 20.0 * np.log10(magnitude)))

    with destination.open("w", newline="", encoding="utf-8") as csv_file:
        writer = csv.writer(csv_file)
        writer.writerow(("frequency_hz", "gain", "gain_db"))
        writer.writerows(rows)
    return rows


def parse_arguments() -> argparse.Namespace:
    script_directory = Path(__file__).resolve().parent
    parser = argparse.ArgumentParser(
        description="Plot all inputs and outputs for test_files/butterworth.c"
    )
    parser.add_argument(
        "--input-dir",
        type=Path,
        default=script_directory / "inputs",
        help="directory containing one-sample-per-line .txt inputs",
    )
    parser.add_argument(
        "--output-dir",
        type=Path,
        default=script_directory / "butterworth_float_results",
        help="directory in which results are written",
    )
    parser.add_argument("--sample-rate", type=float, default=SAMPLE_RATE_HZ)
    parser.add_argument(
        "--generated-samples", type=int, default=GENERATED_SAMPLE_COUNT
    )
    return parser.parse_args()


def main() -> None:
    arguments = parse_arguments()
    if arguments.sample_rate <= 0.0:
        raise ValueError("sample rate must be positive")
    if arguments.generated_samples <= 0:
        raise ValueError("generated sample count must be positive")

    input_directory = arguments.input_dir.resolve()
    output_directory = arguments.output_dir.resolve()
    csv_directory = output_directory / "csv"
    plot_directory = output_directory / "plots"
    generated_directory = output_directory / "generated_inputs"
    for directory in (output_directory, csv_directory, plot_directory, generated_directory):
        directory.mkdir(parents=True, exist_ok=True)

    signals = load_inputs(input_directory)
    synthetic_signals = generated_inputs(arguments.generated_samples)
    signals.update(synthetic_signals)

    for name, samples in synthetic_signals.items():
        np.savetxt(generated_directory / f"{name}_{samples.size}.txt", samples, fmt="%.9f")

    results: dict[str, tuple[np.ndarray, np.ndarray]] = {}
    for name, input_samples in signals.items():
        output_samples = run_butterworth(input_samples)
        results[name] = (input_samples, output_samples)
        write_input_output_csv(
            csv_directory / f"{name}_input_output.csv",
            input_samples,
            output_samples,
            arguments.sample_rate,
        )
        save_signal_plot(
            plot_directory / f"{name}.png",
            name,
            input_samples,
            output_samples,
            arguments.sample_rate,
        )

    save_overview_plot(
        output_directory / "all_input_output.png", results, arguments.sample_rate
    )
    save_frequency_response(
        output_directory / "frequency_response.png",
        output_directory / "frequency_response.csv",
        results["impulse"][1],
        arguments.sample_rate,
    )
    gain_rows = write_gain_summary(
        output_directory / "selected_frequency_gains.csv",
        arguments.sample_rate,
        [100.0, 500.0, 1000.0, 2000.0, 4000.0],
    )

    step_output = results["step"][1]
    impulse_output = results["impulse"][1]
    print(f"Wrote results for {len(results)} signals to: {output_directory}")
    print(f"Step final output: {step_output[-1]:.9f}")
    print(f"Step maximum output: {np.max(step_output):.9f}")
    print(f"Impulse-response sum (DC gain estimate): {np.sum(impulse_output):.9f}")
    print("Selected theoretical gains:")
    for frequency_hz, gain, gain_db in gain_rows:
        print(f"  {frequency_hz:7.1f} Hz: {gain:.6f} ({gain_db:+.3f} dB)")


if __name__ == "__main__":
    main()
