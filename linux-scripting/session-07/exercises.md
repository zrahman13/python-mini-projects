# Session 7: Robust Scripts: Errors, Options, and Logging

Start from your Session 6 `word_count.sh`, or use `solutions/robust_word_count.sh` as a reference after you attempt it yourself.

## Exercises

1. **Strict mode.** Add `set -euo pipefail` to the top of a script that uses an unset variable (`echo "$missing"`). Run it and explain the error. Then explain what `-e` and `pipefail` each catch, using `false | true` and `grep nope file | wc -l` as tests.

2. **Options with getopts.** Add these options to your script:
   - `-v` turns on verbose logging
   - `-o FILE` writes results to a file
   - `-h` prints usage and exits 0

   Unknown options and a missing argument to `-o` must print an error and exit 1.

3. **Errors to stderr.** Make every error message go to standard error (`>&2`). Verify with `./script.sh nope 2>/dev/null`, which should show no error text.

4. **Timestamped logs.** Write a `log` function that prints `[YYYY-MM-DD_HH:MM:SS] message` to stderr, and only when verbose mode is on.

5. **Cleanup with trap.** Create a temporary file with `mktemp`. Add `trap 'rm -f "$tmp"' EXIT` so it is removed even if the script fails partway. Test it by adding `exit 1` in the middle and checking that the temp file is gone.

6. **Read the pitfalls.** Open Bash Pitfalls (https://mywiki.wooledge.org/BashPitfalls) and read the first 10 entries. Pick the two you think are most likely to bite you and write a one-line note on each.

7. **Read the style guide.** Skim the Google Shell Style Guide's sections on naming and quoting, and change at least one thing in your script to match it.

## Done When

- Your script stops on errors and reports them clearly.
- Options are handled with `getopts`, including bad input.
- Temporary files are cleaned up automatically.
- You can answer the review questions in `answers.md` from memory.
