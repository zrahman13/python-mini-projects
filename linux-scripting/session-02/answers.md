# Session 2: Answers and Review

## Solutions

1. Numeric and symbolic modes:
   - `600` gives `-rw-------`: the owner can read and write, and no one else has access.
   - `u+x` adds execute for the owner, giving `-rwx------`.
   - `go-w` removes write from group and others. The `g` and `o` parts stay as they are.

   Each of the three permission groups (owner, group, others) has read (`r`=4), write (`w`=2), and execute (`x`=1). `754` means owner rwx (7), group r-x (5), others r-- (4).

2. Without `+x` you get `bash: ./hello.sh: Permission denied`. `chmod +x hello.sh` fixes it.

3. ```bash
   mkdir -p ~/bin && mv hello.sh ~/bin/
   export PATH="$HOME/bin:$PATH"
   hello.sh
   ```
   `type hello.sh` shows the full path it resolves to. `./` is needed only when the script is not on `PATH`.

4. The first command sets `GREETING` as a shell variable only, so the child `bash` does not see it and prints an empty line. The second command exports it to the environment, so child processes inherit it and print `hi`.

5. `jobs` lists background jobs, `ps aux | grep '[s]leep'` finds the process (the bracket trick stops grep from matching itself), and `kill` sends SIGTERM by default.

6. `ss -tlnp | grep 8080` shows the listening process and its PID. Stop it with `kill %1` (the job number) or `kill <PID>`.

7. `top -b -n 1` prints one snapshot. The columns are `PID`, `USER`, `%CPU`, `%MEM`, and `COMMAND`.

## Review Questions

- **What does `chmod 754 file` mean?** Owner has read, write, and execute (7). Group has read and execute (5). Others have read only (4).
- **Why must a script be executable, and why `./`?** Running a file directly requires the execute bit. `./` tells the shell to look in the current folder, because the current folder is not in `PATH` by default.
- **Which command finds the process using port 8080?** `ss -tlnp | grep 8080` (or `lsof -i :8080`).
