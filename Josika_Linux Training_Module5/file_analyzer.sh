#!/bin/bash

# Initialize variables
directory=""
keyword=""
file=""
help=""

# Recursive function to search for files containing the keyword
search_files() {
    local dir="$1"
    local keyword="$2"
    
    for file in "$dir"/*; do
        if [ -d "$file" ]; then
            search_files "$file" "$keyword"  # Recursive call for subdirectories
        elif [ -f "$file" ]; then
            if grep -q "$keyword" "$file"; then
                echo "Found '$keyword' in $file"
            fi
        fi
    done
}

# Show help menu using here document
show_help() {
    cat <<EOF
Usage: ./file_analyzer.sh [options]
Options:
  -d <directory>   Directory to search for files (recursive)
  -k <keyword>     Keyword to search for
  -f <file>        Search for a keyword in a specific file
  --help           Display this help message
EOF
}

# Validate that the keyword and file inputs are valid using regular expressions
validate_inputs() {
    if [[ ! "$keyword" =~ ^[a-zA-Z0-9_]+$ ]]; then
        echo "Error: Keyword must be alphanumeric and cannot contain spaces or special characters."
        exit 1
    fi

    if [ ! -z "$file" ] && [ ! -f "$file" ]; then
        echo "Error: File '$file' does not exist."
        exit 1
    fi

    if [ -z "$directory" ] && [ -z "$file" ]; then
        echo "Error: Must specify either a directory (-d) or a file (-f)."
        exit 1
    fi
}

# Handle command-line arguments using getopts
while getopts ":d:k:f:" opt; do
    case "$opt" in
        d) directory="$OPTARG" ;;
        k) keyword="$OPTARG" ;;
        f) file="$OPTARG" ;;
        \?) echo "Usage: $0 [-d directory] [-k keyword] [-f file]" >&2; exit 1 ;;
    esac
done

# Handle '--help' argument
if [[ "$1" == "--help" ]]; then
    show_help
    exit 0
fi

# Log errors to errors.log and also display them
exec 2> errors.log

# If no arguments, print usage
if [ "$#" -eq 0 ]; then
    echo "Usage: $0 [-d directory] [-k keyword] [-f file]" >&2
    exit 1
fi

# Perform input validation
validate_inputs

# Search for the keyword in the directory recursively
if [ -n "$directory" ]; then
    echo "Searching in directory '$directory' for keyword '$keyword'..."
    search_files "$directory" "$keyword"
fi

# Search for the keyword in a specific file
if [ -n "$file" ]; then
    echo "Searching in file '$file' for keyword '$keyword'..."
    if grep -q "$keyword" "$file"; then
        echo "Found '$keyword' in $file"
    else
        echo "No matches found for '$keyword' in $file"
    fi
fi

# Print script name and arguments
echo "Script name: $0"
echo "Total arguments passed: $#"
echo "Arguments: $@"

# Check the exit status of the last command executed
if [ $? -ne 0 ]; then
    echo "An error occurred. Check errors.log for more details."
else
    echo "Operation completed successfully."
fi
