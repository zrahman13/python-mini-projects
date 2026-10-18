# Session 10: Answers and Review

## Reference Solution

`solutions/report.sh` implements every requirement. Run it:

```bash
./solutions/report.sh -o ./reports sample-logs
./solutions/report.sh -t 2 -o ./reports sample-logs; echo "exit=$?"   # exit=3
./solutions/report.sh -x sample-logs                                   # usage error
./solutions/report.sh /nope                                            # not a directory
```

Expected output on the sample logs:

```
== Total ERROR lines: 7 ==
      3 Database connection timed out
      2 Upstream returned 502
      1 Upstream returned 503
      1 Disk write failed on /var/data
```

Design choices in the solution:

- **Errors are collected first** into a temp file, then used twice, for the count and the top-message list. This avoids scanning the logs twice.
- **`grep ... || true`** keeps `set -e` and `pipefail` from stopping the script when `grep` finds no matches (it exits with 1 in that case).
- **The report is written with one `{ ...; } > "$report"` group**, so every section goes to the file without a separate redirect on each line.
- **The `awk` line removes the timestamp and level fields** (`$1`, `$2`, `$3`) so identical messages group together in `uniq -c`.
- **Exit status 3** is distinct from the usage and input errors (1), so a cron job can tell "bad threshold" apart from "too many errors".

## Review Questions

These are self-check questions. Your answers should name the skills you used in each session, for example:

- Sessions 1 and 2: navigating folders, permissions, and running a script from anywhere
- Sessions 3 and 4: `grep`, `awk`, `sort`, and `uniq` for the error summary
- Session 5: the shebang, quoting, and exit codes
- Session 6: loops and functions, if you split the report into functions
- Session 7: `getopts`, `set -euo pipefail`, stderr, and `trap`
- Session 8: `find -mtime`, and the cron line you would use to run it
- Session 9: ShellCheck and bats

Check your final version with ShellCheck and the tests before you call it finished.
