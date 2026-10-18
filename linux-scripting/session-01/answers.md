# Session 1: Answers and Review

## Solutions

1. Tree and files:
   ```bash
   mkdir -p project/src/utils project/docs project/logs
   touch project/src/main.py project/src/utils/helpers.py
   touch project/docs/notes1.txt project/docs/notes2.txt project/logs/app.log
   ```

2. `cd project/src/utils` moves down, `cd ../..` moves up two levels, `cd -` returns to the previous directory, and `cd ~` goes to your home directory. Absolute paths start with `/` (or `~`), and relative paths do not.

3. ```bash
   ls -R project | grep '\.txt$' > report.txt
   ```
   `ls -R` lists the tree, `grep` keeps lines ending in `.txt`, and `>` writes the result to a file.

4. ```bash
   cat project/logs/*.log | wc -l
   ```
   (`wc -l project/logs/*.log` also works and shows a per-file count.)

5. The first run prints an error to the terminal and `$?` is `2`. The second run hides the error, but `$?` is still `2`. Redirecting stderr hides the message, not the exit status.

6. `-i` prompts before overwriting, `-n` never overwrites, and `-r` (or `-R`) copies folders recursively.
   ```bash
   cp -r project project-backup
   ```

7. The pipeline lists files recursively, filters lines that end in `.txt`, and saves the output to `report.txt`. The backslash in `\.` makes the dot a literal dot.

8. `echo project/*/` prints the subfolders of `project` (`project/docs/ project/logs/ project/src/`). `ls project/docs/*.txt` lists the two note files.

9. ```bash
   date >> report.txt
   tail -n 1 report.txt
   ```

## Review Questions

- **Difference between `>` and `>>`?** `>` overwrites the file, and `>>` appends to it.
- **What does `2>/dev/null` do?** It discards standard error (messages) by sending them to `/dev/null`. It does not change the exit status.
- **Count lines in every `.log` file in a folder.** `wc -l folder/*.log` (or `cat folder/*.log | wc -l` for one total).
