Commands Executed:
1. `gcc server_monitor.c -o server_monitor`
2. `./server_monitor`

Explanations:
* Process Creation (`fork()`): I used `fork()` to create a separate child process to handle the simulated web request, allowing the parent (server) to continue running concurrently.
* Monitoring and Zombies (`waitpid()`): I used `waitpid()` with the `WNOHANG` flag to check on the child without halting the parent. A final `waitpid(pid, &status, 0)` is used after termination to reap the child and completely prevent it from becoming a zombie process.
* Signal Handling (`kill()`): I used the `kill()` function to send the `SIGKILL` signal to the child process, forcibly terminating it because it exceeded the allowed execution time threshold.