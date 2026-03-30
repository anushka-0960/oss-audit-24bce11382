#!/bin/bash
# Script 5: Open Source Manifesto Generator
# This script asks questions and creates a text file.

echo "Answer three questions to generate your manifesto."
echo ""

read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

DATE_NOW=$(date '+%d %B %Y')
OUTPUT="manifesto_$(whoami).txt"

echo "On $DATE_NOW, I reflected on the value of open source." > "$OUTPUT"
echo "The tool I use regularly is $TOOL, and it reminds me that software freedom means $FREEDOM." >> "$OUTPUT"
echo "If I could contribute something openly, I would build $BUILD and share it so others could use, study, improve, and distribute it." >> "$OUTPUT"
echo "This is why open source matters to me." >> "$OUTPUT"

echo ""
echo "Manifesto saved to $OUTPUT"
echo "----------------------------------------"
cat "$OUTPUT"