# Session 5: Answers and Review

## Solutions

`solutions/greet.sh`:
```bash
#!/usr/bin/env bash

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 NAME" >&2
  exit 1
fi

name="$1"
echo "Hello, ${name}!"
```

`solutions/filecheck.sh`:
```bash
#!/usr/bin/env bash

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 PATH" >&2
  exit 1
fi

path="$1"
if [[ -d "$path" ]]; then
  echo "$path is a directory"
elif [[ -f "$path" ]]; then
  echo "$path is a file"
elif [[ -e "$path" ]]; then
  echo "$path exists but is neither a file nor a directory"
else
  echo "$path does not exist"
  exit 2
fi
```

Try both:
```bash
./solutions/greet.sh Ada
./solutions/greet.sh            # usage message, exit status 1
./solutions/filecheck.sh /etc
./solutions/filecheck.sh /nope  # exit status 2
```

3. `ls $name` splits the value on the space and runs `ls Ada Lovelace`, which fails on two missing names. `ls "$name"` treats the value as one argument. `echo '$name'` prints the literal text `$name`, while `echo "$name"` expands the variable.

4. `grep root /etc/passwd` matches and exits with `0`. `grep no-such-user` finds nothing and exits with `1`. Exit status `0` means success.

5. Both `if` and `case` tests work. `case` is clearer when you compare one value against many patterns:
   ```bash
   case "$answer" in
     y|Y|yes) echo "confirmed" ;;
     *)       echo "cancelled" ;;
   esac
   ```

6. `today=$(date +%F)` runs `date` and stores its output. `%F` prints `YYYY-MM-DD`.

## Review Questions

- **Why does `"$name"` need quotes?** Without quotes, the shell splits the value on spaces and expands wildcards, so values with spaces or `*` break.
- **Difference between `$@` and `$*`?** Unquoted, they behave the same. Quoted, `"$@"` expands to each argument as a separate word, while `"$*"` joins them into one string. Use `"$@"` to pass arguments through safely.
- **What is in `$?` after a failed command?** The exit status of the last command, a number from 1 to 255 (nonzero means failure).
