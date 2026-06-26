#!/usr/bin/env bash
set -euo pipefail

if [ $# -lt 1 ]; then
    echo "Usage:"
    echo "  psrun <source.cpp>"
    echo "  psrun <problem_id>"
    echo
    echo "Examples:"
    echo "  psrun problems/boj/1000.cpp"
    echo "  psrun 1000"
    exit 1
fi

ARG="$1"
ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
ROOT_ABS="$(realpath "$ROOT")"

find_source() {
    local arg="$1"

    if [ -f "$arg" ]; then
        realpath "$arg"
        return
    fi

    if [ -f "$arg.cpp" ]; then
        realpath "$arg.cpp"
        return
    fi

    cd "$ROOT_ABS"
    shopt -s globstar nullglob
    local candidates=(problems/**/"$arg.cpp")

    if [ ${#candidates[@]} -eq 0 ]; then
        echo "Source file not found: $arg" >&2
        exit 1
    fi

    if [ ${#candidates[@]} -gt 1 ]; then
        echo "Multiple source files found:" >&2
        printf '  %s\n' "${candidates[@]}" >&2
        echo "Please run with a full path." >&2
        exit 1
    fi

    realpath "${candidates[0]}"
}

SRC_ABS="$(find_source "$ARG")"

if [[ "$SRC_ABS" != *.cpp ]]; then
    echo "Not a C++ source file: $SRC_ABS"
    exit 1
fi

REL="$(realpath --relative-to="$ROOT_ABS" "$SRC_ABS")"
BASE_NO_EXT="${REL%.cpp}"

OUT="$ROOT_ABS/build/$BASE_NO_EXT"
mkdir -p "$(dirname "$OUT")"

echo "Compiling: $REL"
g++ -std=c++17 -O2 -Wall -Wextra -Wshadow "$SRC_ABS" -o "$OUT"

echo
echo "Running: $OUT"
echo "--------------------"

"$OUT"
