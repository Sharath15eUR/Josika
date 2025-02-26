#!/bin/bash
# Log errors to errors.log and display them in the terminal
log_error() {
    echo "$1" | tee -a errors.log >&2
}
# Display help menu using a here document
show_help() {
    cat << EOF
Usage: $0 [OPTIONS]
Options:
  -d <directory>  Directory to search.
  -k <keyword>    Keyword to search.
  -f <file>       File to search directly.
  --help          Display this help menu.
Example usage:
# Recursively search a directory for a keyword
./file_analyzer.sh -d logs -k error
# Search for a keyword in a file
./file_analyzer.sh -f script.sh -k TODO
# Display the help menu
./file_analyzer.sh --help
EOF
}
# Recursive function to search for files containing a keyword
search_directory() {
    local dir=$1
    local keyword=$2
    for file in "$dir"/*; do
        if [ -d "$file" ]; then
            search_directory "$file" "$keyword"
        elif [ -f "$file" ]; then
            if grep -q "$keyword" "$file"; then
                echo "Keyword '$keyword' found in: $file"
            fi
        fi
    done
}
# Validate inputs with regular expressions
validate_inputs() {
    if [ ! -e "$1" ]; then
        log_error "Error: File or directory '$1' does not exist."
        exit 1
    fi
    if [[ -z "$2" || ! "$2" =~ ^[A-Za-z0-9_]+$ ]]; then
        log_error "Error: Invalid keyword '$2'."
        exit 1
    fi
}
# Parse command-line arguments using getopts
while getopts "d:k:f:-:" opt; do
    case $opt in
        d)
            directory=$OPTARG
            ;;
        k)
            keyword=$OPTARG
            ;;
        f)
            file=$OPTARG
            ;;
        -)
            case $OPTARG in
                help)
                    show_help
                    exit 0
                    ;;
                *)
                    log_error "Error: Invalid option '--$OPTARG'."
                    exit 1
                    ;;
            esac
            ;;
        \?)
            log_error "Error: Invalid option '-$OPTARG'."
            exit 1
            ;;
        :)
            log_error "Error: Option '-$OPTARG' requires an argument."
            exit 1
            ;;
    esac
done
# Handle provided options
if [ -n "$directory" ] && [ -n "$keyword" ]; then
    validate_inputs "$directory" "$keyword"
    search_directory "$directory" "$keyword"
elif [ -n "$file" ] && [ -n "$keyword" ]; then
    validate_inputs "$file" "$keyword"
    if grep -q "$keyword" <<< $(cat "$file"); then
        echo "Keyword '$keyword' found in: $file"
    else
        echo "Keyword '$keyword' not found in: $file"
    fi
else
    log_error "Error: Insufficient arguments."
    show_help
    exit 1
fi
echo "Script executed successfully."
