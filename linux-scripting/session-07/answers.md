# Session 7: Answers and Review

## Solutions

1. With `set -u`, `echo "$missing"` fails with `missing: unbound variable` instead of silently printing nothing.
   - `set -e` exits on the first command that fails, which stops silent failures.
   - `set -o pipefail` makes a pipeline fail if any command in it fails, not just the last one. Without it, `false | true` succeeds.

2. The `getopts` loop is in `solutions/robust_word_count.sh`. The key details:
   - `":vo:h"`: the leading `:` enables silent error handling, so `$OPTARG` holds the bad option letter. The `o:` means `-o` takes a value.
   - `:)` handles a missing value for `-o`, and `*)` handles unknown options.
   - `shift $((OPTIND - 1))` removes parsed options so `$1` is the first real argument.

3. ```bash
   echo "Error: ..." >&2
   ```
   Errors on stderr can be separated from normal output, for example with `2>errors.log`, and piped programs still see clean stdout.

4. The `log` function in `solutions/robust_word_count.sh` checks the `verbose` flag and writes `date +%F_%T` timestamps to stderr.

5. ```bash
   tmp="$(mktemp)"
   trap 'rm -f "$tmp"' EXIT
   ```
   `EXIT` runs on normal exit, on `exit`, and on errors that stop the script under `set -e`. The trap command is in single quotes so `$tmp` is expanded when the trap runs, not when it is set.

6. and 7. These are reading tasks. Good choices from the pitfalls page include unquoted variables (`$var` vs. `"$var"`) and using `$(ls)` in loops.

## Review Questions

- **What do `-e`, `-u`, and `pipefail` each catch?** `-e` stops on a failed command. `-u` stops on an unset variable. `pipefail` fails a pipeline when any stage fails.
- **Why should error messages go to stderr?** It keeps error text out of the data stream, so output can be piped or redirected without mixing in errors.
- **Why is `trap ... EXIT` useful for cleanup?** It runs the cleanup command on every exit path, including early exits and failures, so temporary files are not left behind.
