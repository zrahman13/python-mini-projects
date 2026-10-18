#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<EOF
Usage: $(basename "$0") [-v] [-o FILE] DIR
  -v        log progress to stderr
  -o FILE   write results to FILE instead of stdout
  -h        show this help
EOF
}

log() {
  if [[ "$verbose" == true ]]; then
    printf '[%s] %s\n' "$(date +%F_%T)" "$*" >&2
  fi
}

verbose=false
output=""

while getopts ":vo:h" opt; do
  case "$opt" in
    v) verbose=true ;;
    o) output="$OPTARG" ;;
    h) usage; exit 0 ;;
    :) echo "Error: -$OPTARG needs an argument" >&2; exit 1 ;;
    *) echo "Error: unknown option -$OPTARG" >&2; usage >&2; exit 1 ;;
  esac
done
shift $((OPTIND - 1))

if [[ $# -ne 1 ]]; then
  echo "Error: expected one directory" >&2
  usage >&2
  exit 1
fi

dir="$1"
if [[ ! -d "$dir" ]]; then
  echo "Error: $dir is not a directory" >&2
  exit 1
fi

shopt -s nullglob
files=("$dir"/*.txt)
if (( ${#files[@]} == 0 )); then
  echo "Error: no .txt files in $dir" >&2
  exit 1
fi

tmp="$(mktemp)"
trap 'rm -f "$tmp"' EXIT

for file in "${files[@]}"; do
  log "counting $file"
  printf '%s %s\n' "$(wc -w < "$file")" "$(basename "$file")" >> "$tmp"
done

if [[ -n "$output" ]]; then
  sort -rn "$tmp" > "$output"
  log "wrote $output"
else
  sort -rn "$tmp"
fi
