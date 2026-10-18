# Session 4: Text Processing II: sed and awk

Use `session-04/data/sales.csv`. Columns: `date,region,category,units,unit_price`.

Before any `sed -i` command, make a backup copy: `cp sales.csv sales.csv.bak`.

## Exercises

1. **Print one column.** Print only the region column (field 2) using `awk -F,`. Skip the header line with `NR>1`.

2. **Total units by category.** Use an associative array in `awk` to sum `units` (field 4) for each category (field 3). Print the category name and its total.

3. **Revenue by region.** Revenue for a row is `units * unit_price`. Sum revenue per region and print it with two decimal places using `printf`.

4. **Replace a value with sed.** Print the file with `North` replaced by `North-East` (without changing the file). Then replace only the *second* occurrence of `Hardware` on each line. (Hint: `sed 's/old/new/2'`.)

5. **Edit in place.** On a copy of the file, change every `Software` to `Software-Pro` with `sed -i`. Check the result with `diff sales.csv.bak sales.csv`.

6. **Select lines.** Use `sed -n` to print only lines 5 to 8. Then use `sed` to delete the header line.

7. **Filter and calculate.** Print the date and revenue for every `Hardware` row where revenue is over 300. (Hint: `awk` can filter with a condition before the braces.)

8. **Reflect on tools.** For a task that needs only one column, `cut -d, -f2` also works. In your own words, when would you pick `awk` over `cut`?

## Done When

- You can select columns and compute totals with `awk`.
- You can do substitutions with `sed`, both printing to the screen and editing a file in place.
- You can answer the review questions in `answers.md` from memory.
