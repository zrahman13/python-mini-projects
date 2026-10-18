# Session 8: Automation: find, xargs, Archives, and Cron

## Exercises

1. **Find by pattern and age.** In a scratch folder, create some `.log` files. Use `find` to list them, then narrow the search with `-mtime`. Use `touch -d '10 days ago' old.log` to make a file look old.

2. **Find and act.** Use `find . -name '*.log' -exec wc -l {} +` to count lines in each log file. Explain why `+` is faster than `\;`.

3. **Safe filenames.** Create a file named `my notes.log`. Show that `find . -name '*.log' | xargs rm` would break on it, then use `find . -name '*.log' -print0 | xargs -0 ls -l` to handle it correctly.

4. **Archive and extract.** Create a folder with a few files. Use `tar -czf` to archive it, `tar -tzf` to list the contents, and `tar -xzf` to extract it into a new folder (use `-C`).

5. **Write backup.sh.** Write a script that:
   - takes a source directory and a backup directory as arguments
   - creates `backup_YYYY-MM-DD_HHMMSS.tar.gz` in the backup directory
   - deletes archives older than 7 days
   - appends each action with a timestamp to `backup.log` in the backup directory

   Check that it fails clearly when the source is missing.

6. **Schedule it.** Look up your cron fields on https://crontab.guru. Write a crontab line that runs `backup.sh` every day at 2 a.m. Do not install it on a shared machine. Just write the line and explain each field.

7. **Compare rsync.** Run `rsync -av source/ dest/` twice. Explain what changes on the second run.

## Done When

- `backup.sh` runs, creates an archive, and cleans up old archives.
- You can explain each field in a crontab entry.
- You can answer the review questions in `answers.md` from memory.
