# Session 3: Text Processing I: grep, Regex, and Pipelines

Use the sample web server log at `session-03/data/access.log`. Each line has this format:

```
IP - - [timestamp] "METHOD /path HTTP/1.1" STATUS BYTES
```

Run commands from the repo root (`linux-scripting/`) or copy the log to your scratch folder.

## Exercises

1. **Top IP addresses.** Show the 10 IPs with the most requests, highest count first. Use `awk`, `sort`, `uniq -c`, `sort -rn`, and `head`.

2. **Count 404s.** Count how many requests returned status 404. Use `grep`. Then print the matching lines with line numbers using `grep -n`.

3. **Most requested URLs.** List the top 10 URLs (field 7 of each line) with their counts.

4. **Server errors.** Find all 5xx responses using extended regex (`grep -E`). Print only the matching lines, not the count.

5. **Case and inversion.** Use `grep -i` to find every request for `index` in any case. Use `grep -v` to list every line that is *not* a 200 response.

6. **Write an IPv4 regex.** Write a regex that matches an IPv4 address such as `192.168.1.10`. Test it with `grep -E` against the log. Then think about its weakness: why would it also match `999.999.999.999`, and how would you tighten it?

7. **Pipeline challenge.** Count requests per status code. The output should look like:
   ```
   12 200
    3 404
   ...
   ```

8. **Live watch.** Start `tail -f` on a copy of the log in one terminal, then append a line with `echo '...' >> copy.log` and watch it appear. Press `Ctrl+C` to stop.

## Done When

- You can build a pipeline of three or more commands and explain each stage.
- You can write and test a basic regex with `grep -E`.
- You can answer the review questions in `answers.md` from memory.
