Commands Executed:
1. `gcc secure_db.c -o secure_db`
2. `./secure_db`

Explanations:
* `open()` and `close()`: I used `open()` with `O_CREAT | O_RDWR` and strict `0600` permissions to securely create and access the file at the kernel level, and `close()` to release the file descriptor.
* `write()` and `read()`: I used `write()` and `read()` to push and pull raw binary structure data directly to and from disk, bypassing standard library buffers for secure I/O.
* `lseek()`: I utilized `lseek()` with `SEEK_SET` to calculate the exact byte offset of specific records, allowing me to update or read targeted data instantly without rewriting the entire file.