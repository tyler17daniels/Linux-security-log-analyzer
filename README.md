# Linux Security Log Analyzer

## Overview
A Bash-based cybersecurity project developed in an Ubuntu Linux virtual machine to analyze failed sudo authentication attempts recorded in system logs.

## Technologies Used
- Ubuntu Linux
- Bash scripting
- journalctl
- grep
- Linux terminal

## Features
- Retrieves Linux system journal entries
- Filters failed sudo authentication attempts
- Accepts custom start and end timestamps
- Counts and displays matching authentication events
- Generates threshold-based security warnings
- Handles missing arguments and journal retrieval errors
- Supports exporting analysis results to a text report

## Usage
Run the analyzer with a start and end time:

```bash
bash log_analyzer.sh "2026-11-19 16:00:00" "2026-11-19 16:30:00"
```

## Testing
Tested using authentication failures generated in a controlled Ubuntu virtual machine. Verified event filtering, counting, alert conditions, input validation, and error handling.

## Limitations
- Currently analyzes failed sudo authentication events only.
- Alert thresholds are based on the number of matching records in the selected time window.
- Historical lab timestamps were affected by an unsynchronized virtual machine clock.
- Authentication failures alone do not prove malicious activity.
# Linux-security-log-analyzer
# Linux-security-log-analyzer
