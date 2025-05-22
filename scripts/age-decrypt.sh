#!/bin/bash
set -e

INPUT="$1"       # .age file to decrypt
OUTPUT_DIR="$2"  # Output directory to extract files into

if [[ -z "$INPUT" || -z "$OUTPUT_DIR" ]]; then
    echo "Usage: $0 <encrypted.age> <output-dir>"
    exit 1
fi

mkdir -p "$OUTPUT_DIR"
TMPFILE=$(mktemp --suffix=.tar.gz)

# Decrypt using passphrase
age -d -o "$TMPFILE" "$INPUT"
tar -xzf "$TMPFILE" -C "$OUTPUT_DIR"
rm "$TMPFILE"

echo "✅ Decrypted '$INPUT' → '$OUTPUT_DIR'"

