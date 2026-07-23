Commands Executed:
1. `touch system.log`
2. `tail -f system.log 2>/dev/null | grep --line-buffered "ERROR" | tee -a error_report.log`
*(In a separate terminal to trigger the log):*
3. `echo "INFO: Server started" >> system.log`
4. `echo "ERROR: DB connection failed" >> system.log`

Explanations:
* `tail -f` and `/dev/null`: I used `tail -f` to continuously monitor the file for new entries in real-time, redirecting any standard error to `/dev/null` to cleanly suppress unnecessary output.
* Pipes (`|`) and `grep`: I used a pipe to send the live log stream directly into `grep --line-buffered "ERROR"`, instantly filtering out everything except the critical error messages.
* Redirection with `tee`: I piped the filtered output into `tee -a error_report.log`, which simultaneously prints the error to the terminal while appending it securely to a persistent log file.