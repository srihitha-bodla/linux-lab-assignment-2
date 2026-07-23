#!/bin/bash
# process_submissions.sh

SUBMISSION_DIR="submissions"
BACKUP_DIR="backup"
REPORT="report.txt"
ERRORS="errors.log"

# Create directories and clear previous logs (redirecting errors to errors.log)
mkdir -p "$BACKUP_DIR" 2>> "$ERRORS"
> "$REPORT"
> "$ERRORS"

declare -A seen_hashes
processed=0
duplicates=0
backed_up=0

# Loop through all files in the submission directory
for file in "$SUBMISSION_DIR"/*; do
    if [ -f "$file" ]; then
        ((processed++))
        
        # Calculate MD5 hash to identify exact content matches
        file_hash=$(md5sum "$file" 2>> "$ERRORS" | awk '{print $1}')
        
        if [[ -n "${seen_hashes[$file_hash]}" ]]; then
            ((duplicates++))
        else
            seen_hashes[$file_hash]=1
            cp "$file" "$BACKUP_DIR/" 2>> "$ERRORS"
            ((backed_up++))
        fi
    fi
done

# Generate report
echo "Files Processed: $processed" > "$REPORT"
echo "Duplicates Found: $duplicates" >> "$REPORT"
echo "Files Backed Up (Unique): $backed_up" >> "$REPORT"

echo "Processing complete. Check $REPORT and $ERRORS."