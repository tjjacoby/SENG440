# Filter input signals

Each `.txt` file contains one normalized sample per line with no header. The
sample rate is 10 kHz, and all values stay in the intended `[-1.0, +1.0]`
input range.

| File | Samples | Signal |
| --- | ---: | --- |
| `sine_100hz_2000.txt` | 2000 | 100 Hz sine, amplitude 0.8 |
| `sine_500hz_2000.txt` | 2000 | 500 Hz sine, amplitude 0.8 |
| `sine_1000hz_2000.txt` | 2000 | 1 kHz cutoff test, amplitude 0.8 |
| `sine_2000hz_2000.txt` | 2000 | 2 kHz stop-band test, amplitude 0.8 |
| `sine_4000hz_2000.txt` | 2000 | 4 kHz attenuation test, amplitude 0.8 |
| `multitone_2000.txt` | 2000 | Combined 100, 500, 1000, 2000, and 4000 Hz tones |
| `peak_pattern_1000.txt` | 1000 | A 0.95 peak, a -0.30 dip, then 0.55, 0.35, and 0.20 peaks |

## Expected program interface

The intended command is:

```sh
./fixedpoint_input inputs/sine_1000hz_2000.txt 2000 > fixedpoint_input_output.csv
```

`fixedpoint_input.c` reads each value as a `double`, checks that it is between
-1.0 and +1.0, and converts it to Q14. Its CSV output includes the header
expected by `plot_filter.py`:

```text
time,input,output
```

The current `compile.sh` runs programs without command-line arguments, so an
input-driven executable must either be run manually on the VM or the script
must later be taught to forward the filename and sample count.
