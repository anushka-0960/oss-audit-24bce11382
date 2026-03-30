#!/bin/bash
# Script 4: Log File Analyzer
# Usage: ./log_file_analyzer.sh logfile keyword

LOGFILE=$1
KEYWORD=${2:-"error"}
COUNT=0

if [ -z "$LOGFILE" ]; then
    echo "Usage: ./log_file_analyzer.sh <logfile> [keyword]"
    exit 1
fi

if [ ! -f "$LOGFILE" ]; then
    echo "Error: File $LOGFILE not found."
    exit 1
fi

if [ ! -s "$LOGFILE" ]; then
    echo "The file exists but is empty."
    echo "Nothing to analyze."
    exit 1
fi

while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

echo "========================================"
echo " Log File Analyzer"
echo "========================================"
echo "File    : $LOGFILE"
echo "Keyword : $KEYWORD"
echo "Count   : $COUNT"
echo ""
echo "Last 5 matching lines:"
grep -i "$KEYWORD" "$LOGFILE" | tail -n 5