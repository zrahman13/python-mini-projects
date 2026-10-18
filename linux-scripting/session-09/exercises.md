# Session 9: Debugging, Testing, and Refactoring

## Exercises

1. **Trace a script.** Run `bash -x session-08/solutions/backup.sh <src> <dst>` on a scratch folder. Read the trace and find the line where the archive name is built. Then set a custom prompt for the trace: `PS4='+ line $LINENO: ' bash -x script.sh ...`.

2. **Lint your scripts.** Run ShellCheck on every script you wrote in Sessions 5 to 8. Fix each warning, and for any warning you disagree with, write a comment explaining why before disabling it with `# shellcheck disable=SCxxxx`.

3. **Fix the buggy script.** Open `data/buggy.sh`. It has at least five problems. List every one you find (hint: check quoting, `cd` error handling, `$(ls)`, backticks, `[ ]` and `-gt`, and what `rm -rf` would do if `$1` is empty). Then write a fixed version named `data/fixed.sh`.

4. **Run the tests.** Install bats-core, then run `bats session-09/tests/backup.bats`. Make all three tests pass. If one fails, read its output and fix the cause, not the test.

5. **Write one more test.** Add a test that checks the log file gets a line for each run.

6. **Refactor.** Pick one script and make it easier to read without changing its behavior: name your functions clearly, move repeated code into a function, and rerun your tests.

## Done When

- ShellCheck reports no unexplained warnings on your scripts.
- All bats tests pass.
- You can explain how `bash -x` helps you find a bug.
- You can answer the review questions in `answers.md` from memory.
