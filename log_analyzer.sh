#!/bin/bash
if [ "$#" -ne 2 ]; then
    echo "Error: You must provide a start time and an end time."
    echo 'Usage: bash log_analyzer.sh "YYYY-MM-DD HH:MM:SS" "YYYY-MM-DD HH:MM:SS"'
    exit 1
fi
start_time="$1"
end_time="$2"

echo "===== Linux Security Log Analyzer ====="
if ! journal_output=$(sudo journalctl --since "$start_time" --until "$end_time" --no-pager); then
    echo "ERROR: Could not retrieve logs. Check your dates and permissions."
    exit 1
fi

logs=$(sudo journalctl --since "$start_time" --until "$end_time" --no-pager | grep -F 'pam_unix(sudo:auth): authentication failure')
count=$(printf "%s\n" "$logs" | grep -c .)
echo "Total failed sudo authentications: $count"
echo
echo "===== Authentication Events ====="
if [ "$count" -gt 0 ]; then
   printf '%s\n' "$logs"
else
echo "No Matching authentication failures found."

fi
echo
echo "===== Security Assesment ====="

if [ "$count" -ge 5 ]; then
echo 'Warning repeated authentication failures detected'
echo "Further investigation recommended."

else
echo "No repeated authentication failure alert triggered"

fi
