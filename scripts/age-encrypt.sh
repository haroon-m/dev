#!/bin/bash
set -e

INPUT="$1"       # File or directory to encrypt
OUTPUT="$2"      # Output .age file

if [[ -z "$INPUT" || -z "$OUTPUT" ]]; then
    echo "Usage: $0 <file-or-dir> <output.age>"
    exit 1
fi

TMPFILE=$(mktemp --suffix=.tar.gz)

# Archive if it's a directory
if [ -d "$INPUT" ]; then
    tar -chzf "$TMPFILE" -C "$(dirname "$INPUT")" "$(basename "$INPUT")"
else
    cp "$INPUT" "$TMPFILE"
fi

# Encrypt using passphrase
age -p -o "$OUTPUT" "$TMPFILE"
rm "$TMPFILE"

echo "✅ Encrypted '$INPUT' → '$OUTPUT'"

