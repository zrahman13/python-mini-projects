# Linux Scripting: 20-Hour Plan Practice Files

Companion files for the 10-session plan. Each session has:

- `exercises.md`: the tasks to do yourself (try them before opening answers)
- `answers.md`: answers to the 15-minute review questions, plus solutions
- `data/`, `sample-logs/`: sample input files for the exercises
- `solutions/`: working reference scripts, to run and read after you attempt your own

## Schedule

| Session | Topic | Study | Review |
|---|---|---|---|
| 1 | The shell and navigation | 2h | 15m |
| 2 | Permissions, processes, environment | 2h | 15m |
| 3 | Text processing I: grep, regex, pipelines | 2h | 15m |
| 4 | Text processing II: sed and awk | 2h | 15m |
| 5 | First bash scripts | 2h | 15m |
| 6 | Loops, functions, arrays | 2h | 15m |
| 7 | Robust scripts: errors, options, logging | 2h | 15m |
| 8 | Automation: find, xargs, archives, cron | 2h | 15m |
| 9 | Debugging, testing, refactoring | 2h | 15m |
| 10 | Capstone: system health reporter | 2h | 15m |

## Running the Scripts

Make a script executable once, then run it:

```bash
chmod +x session-05/solutions/greet.sh
./session-05/solutions/greet.sh Ada
```

Check any script for common mistakes with ShellCheck (https://www.shellcheck.net, or install it with your package manager as `shellcheck`).

## Tests

Sessions 9 and 10 use bats-core (https://github.com/bats-core/bats-core):

```bash
bats session-09/tests/backup.bats
bats session-10/tests/report.bats
```

## Suggested Workflow

1. Read the session's topic notes in the plan.
2. Attempt every exercise in `exercises.md` in a scratch folder (for example `~/scratch/sNN`), not in this repo.
3. Check your results against `answers.md`.
4. Compare your script to the file in `solutions/`, then close the reference and rewrite it from memory.
5. Do the 15-minute review questions from `answers.md` without looking first.
