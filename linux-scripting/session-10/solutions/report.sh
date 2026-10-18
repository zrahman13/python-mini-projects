#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<EOF
Usage: $(basename "$0") [-d DAYS] [-t MAX_ERRORS] [-o REPORT_DIR] LOG_DIR
  -d DAYS         count log files older than DAYS days (default 7)
  -t MAX_ERRORS   exit 3 if total ERROR lines exceed this (default 10)
  -o REPORT_DIR   folder for reports and the run log (default ./reports)
  -h              show this help
EOF
}

days=7
max_errors=10
report_dir="./reports"

while getopts ":d:t:o:h" opt; do
  case "$opt" in
    d) days="$OPTARG" ;;
    t) max_errors="$OPTARG" ;;
    o) report_dir="$OPTARG" ;;
    h) usage; exit 0 ;;
    :) echo "Error: -$OPTARG needs a value" >&2; exit 1 ;;
    *) echo "Error: unknown option -$OPTARG" >&2; usage >&2; exit 1 ;;
  esac
done
shift $((OPTIND - 1))

if [[ $# -ne 1 ]]; then
  echo "Error: expected one LOG_DIR" >&2
  usage >&2
  exit 1
fi

log_dir="$1"
if [[ ! -d "$log_dir" ]]; then
  echo "Error: $log_dir is not a directory" >&2
  exit 1
fi

mkdir -p "$report_dir"
timestamp="$(date +%F_%H%M%S)"
report="$report_dir/report_${timestamp}.txt"
run_log="$report_dir/runs.log"

tmp="$(mktemp)"
trap 'rm -f "$tmp"' EXIT

# Collect every ERROR line from the logs into a temp file.
grep -rhw 'ERROR' --include='*.log' "$log_dir" > "$tmp" || true
error_count=$(wc -l < "$tmp")

{
  echo "System health report"
  echo "Generated: $(date '+%F %T')"
  echo "Log directory: $log_dir"
  echo

  echo "== Disk usage =="
  df -h "$log_dir" | tail -n 1
  du -sh "$log_dir"
  echo

  echo "== Log files older than ${days} days =="
  find "$log_dir" -type f -name '*.log' -mtime +"$days" | wc -l
  echo

  echo "== Total ERROR lines: ${error_count} =="
  awk '{ $1 = ""; $2 = ""; $3 = ""; sub(/^ +/, ""); print }' "$tmp" \
    | sort | uniq -c | sort -rn | head -n 5
} > "$report"

printf '%s run on %s: %s errors\n' "$(date '+%F %T')" "$log_dir" "$error_count" >> "$run_log"
echo "Report written to $report"

if (( error_count > max_errors )); then
  echo "Error count $error_count exceeds limit $max_errors" >&2
  exit 3
fi
