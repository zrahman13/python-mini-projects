# Session 4: Answers and Review

## Solutions

1. ```bash
   awk -F, 'NR>1 {print $2}' data/sales.csv
   ```

2. ```bash
   awk -F, 'NR>1 {total[$3] += $4} END {for (c in total) print c, total[c]}' data/sales.csv
   ```
   Output: `Hardware 45`, `Software 26`, `Services 6`. Output order from `for (c in total)` is not guaranteed, so pipe through `sort` if you need a fixed order.

3. ```bash
   awk -F, 'NR>1 {rev[$2] += $4 * $5} END {for (r in rev) printf "%s %.2f\n", r, rev[r]}' data/sales.csv
   ```

4. ```bash
   sed 's/North/North-East/' data/sales.csv
   sed 's/Hardware/HW/2' data/sales.csv
   ```
   `s/old/new/2` replaces only the second match on each line. Lines with one match are unchanged.

5. ```bash
   cp data/sales.csv data/sales.csv.bak
   sed -i 's/Software/Software-Pro/g' data/sales.csv
   diff data/sales.csv.bak data/sales.csv
   ```

6. ```bash
   sed -n '5,8p' data/sales.csv
   sed '1d' data/sales.csv
   ```
   `-n` suppresses automatic printing, and `p` prints the selected lines. `1d` deletes line 1.

7. ```bash
   awk -F, '$3 == "Hardware" && $4 * $5 > 300 {print $1, $4 * $5}' data/sales.csv
   ```

8. `cut` is simpler and faster for selecting fixed columns. `awk` is better when you need arithmetic, conditions, or totals, or when the separator is not a single fixed character.

## Review Questions

- **What does `awk -F, '{print $2}'` do?** It splits each line on commas and prints the second field.
- **Change only the second occurrence of a word on each line with `sed`.** `sed 's/word/replacement/2'`.
- **When would you choose `awk` over `cut`?** When you need math, conditions, or totals across rows, or when fields are separated by variable whitespace.
