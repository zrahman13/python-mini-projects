# Session 3: Answers and Review

## Solutions

1. ```bash
   awk '{print $1}' data/access.log | sort | uniq -c | sort -rn | head -n 10
   ```
   Expected top three: `10.0.0.5` (6), `192.168.1.10` (5), `172.16.0.7` (4).

2. ```bash
   grep -c '" 404 ' data/access.log      # 5
   grep -n '" 404 ' data/access.log
   ```
   The quotes around the space-padded `404` make the match precise, so a byte count such as `1404` is not matched.

3. ```bash
   awk '{print $7}' data/access.log | sort | uniq -c | sort -rn | head -n 10
   ```
   Expected top result: `/index.html` (8).

4. ```bash
   grep -E '" 5[0-9]{2} ' data/access.log
   ```
   Two lines match: the `/products/list` 500 and the `/dashboard` 500.

5. ```bash
   grep -i 'index' data/access.log
   grep -v '" 200 ' data/access.log
   ```

6. A simple regex:
   ```bash
   grep -E '[0-9]{1,3}(\.[0-9]{1,3}){3}' data/access.log
   ```
   It also matches `999.999.999.999` because it checks only digit counts. A tighter version limits each octet to 0 to 255:
   ```bash
   grep -E '(25[0-5]|2[0-4][0-9]|1?[0-9]{1,2})(\.(25[0-5]|2[0-4][0-9]|1?[0-9]{1,2})){3}'
   ```

7. ```bash
   awk '{print $9}' data/access.log | sort | uniq -c | sort -rn
   ```

8. `tail -f` keeps the file open and prints new lines as they are appended. This is the standard way to watch logs.

## Review Questions

- **Write a regex that matches an IPv4 address.** `[0-9]{1,3}(\.[0-9]{1,3}){3}` (basic form, shown above).
- **What does `sort | uniq -c | sort -rn` produce?** Each distinct line with its count, sorted from most to least frequent. `uniq` only removes *adjacent* duplicates, which is why the first `sort` is needed.
- **Why does `grep -E` differ from `grep`?** Without `-E`, `grep` uses basic regex, where `+`, `?`, `|`, `()`, and `{}` are literal characters unless escaped. `-E` enables extended regex, where they have their usual meaning.
