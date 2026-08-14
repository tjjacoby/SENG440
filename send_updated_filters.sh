#!/usr/bin/env bash

# Upload the updated filter sources and benchmark script in one SSH session.
# Run this script locally from Git Bash, WSL, or another Bash shell.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VM_HOST="${1:-student@armhf32}"
VM_DIR="${2:-/home/student/seng440/filter}"

if ! command -v ssh >/dev/null 2>&1; then
    echo "Error: ssh is not installed or not in PATH." >&2
    exit 1
fi

if ! command -v tar >/dev/null 2>&1; then
    echo "Error: tar is not installed or not in PATH." >&2
    exit 1
fi

shopt -s nullglob
butterworth_paths=("$SCRIPT_DIR"/butterworth*.c)
shopt -u nullglob

if [[ "${#butterworth_paths[@]}" -eq 0 ]]; then
    echo "Error: no butterworth*.c files were found in $SCRIPT_DIR." >&2
    exit 1
fi

file_names=("script.py" "bw_noOpt-2.c")
for source_path in "${butterworth_paths[@]}"; do
    file_names+=("$(basename "$source_path")")
done

for file_name in "${file_names[@]}"; do
    if [[ ! -f "$SCRIPT_DIR/$file_name" ]]; then
        echo "Error: required file '$SCRIPT_DIR/$file_name' was not found." >&2
        exit 1
    fi
done

echo "Uploading ${#file_names[@]} files to $VM_HOST:$VM_DIR"
printf "  %s\n" "${file_names[@]}"
echo
echo "One SSH password prompt may appear."

tar -cf - -C "$SCRIPT_DIR" "${file_names[@]}" |
ssh "$VM_HOST" "
    set -e
    mkdir -p '$VM_DIR'
    tar -xf - -C '$VM_DIR'
    echo 'Upload completed on the VM.'
    echo 'Destination: $VM_DIR'
"

echo
echo "Done. Run the benchmark with:"
echo "  ssh $VM_HOST"
echo "  cd $VM_DIR"
echo "  python3 script.py 4"
