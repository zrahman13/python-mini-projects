# Session 1: The Shell and Navigation

Work in a scratch folder so the repo stays clean:

```bash
mkdir -p ~/scratch/s01 && cd ~/scratch/s01
```

## Exercises

1. **Build a tree.** Create this structure with one command:
   ```
   project/
   ├── src/
   │   └── utils/
   ├── docs/
   └── logs/
   ```
   Then create these files: `project/src/main.py`, `project/src/utils/helpers.py`, `project/docs/notes1.txt`, `project/docs/notes2.txt`, `project/logs/app.log`.

2. **Look around.** Run `ls -R project`. Then `cd project/src/utils`, `pwd`, `cd ../..`, `pwd`, `cd -`, and `cd ~`. Note which paths are absolute and which are relative.

3. **Write a file list with only pipes and redirection.** Save a list of every `.txt` file under `project` into `report.txt`. (Hint: `ls -R` and `grep`.)

4. **Count log lines.** Put a few lines into each `.log` file, then count the total number of lines across all `.log` files in one command.

5. **Hide errors.** Run `ls no-such-folder`. Run it again with `2>/dev/null`. Print `$?` after each run and explain what it shows.

6. **Read the manual.** Use `man cp` or `cp --help` to find what `-i`, `-n`, and `-r` do. Copy `project` to `project-backup` with recursion, and check that it exists.

7. **Use explainshell.** Paste this into https://explainshell.com and explain each part in your own words:
   ```bash
   ls -R project | grep '\.txt$' > report.txt
   ```

8. **Use globbing.** Predict the output of `echo project/*/` and `ls project/docs/*.txt`, then run them to check.

9. **Challenge.** Append the current date to `report.txt` without deleting its existing contents. Then print the last line of the file.

## Done When

- You can explain `>` versus `>>` and `2>/dev/null` without looking.
- You can move around with absolute and relative paths.
- You can answer the review questions in `answers.md` from memory.
