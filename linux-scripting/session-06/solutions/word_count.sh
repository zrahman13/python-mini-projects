#!/usr/bin/env bash

count_words() {
  local file="$1"
  wc -w < "$file"
}

main() {
  local dir="${1:-.}"
  local file name
  declare -A counts

  for file in "$dir"/*.txt; do
    if [[ ! -e "$file" ]]; then
      echo "No .txt files in $dir" >&2
      return 1
    fi
    counts["$(basename "$file")"]=$(count_words "$file")
  done

  for name in "${!counts[@]}"; do
    printf '%s %s\n' "${counts[$name]}" "$name"
  done | sort -rn
}

main "$@"
