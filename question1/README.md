Commands Executed:
1. `mkdir submissions && touch submissions/file1.txt submissions/file2.txt submissions/file3.txt`
2. `echo "hello" > submissions/file1.txt; echo "hello" > submissions/file2.txt; echo "world" > submissions/file3.txt`
3. `chmod +x process_submissions.sh`
4. `./process_submissions.sh`
5. `cat report.txt`

Explanations:
* Hash generation (`md5sum "$file" | awk '{print $1}'`): I used the `md5sum` command to generate a unique hash for file contents to identify duplicates, and `awk` to extract just the hash string.
* Error Redirection (`2>> "$ERRORS"`): I appended standard error (file descriptor 2) to a separate `errors.log` file so that permission issues or missing files don't clutter the main console output.
* Output Redirection (`>` and `>>`): I used `>` to overwrite and initialize the report file, and `>>` to append subsequent data to it without erasing the previous lines.