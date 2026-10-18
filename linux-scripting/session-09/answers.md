# Session 9: Answers and Review

## Solutions

1. `bash -x` prints each command after expansion, prefixed with `+`. Looking at the trace shows the actual values of `$timestamp` and `$archive`. Setting `PS4` to include `$LINENO` shows which line each command came from.

2. Common ShellCheck warnings and fixes:
   - `SC2086`: unquoted variable. Fix: `"$var"`.
   - `SC2046`: unquoted command substitution. Fix: quote it, or use `while read` or `mapfile`.
   - `SC2164`: `cd` without an error check. Fix: `cd "$dir" || exit 1`.

3. The bugs in `data/buggy.sh`:
   1. `dir=$1` and `cd $dir` are unquoted. A path with spaces breaks.
   2. `cd $dir` has no error check. If it fails, the script keeps running in the wrong folder.
   3. `for f in $(ls *.txt)` breaks on filenames with spaces.
   4. `` `wc -l < $f` `` uses old backtick syntax and an unquoted `$f`.
   5. `[ ... -gt 5 ]` with a command that can print nothing is fragile. `(( ))` arithmetic is clearer.
   6. `rm -rf $dir/tmp/*` runs after `cd`, so the path is relative to the wrong folder. If `$dir` is empty, it becomes `/tmp/*`, which deletes files outside the intended folder.

   A fixed version:
   ```bash
   #!/usr/bin/env bash
   set -euo pipefail

   dir="${1:?Usage: $0 DIR}"
   shopt -s nullglob

   for f in "$dir"/*.txt; do
     lines=$(wc -l < "$f")
     if (( lines > 5 )); then
       echo "Long file: $(basename "$f")"
     fi
   done
   ```
   The `${1:?...}` form stops with a message if the argument is missing, which guards against accidental deletions. The `rm -rf` line is removed on purpose. If you need cleanup, write `rm -rf -- "${dir:?}/tmp"`, where `:?` aborts when the variable is empty.

4. and 5. The tests are in `tests/backup.bats`. Install bats-core from https://github.com/bats-core/bats-core and run:
   ```bash
   bats session-09/tests/backup.bats
   ```
   For the log test, add a case that checks `grep -q created "$TMP/backups/backup.log"` after a successful run.

6. Refactoring is only done when the tests still pass afterward.

## Review Questions

- **What does `bash -x script.sh` show you?** Each command as it runs, after variable expansion, so you can see the real values.
- **Name two bugs ShellCheck finds, and their fixes.** Unquoted variables (`SC2086`, fix: quote them) and `cd` without an error check (`SC2164`, fix: `cd "$dir" || exit 1`).
- **Why do tests make refactoring safer?** They show whether behavior changed, so you can change the code without guessing.
