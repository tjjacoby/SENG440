#!/usr/bin/env bash

set -euo pipefail

VM_HOST="armhf32"
VM_DIR="/home/student/seng440/filter"

if [[ $# -ne 1 ]]; then
    echo "Usage: ./compile.sh <file.c>"
    exit 1
fi

SOURCE_FILE="$1"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CMSIS_HEADER_NAME="cmsis_compiler.h"
CMSIS_HEADER="$SCRIPT_DIR/$CMSIS_HEADER_NAME"

if [[ ! -f "$SOURCE_FILE" ]]; then
    echo "Error: '$SOURCE_FILE' does not exist."
    exit 1
fi

if [[ ! -f "$CMSIS_HEADER" ]]; then
    echo "Error: '$CMSIS_HEADER' does not exist."
    exit 1
fi

SOURCE_DIR="$(cd "$(dirname "$SOURCE_FILE")" && pwd)"
FILE_NAME="$(basename "$SOURCE_FILE")"
PROGRAM_NAME="${FILE_NAME%.c}"
OUTPUT_FILE="${PROGRAM_NAME}_output.csv"
ASSEMBLY_FILE="${PROGRAM_NAME}_assembly.s"

if [[ "$FILE_NAME" == "$PROGRAM_NAME" ]]; then
    echo "Error: the source file must end in .c"
    exit 1
fi

echo "Connecting to $VM_HOST (one password prompt)..."
echo "Sending source and CMSIS header, compiling, running, and retrieving results..."

# A single SSH session carries a tar archive in each direction. This avoids
# separate password prompts for scp, compilation, execution, and retrieval.
tar -cf - \
    -C "$SOURCE_DIR" "$FILE_NAME" \
    -C "$SCRIPT_DIR" "$CMSIS_HEADER_NAME" |
ssh "$VM_HOST" "
    mkdir -p '$VM_DIR' &&
    tar -xf - -C '$VM_DIR' &&
    cd '$VM_DIR' &&
    gcc -Wall -Wextra -O1 -mcpu=cortex-a7 \
        -I'$VM_DIR' \
        '$FILE_NAME' \
        -o '$PROGRAM_NAME' \
        -lm -lrt &&
    gcc -Wall -Wextra -O1 -mcpu=cortex-a7 \
        -I'$VM_DIR' \
        -S -fverbose-asm \
        '$FILE_NAME' \
        -o '$ASSEMBLY_FILE' &&
    './$PROGRAM_NAME' > '$OUTPUT_FILE' &&
    tar -cf - '$OUTPUT_FILE' '$ASSEMBLY_FILE'
" |
tar -xf -

echo "Done."
echo "Output saved to: $OUTPUT_FILE"
echo "Assembly saved to: $ASSEMBLY_FILE"
