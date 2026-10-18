# Session 5: Your First Real Bash Scripts

Work in `session-05/` or a scratch folder. Check each script with ShellCheck when you finish it.

## Exercises

1. **Hello script.** Write `greet.sh`. It takes one argument (a name) and prints `Hello, NAME!`. If no argument is given, it prints a usage message to stderr and exits with status 1.

2. **File checker.** Write `filecheck.sh`. It takes one path and reports whether it is:
   - a directory
   - a regular file
   - something else that exists
   - missing (exit with status 2 in this case)

3. **Quoting experiment.** Create a variable with a space in it: `name="Ada Lovelace"`. Then run:
   ```bash
   ls $name
   ls "$name"
   ```
   Explain the different results. Then try `echo '$name'` and `echo "$name"`.

4. **Exit status.** Run `grep root /etc/passwd; echo $?` and `grep no-such-user /etc/passwd; echo $?`. Explain both results.

5. **Test syntax.** Practice `[[ -f file ]]`, `[[ -z "$var" ]]`, and `[[ "$a" == "$b" ]]` in an `if` statement. Then write the same check with `case`.

6. **Command substitution.** Store today's date in a variable with `today=$(date +%F)`, and print a message that includes it.

## Done When

- Both scripts run correctly with and without arguments.
- ShellCheck reports no warnings you cannot explain.
- You can answer the review questions in `answers.md` from memory.
