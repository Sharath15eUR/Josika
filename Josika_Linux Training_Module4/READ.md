# Extract WLAN Frame Data from provided input file

## Execution

### i)extract.sh
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
### ii)Give the script execution permission using:
```bash
chmod +x extract.sh
```
### iii) Script execution with input file as arg:
```bash
./extract.sh input.txt
```
### iv) Output:
```
"frame.time": "Dec 31 2024 12:50:25.890970000 India Standard Time"
"wlan.fc.type": "0"
"wlan.fc.subtype": "8"

"frame.time": "Dec 31 2024 12:50:25.892357000 India Standard Time"
"wlan.fc.type": "0"
"wlan.fc.subtype": "8"

```
### iv) Screenshot:
![image](https://github.com/user-attachments/assets/92e0f172-36d4-48d9-8f5f-85b22f19e9cf)


