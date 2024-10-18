#!/bin/bash

# Specify the folder path and log file name
folderPath=${1:-"/path/to/your/pdf/folder"}
logFileName=${2:-"PDF_Check_Report.txt"}
logFilePath="$folderPath/$logFileName"

# Remove the old log file if it exists
[ -f "$logFilePath" ] && rm "$logFilePath"
damagedFiles=()

# Check PDF files
find "$folderPath" -type f -name "*.pdf" | while read -r file; do
    result=$(qpdf --check "$file" 2>&1)
    
    # If the PDF is damaged, add to the list
    if echo "$result" | grep -q "can't find PDF header\|file is damaged\|unable to find trailer dictionary"; then
        echo "$file is damaged" >> "$logFilePath"
        damagedFiles+=("$file")
        echo "Checking file: $file"
        echo "$result"
    fi
done

# Report damaged files
if [ ${#damagedFiles[@]} -gt 0 ]; then
    echo "Damaged files report saved to $logFilePath"
else
    echo "PDF check completed."
fi
