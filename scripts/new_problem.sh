#!/usr/bin/env bash
set -euo pipefail

if [ $# -lt 2 ]; then
    echo "Usage: ./scripts/new_problem.sh <site> <problem_id>"
    echo "Example: ./scripts/new_problem.sh boj 10828"
    exit 1
fi

SITE="$1"
PROBLEM="$2"

DIR="problems/$SITE"
CPP="$DIR/$PROBLEM.cpp"

mkdir -p "$DIR"

if [ ! -f "$CPP" ]; then
    cp templates/main.cpp "$CPP"
    echo "Created: $CPP"
else
    echo "Already exists: $CPP"
fi
