#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -lt 2 ]; then
    echo "Usage: ./scripts/new_problem.sh <platform> <name>"
    echo "Example: ./scripts/new_problem.sh boj 10828"
    exit 1
fi

PLATFORM="$1"
NAME="$2"
TARGET_DIR="problems/${PLATFORM}"
TARGET_FILE="${TARGET_DIR}/${NAME}.cpp"

mkdir -p "$TARGET_DIR"

if [ -f "$TARGET_FILE" ]; then
    echo "Already exists: $TARGET_FILE"
    exit 1
fi

cp templates/main.cpp "$TARGET_FILE"
echo "Created: $TARGET_FILE"
