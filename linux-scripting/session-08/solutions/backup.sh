#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 2 ]]; then
  echo "Usage: $0 SOURCE_DIR BACKUP_DIR" >&2
  exit 1
fi

source_dir="$1"
backup_dir="$2"

if [[ ! -d "$source_dir" ]]; then
  echo "Error: source $source_dir not found" >&2
  exit 1
fi

mkdir -p "$backup_dir"
log_file="$backup_dir/backup.log"

log() {
  printf '%s %s\n' "$(date '+%F %T')" "$*" | tee -a "$log_file"
}

timestamp="$(date +%F_%H%M%S)"
archive="$backup_dir/backup_${timestamp}.tar.gz"

tar -czf "$archive" -C "$(dirname "$source_dir")" "$(basename "$source_dir")"
log "created $archive"

find "$backup_dir" -name 'backup_*.tar.gz' -mtime +7 -print -delete |
  while read -r old; do
    log "deleted $old"
  done
