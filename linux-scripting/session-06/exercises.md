# Session 6: Loops, Functions, and Arrays

Sample text files are in `session-06/data/`. Use them to test your scripts.

## Exercises

1. **Loop over files.** Write a `for` loop that prints the name of each `.txt` file in `data/`. Make sure it prints a clear message, not a literal `*.txt`, when the folder has no `.txt` files.

2. **Read lines safely.** Write a `while read -r line` loop that prints each line of `notes2.txt` with its line number. Test it with a line containing a backslash, such as `C:\temp`, and confirm that the backslash survives.

3. **Compare loops.** Show why `for f in $(ls *.txt)` is fragile: create a file named `my notes.txt` and see what the loop does. Then rewrite it to use a glob, `for f in *.txt`.

4. **Word counts.** Write `word_count.sh`. It loops over the `.txt` files in a directory (default: current directory) and stores each file's word count in an associative array (`declare -A`). Print the results sorted by count, highest first.

5. **Move logic into a function.** Refactor your script so a function `count_words FILE` returns the word count. Use `local` for variables inside the function.

6. **Arrays.** Create an indexed array of three fruit names. Print all of them, print the count with `${#fruits[@]}`, and print the second item.

7. **Here-doc.** Use `cat <<EOF` to print a short multi-line usage message that includes a variable.

## Done When

- Your script handles a directory with no `.txt` files gracefully.
- You can explain why a glob is safer than `$(ls)`.
- You can answer the review questions in `answers.md` from memory.
