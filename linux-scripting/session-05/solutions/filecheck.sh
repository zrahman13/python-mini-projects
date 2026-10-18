#!/usr/bin/env bash

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 PATH" >&2
  exit 1
fi

path="$1"
if [[ -d "$path" ]]; then
  echo "$path is a directory"
elif [[ -f "$path" ]]; then
  echo "$path is a file"
elif [[ -e "$path" ]]; then
  echo "$path exists but is neither a file nor a directory"
else
  echo "$path does not exist"
  exit 2
fi
