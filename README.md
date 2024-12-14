# Script: File and Directory Permissions Checker

## Description
This script performs the following tasks:
1. **No Arguments:** If no arguments are passed, it lists the permissions of hidden directories in the current directory. If no hidden directories are found, it displays an appropriate message.
2. **With Arguments:** For each argument provided, it checks and displays the current user's permissions (read, write, execute) for the specified files or directories.

## Usage
### Without Arguments
```sh
./script.sh
```
Displays permissions of hidden directories in the current directory.
Outputs no hidden directories if none are found.

### With Arguments
```sh
./script.sh [file_or_directory...]
```
Displays permissions (e.g., rwx, rw-) for the given files or directories.
Indicates whether the file or directory exists.
