# Session 10: Capstone Project

## Goal

Build a **system health and log reporter**. Starting from scratch, or from `solutions/report.sh` after you attempt your own version, it should:

1. Take a log folder as an argument, plus optional flags:
   - `-d DAYS` to count log files older than N days (default 7)
   - `-t MAX_ERRORS` to set the error limit (default 10)
   - `-o REPORT_DIR` for the output folder (default `./reports`)
   - `-h` for usage
2. Report disk usage of the log folder (`df`, `du`).
3. Count log files older than the threshold (`find -mtime`).
4. List the top five ERROR messages with their counts, using `grep`, `awk`, `sort`, and `uniq`.
5. Write a timestamped report file to the report folder.
6. Append a line to `runs.log` in the report folder for each run.
7. Exit with status 3 if total ERROR lines exceed the limit, and 0 otherwise.

## Requirements

- Starts with `#!/usr/bin/env bash` and `set -euo pipefail`
- Uses `getopts` and `shift` for arguments
- Errors go to stderr, with a clear message and nonzero exit
- Uses a `trap` to remove temporary files
- Passes ShellCheck with no unexplained warnings
- Has at least three bats tests in `session-10/tests/`

## Test Data

Sample logs are in `session-10/sample-logs/`. Each line has the format `YYYY-MM-DD HH:MM:SS LEVEL message`. To test the age check, make a copy of the logs and age one file:

```bash
cp -r session-10/sample-logs ~/scratch/s10-logs
touch -d '10 days ago' ~/scratch/s10-logs/server.log
```

## Stretch Goals (Optional)

- Add a `-q` quiet flag that prints only the exit status.
- Count `WARN` lines as well, and show them in a separate section.
- Add the script to cron, using the format from Session 8.
- Add a short README next to the script with two example commands.

## Finish Line

- Run the report on the sample logs and read the output.
- Run it with a low limit (`-t 2`) and confirm exit status 3.
- Run it with a bad option and a missing folder, and confirm clear errors.
- Write one paragraph describing what you would change next.
