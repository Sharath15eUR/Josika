# Backup Manager Script
### The backup_manager.sh  is a shell script which back up files from a src dir to a dest dir based on a given file extension. 

### Execution

#### i) Knowing the path of files to be copied from source dir and creating a dest dir
![image](https://github.com/user-attachments/assets/5ea352c0-90a5-42a4-840f-7324e2efe6bf)

#### ii) backup_manager.sh
``` text
# check if three arguments are provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 \"source_directory\" \"backup_directory\" \"file_extension\""
    exit 1
fi
# Assign command-line arguments to variables
SOURCE_DIR="$1"
BACKUP_DIR="$2"
EXTENSION="$3"
# Verify if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Source directory does not exist."
    exit 1
fi
# Create backup directory if it does not exist
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR" || { echo "Error: Failed to create backup directory."; exit 1; }
fi
# Use globbing to find files with the specified extension
FILES=($SOURCE_DIR/*$EXTENSION)

# Check if any matching files are found
if [ "${#FILES[@]}" -eq 0 ]; then
    echo "No files found with extension $EXTENSION in $SOURCE_DIR."
    exit 0
fi
# Initialize backup count and total size
export BACKUP_COUNT=0
TOTAL_SIZE=0
# Declare an indexed array to store file details
file_details=()
# Print file details before backup
echo "Files to be backed up:"
for FILE in "${FILES[@]}"; do
    FILE_SIZE=$(stat -c%s "$FILE")
    file_details+=("$(basename "$FILE") - $FILE_SIZE bytes")
    echo "$(basename "$FILE") - $FILE_SIZE bytes"
done
echo "Starting backup..."
# Backup process
for FILE in "${FILES[@]}"; do
    DEST_FILE="$BACKUP_DIR/$(basename "$FILE")"

    if [ -f "$DEST_FILE" ]; then
        if [ "$FILE" -nt "$DEST_FILE" ]; then
            cp "$FILE" "$DEST_FILE"
        fi
    else
        cp "$FILE" "$DEST_FILE"
    fi
    ((BACKUP_COUNT++))
    TOTAL_SIZE=$((TOTAL_SIZE + $(stat -c%s "$FILE")))
done
# Declare an associative array for report details
declare -A report_info
report_info["Total_files"]="$BACKUP_COUNT"
report_info["Total_size"]="$TOTAL_SIZE bytes"
report_info["Backup_directory"]="$BACKUP_DIR"
# Generate summary report
REPORT_FILE="$BACKUP_DIR/backup_report.log"
echo "Backup Summary:" > "$REPORT_FILE"
echo "Total files processed: ${report_info["Total_files"]}" >> "$REPORT_FILE"
echo "Total size of files backed up: ${report_info["Total_size"]}" >> "$REPORT_FILE"
echo "Backup directory: ${report_info["Backup_directory"]}" >> "$REPORT_FILE"
echo "Backup completed. Report saved at $REPORT_FILE."
```

#### iii) To ensure the script is executable and copy files from src dir to dest dir
![image](https://github.com/user-attachments/assets/c5a0b26d-d4f1-433f-b0bb-b0afad312243)

#### iv) backup_report.log
``` text
Backup Summary:
Total files processed: 3
Total size of files backed up: 236 bytes
Backup directory: eUR
```
