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
            [[ "$line" != *"frame.time_"* ]] && frame_time=$(echo "$line" | cut -d':' -f2- | xargs | sed 's/,$//')
            ;;
        *"wlan.fc.type"*)
            [[ "$line" != *"wlan.fc.type_"* ]] && wlan_type=$(echo "$line" | cut -d':' -f2- | xargs | sed 's/,$//')
            ;;
        *"wlan.fc.subtype"*)
            [[ "$line" != *"wlan.fc.subtype_"* ]] && wlan_sub_type=$(echo "$line" | cut -d':' -f2- | xargs | sed 's/,$//')
            ;;
    esac

    # If all values are found, write to output and reset
    if [[ -n "$frame_time" && -n "$wlan_type" && -n "$wlan_sub_type" ]]; then
        echo "\"frame.time\": \"$frame_time\"," >> "$output"
        echo "\"wlan.fc.type\": \"$wlan_type\"," >> "$output"
        echo "\"wlan.fc.subtype\": \"$wlan_sub_type\"," >> "$output"
        echo "" >> "$output"  # Add a blank line for readability
        frame_time=""; wlan_type=""; wlan_sub_type=""
    fi

done < "$input"

echo "Output saved to $output"
