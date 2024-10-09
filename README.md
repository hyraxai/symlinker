# Find and Symlink Script

This bash script searches for files matching a given pattern in a directory tree, and creates symlinks to those files in a specified destination directory.

## Usage

```bash
./find_and_symlink.sh [-i] <file_pattern> <directory_tree> <symlink_destination>
```

### Arguments:
- `-i`: Optional flag for case-insensitive search.
- `file_pattern`: The pattern for the files you're searching for (e.g., `*.txt`, `myfile.log`).
- `directory_tree`: The directory tree where the search will be performed.
- `symlink_destination`: The directory where symlinks to the found files will be created.

### Example Usage

#### Case-Insensitive Search:
```bash
./find_and_symlink.sh -i "*.txt" /path/to/search/dir /path/to/symlink/dir
```

This example searches for files with the `.txt` extension (case-insensitive) in `/path/to/search/dir` and creates symlinks in `/path/to/symlink/dir`.

#### Case-Sensitive Search:
```bash
./find_and_symlink.sh "*.txt" /path/to/search/dir /path/to/symlink/dir
```

This example searches for files with the `.txt` extension (case-sensitive) in `/path/to/search/dir` and creates symlinks in `/path/to/symlink/dir`.

## Notes
- **Case Sensitivity**: By default, the search is case-sensitive. Use the `-i` flag to make it case-insensitive.
- **No Directory Structure**: This script creates symlinks directly in the destination directory without recreating any subdirectories.
- **File Pattern**: The `file_pattern` supports wildcard characters such as `*` and `?`.

## Prerequisites
- Bash shell.
- Ensure that you have the necessary permissions to create symlinks in the destination directory.
