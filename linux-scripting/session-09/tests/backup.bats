#!/usr/bin/env bats

setup() {
  SCRIPT="$BATS_TEST_DIRNAME/../../session-08/solutions/backup.sh"
  TMP="$(mktemp -d)"
  mkdir -p "$TMP/src"
  echo "hello" > "$TMP/src/file.txt"
}

teardown() {
  rm -rf "$TMP"
}

@test "creates a dated archive" {
  run "$SCRIPT" "$TMP/src" "$TMP/backups"
  [ "$status" -eq 0 ]
  ls "$TMP"/backups/backup_*.tar.gz
}

@test "fails with a clear message when the source is missing" {
  run "$SCRIPT" "$TMP/missing" "$TMP/backups"
  [ "$status" -ne 0 ]
  [[ "$output" == *"not found"* ]]
}

@test "deletes archives older than 7 days" {
  mkdir -p "$TMP/backups"
  touch -d '10 days ago' "$TMP/backups/backup_old.tar.gz"
  run "$SCRIPT" "$TMP/src" "$TMP/backups"
  [ "$status" -eq 0 ]
  [ ! -e "$TMP/backups/backup_old.tar.gz" ]
}
