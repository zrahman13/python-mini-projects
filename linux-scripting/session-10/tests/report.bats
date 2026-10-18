#!/usr/bin/env bats

setup() {
  SCRIPT="$BATS_TEST_DIRNAME/../solutions/report.sh"
  TMP="$(mktemp -d)"
  LOGS="$TMP/logs"
  mkdir -p "$LOGS"
  printf '2026-10-10 08:00:01 ERROR Disk full\n' > "$LOGS/app.log"
  printf '2026-10-10 08:00:02 INFO Started\n' >> "$LOGS/app.log"
}

teardown() {
  rm -rf "$TMP"
}

@test "writes a report and a run log entry" {
  run "$SCRIPT" -o "$TMP/reports" "$LOGS"
  [ "$status" -eq 0 ]
  ls "$TMP"/reports/report_*.txt
  grep -q '1 errors' "$TMP/reports/runs.log"
}

@test "exits 3 when ERROR lines exceed the limit" {
  run "$SCRIPT" -t 0 -o "$TMP/reports" "$LOGS"
  [ "$status" -eq 3 ]
  [[ "$output" == *"exceeds limit"* ]]
}

@test "rejects an unknown option with exit status 1" {
  run "$SCRIPT" -x "$LOGS"
  [ "$status" -eq 1 ]
  [[ "$output" == *"unknown option"* ]]
}
