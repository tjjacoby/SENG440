#!/usr/bin/env bash

set -euo pipefail

VM_HOST="armhf32"
VM_DIR="/home/student/seng440/filter"

if [[ $# -ne 1 ]]; then
    echo "Usage: ./compile.sh <file.c>"
    exit 1
fi

SOURCE_FILE="$1"

if [[ ! -f "$SOURCE_FILE" ]]; then
    echo "Error: '$SOURCE_FILE' does not exist."
    exit 1
fi

FILE_NAME="$(basename "$SOURCE_FILE")"
PROGRAM_NAME="${FILE_NAME%.c}"
OUTPUT_FILE="${PROGRAM_NAME}_output.csv"

if [[ "$FILE_NAME" == "$PROGRAM_NAME" ]]; then
    echo "Error: the source file must end in .c"
    exit 1
fi

echo "Copying $SOURCE_FILE to the VM..."
scp "$SOURCE_FILE" "$VM_HOST:$VM_DIR/$FILE_NAME"

echo "Compiling on the ARM VM..."
ssh "$VM_HOST" "
    cd '$VM_DIR' &&
    gcc -Wall -Wextra -O2 -mcpu=cortex-a7 \
        '$FILE_NAME' \
        -o '$PROGRAM_NAME' \
        -lm
"

echo "Running $PROGRAM_NAME..."
ssh "$VM_HOST" "
    cd '$VM_DIR' &&
    './$PROGRAM_NAME' > '$OUTPUT_FILE'
"

echo "Copying $OUTPUT_FILE back to this folder..."
scp "$VM_HOST:$VM_DIR/$OUTPUT_FILE" "./$OUTPUT_FILE"

echo "Done."
echo "Output saved to: $OUTPUT_FILE"