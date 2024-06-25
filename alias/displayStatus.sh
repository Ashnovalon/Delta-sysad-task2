#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 domain-taskno"
    exit 1
fi

LAST_RUN_FILE="/home/core/last_run_timestamp.txt"

# Current timestamp
CURRENT_TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# Read last run timestamp if it exists
if [ -f "$LAST_RUN_FILE" ]; then
    LAST_RUN_TIMESTAMP=$(cat "$LAST_RUN_FILE")
else
    LAST_RUN_TIMESTAMP="1970-01-01 00:00:00"
fi

# Save the current timestamp for the next run
echo "$CURRENT_TIMESTAMP" > "$LAST_RUN_FILE"

mentees=$(cut -f 2 -d ' ' mentees_domain.txt)
count=0
donecount=0
new_task_submissions=()
for name in $mentees; do
    echo "Checking mentee: $name"
    
    task_file="/home/core2/mentees/$name/task_submitted.txt"
    submission_time=$(cut -f 3 -d ' ' $task_file)
    if [ -f "$task_file" ]; then
        task_line=$(grep "$1" "$task_file")
        p=$(echo "$task_line" | cut -f 2 -d ' ')
        if [ "$p" = "y" ]; then
            donecount=$((donecount + 1))
            count=$((count + 1))

        elif [ "$p" = "n" ]; then
            count=$((count + 1))
        fi
        
        if [[ "$submission_time" > "$LAST_RUN_TIMESTAMP" ]]; then
            new_task_submissions+=("$name")
        fi
        
    else
        echo "Warning: File $task_file does not exist."
    fi
done

# Calculate the percentage of completed tasks
perc=$((donecount * 100 / count))
echo "Percentage of completed tasks for $1: $perc%"


echo "Mentees who submitted $1 since last run:"
printf "%s\n" "${new_task_submissions[@]}"





