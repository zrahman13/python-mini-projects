# Session 2: Permissions, Processes, and the Environment

Work in a scratch folder:

```bash
mkdir -p ~/scratch/s02 && cd ~/scratch/s02
```

## Exercises

1. **Read permissions.** Create `perms.txt` with `touch perms.txt`. Run `ls -l perms.txt` and read the permission string. Then:
   - `chmod 600 perms.txt`, then check with `ls -l`
   - `chmod u+x perms.txt`, then check again (symbolic mode)
   - `chmod go-w perms.txt`, then check again

   Explain what each permission string means for the owner, group, and others.

2. **Permission denied.** Create `hello.sh`:
   ```bash
   #!/usr/bin/env bash
   echo "Hello from a script"
   ```
   Run `./hello.sh`. It should fail with "Permission denied". Fix it with `chmod +x hello.sh` and run it again.

3. **Put scripts on your PATH.** Create `~/bin`, move `hello.sh` into it, and add it to `PATH` for the current shell:
   ```bash
   mkdir -p ~/bin && mv hello.sh ~/bin/
   export PATH="$HOME/bin:$PATH"
   hello.sh
   type hello.sh
   ```

4. **Environment variables.** Compare these two commands and explain the difference:
   ```bash
   GREETING=hi; bash -c 'echo "$GREETING"'
   export GREETING=hi; bash -c 'echo "$GREETING"'
   ```

5. **Background jobs and processes.** Run `sleep 300 &`, then:
   - `jobs` to list it
   - `ps aux | grep '[s]leep'` to find its PID
   - `kill <PID>` to stop it (or `kill %1` for the job)

6. **Find a port owner.** Start a web server in the background: `python3 -m http.server 8080 &`. Then find which process is listening on port 8080 with `ss -tlnp` (or `lsof -i :8080` if available). Stop it when done.

7. **Top processes.** Run `top -b -n 1 | head -n 15` and identify the columns for PID, %CPU, and command.

8. **Optional practice.** Work through OverTheWire Bandit levels 0 to 5 (https://overthewire.org/wargames/bandit). Each level teaches a shell skill you just learned.

## Done When

- You can read `ls -l` output and set permissions in both numeric and symbolic form.
- You can run a script from anywhere by putting it on `PATH`.
- You can start, list, and stop background processes, and find what is using a port.
