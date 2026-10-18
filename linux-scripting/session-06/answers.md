# Session 6: Answers and Review

## Solutions

1. ```bash
   for f in data/*.txt; do
     [[ -e "$f" ]] || { echo "No .txt files"; break; }
     echo "$(basename "$f")"
   done
   ```
   The `[[ -e ]]` check catches the case where the glob matches nothing, so the loop does not run with the literal pattern.

2. ```bash
   n=0
   while read -r line; do
     n=$((n + 1))
     echo "$n: $line"
   done < data/notes2.txt
   ```
   `-r` stops `read` from treating backslashes as escape characters. The `< file` redirection feeds the file into the loop.

3. `for f in $(ls *.txt)` splits on spaces, so `my notes.txt` becomes two words, `my` and `notes.txt`. `for f in *.txt` expands to whole filenames, so it handles spaces and needs no `ls`.

4. The full solution is in `solutions/word_count.sh`:
   ```bash
   ./solutions/word_count.sh data
   ```

5. The function is the `count_words` function in the same file. `local file="$1"` keeps the variable from leaking into the rest of the script.

6. ```bash
   fruits=(apple banana cherry)
   echo "${fruits[@]}"    # all items
   echo "${#fruits[@]}"   # count: 3
   echo "${fruits[1]}"    # second item: banana (indexes start at 0)
   ```

7. ```bash
   name="reader"
   cat <<EOF
   Hello, $name.
   This script counts words.
   EOF
   ```

## Review Questions

- **What is wrong with `for f in $(ls)`, and what should you use?** `ls` output is split on whitespace, so filenames with spaces break. Use a glob, such as `for f in *.txt`.
- **Why use `read -r` in a `while` loop?** Without `-r`, backslashes are treated as escape characters and are silently removed.
- **What does `local` protect against?** It keeps a variable inside the function, so it does not overwrite a variable of the same name in the calling code.
