# Extract WLAN Frame Data from provided input file
This script extracts specific WLAN frame data (frame time, frame type, and frame subtype) from a given input file and formats it into a readable output.

## Execution

### 1) Script : extract.sh
```bash
#!/bin/bash
# Checking if the input file is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <input_file>"
    exit 1
fi
input="$1"
output="output.txt"
# Check if input file exists
if [ ! -f "$input" ]; then
    echo "Error: File '$input' not found!"
    exit 1
fi
# Clear the output file before writing
> "$output"
# Temporary variables
frame_time=""
wlan_type=""
wlan_sub_type=""
# Read input file line by line
while IFS= read -r line; do
    case "$line" in
        *"frame.time"*)
            [[ "$line" != *"frame.time_"* ]] && frame_time=$(echo "$line" | cut -d':' -f2- | xargs)
            ;;
        *"wlan.fc.type"*)
            [[ "$line" != *"wlan.fc.type_"* ]] && wlan_type=$(echo "$line" | cut -d':' -f2- | xargs)
            ;;
        *"wlan.fc.subtype"*)
            [[ "$line" != *"wlan.fc.subtype_"* ]] && wlan_sub_type=$(echo "$line" | cut -d':' -f2- | xargs)
            ;;
    esac
    # If all values are found, write to output with proper formatting and reset
    if [[ -n "$frame_time" && -n "$wlan_type" && -n "$wlan_sub_type" ]]; then
        echo "\"frame.time\": \"$frame_time\"," >> "$output"
        echo "\"wlan.fc.type\": \"$wlan_type\"," >> "$output"
        echo "\"wlan.fc.subtype\": \"$wlan_sub_type\"," >> "$output"
        echo "" >> "$output"  # Add a blank line for readability
        frame_time=""; wlan_type=""; wlan_sub_type=""
    fi
done < "$input"
echo "Output saved to $output"
```
### 2)Give the Script Execution Permission
```bash
chmod +x extract.sh
```
### 3)Run the Script with the Input File as Argument
```bash
./extract.sh input.txt
```
### 4) Output
The output will be saved in the output.txt file and each frame's data will be formatted as follows:
```
"frame.time": "Dec 31 2024 12:50:25.890970000 India Standard Time"
"wlan.fc.type": "0"
"wlan.fc.subtype": "8"

"frame.time": "Dec 31 2024 12:50:25.892357000 India Standard Time"
"wlan.fc.type": "0"
"wlan.fc.subtype": "8"

```
### 5) Screenshot:
![image](https://github.com/user-attachments/assets/92e0f172-36d4-48d9-8f5f-85b22f19e9cf)


