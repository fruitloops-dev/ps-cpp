#!/usr/bin/env bash
set -euo pipefail

usage() {
    echo "Usage:"
    echo "  psrun <problem_id>"
    echo "  psrun <site> <problem_id>"
    echo "  psrun <source.cpp>"
    echo
    echo "Examples:"
    echo "  psrun 10828"
    echo "  psrun boj 10828"
    echo "  psrun programmers 42586"
    echo "  psrun problems/boj/10828.cpp"
}

if [ $# -lt 1 ]; then
    usage
    exit 1
fi

ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
ROOT_ABS="$(realpath "$ROOT")"

find_source() {
    cd "$ROOT_ABS"

    if [ $# -eq 1 ]; then
        local arg="$1"

        if [ -f "$arg" ]; then
            realpath "$arg"
            return
        fi

        if [ -f "$arg.cpp" ]; then
            realpath "$arg.cpp"
            return
        fi

        shopt -s globstar nullglob
        local candidates=(problems/**/"$arg.cpp")

        if [ ${#candidates[@]} -eq 0 ]; then
            echo "Source file not found: $arg" >&2
            exit 1
        fi

        if [ ${#candidates[@]} -gt 1 ]; then
            echo "Multiple source files found:" >&2
            printf '  %s\n' "${candidates[@]}" >&2
            echo
            echo "Please specify the site, for example:" >&2
            echo "  psrun boj $arg" >&2
            echo "  psrun programmers $arg" >&2
            exit 1
        fi

        realpath "${candidates[0]}"
        return
    fi

    if [ $# -eq 2 ]; then
        local site="$1"
        local problem="$2"
        local path="problems/$site/$problem.cpp"

        if [ ! -f "$path" ]; then
            echo "Source file not found: $path" >&2
            exit 1
        fi

        realpath "$path"
        return
    fi

    usage >&2
    exit 1
}

SRC_ABS="$(find_source "$@")"

if [[ "$SRC_ABS" != *.cpp ]]; then
    echo "Not a C++ source file: $SRC_ABS" >&2
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
