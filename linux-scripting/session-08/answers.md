# Session 8: Answers and Review

## Solutions

1. ```bash
   find . -name '*.log' -mtime +7      # modified more than 7 days ago
   find . -name '*.log' -mtime -1      # modified in the last day
   ```

2. ```bash
   find . -name '*.log' -exec wc -l {} +
   ```
   With `+`, `find` passes many filenames to one `wc` call. With `\;`, it runs `wc` once per file, which is slower.

3. `find . -name '*.log' | xargs rm` splits `my notes.log` into `my` and `notes.log`, so it fails. The safe form uses a null separator:
   ```bash
   find . -name '*.log' -print0 | xargs -0 ls -l
   ```

4. ```bash
   tar -czf backup.tar.gz myfolder
   tar -tzf backup.tar.gz
   mkdir restored && tar -xzf backup.tar.gz -C restored
   ```

5. The script is in `solutions/backup.sh`:
   ```bash
   ./solutions/backup.sh ~/projects ~/backups
   ```
   Key points:
   - `tar -C` changes into the parent folder first, so the archive stores a clean relative path.
   - `find ... -mtime +7 -print -delete` deletes old backups and prints each name so the loop can log it.

6. A cron line for 2 a.m. daily:
   ```
   0 2 * * * /home/user/linux-scripting/session-08/solutions/backup.sh /home/user/projects /home/user/backups
   ```
   Fields: minute (0), hour (2), day of month (any `*`), month (any `*`), day of week (any `*`).

7. The first run copies everything. The second run copies only changed files, because `rsync` compares sizes and timestamps.

## Review Questions

- **What does `find . -name "*.log" -mtime +7 -delete` do?** It deletes `.log` files under the current folder that were last modified more than 7 days ago. Test it with `-print` first.
- **Why is `-print0 | xargs -0` safer?** Filenames are separated by a null byte, which cannot appear in a filename, so spaces and newlines are handled correctly.
- **What are the five fields in a crontab entry?** Minute, hour, day of month, month, day of week.
