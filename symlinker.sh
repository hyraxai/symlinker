#!/bin/bash

# Usage message
usage() {
    echo "Usage: $0 [-i] <file_pattern> <directory_tree> <symlink_destination>"
    echo "    -i : Optional flag for case-insensitive search"
    exit 1
}

# Parse optional -i flag for case insensitivity
case_insensitive="false"
while getopts ":i" opt; do
  case ${opt} in
    i )
      case_insensitive="true"
      ;;
    \? )
      usage
      ;;
  esac
done
shift $((OPTIND -1))

# Check if the required number of arguments is provided
if [ "$#" -lt 3 ]; then
    usage
fi

# Assign arguments to variables
file_pattern="$1"
search_dir="$2"
dest_dir="$3"

# Check if the provided search directory exists
if [ ! -d "$search_dir" ]; then
    echo "The directory '$search_dir' does not exist."
    exit 1
fi

# Create the destination directory if it doesn't exist
mkdir -p "$dest_dir"

# Set the find command with or without case insensitivity
if [ "$case_insensitive" == "true" ]; then
    found_files=$(find "$search_dir" -type f -iname "$file_pattern")
else
    found_files=$(find "$search_dir" -type f -name "$file_pattern")
fi

# If no files are found, exit with a message
if [ -z "$found_files" ]; then
    echo "No files found matching pattern '$file_pattern' in directory '$search_dir'."
    exit 1
fi

# Loop through found files
while IFS= read -r file; do
    # Extract just the filename
    filename=$(basename "$file")
    
    # Create the symlink in the destination directory, linking to the original file
    ln -s "$(realpath "$file")" "$dest_dir/$filename"
    
    echo "Created symlink for '$file' in '$dest_dir/$filename'"
done <<< "$found_files"

echo "Symlinking complete."
