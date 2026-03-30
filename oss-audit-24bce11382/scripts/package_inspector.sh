#!/bin/bash
# Script 2: FOSS Package Inspector
# Checks whether the chosen package is installed and prints a short note

PACKAGE="apache"

echo "========================================"
echo " FOSS Package Inspector"
echo "========================================"

if command -v "$PACKAGE" >/dev/null 2>&1; then
    echo "$PACKAGE appears to be installed on this system."
    "$PACKAGE" -v 2>/dev/null | head -n 1
else
    echo "$PACKAGE is NOT found directly as a command."
fi

echo ""
echo "Searching package hints..."
echo "----------------------------------------"

if command -v pacman >/dev/null 2>&1; then
    pacman -Qs "$PACKAGE" 2>/dev/null | head -n 5
elif command -v dpkg >/dev/null 2>&1; then
    dpkg -l 2>/dev/null | grep -i "$PACKAGE" | head -n 5
elif command -v rpm >/dev/null 2>&1; then
    rpm -qa 2>/dev/null | grep -i "$PACKAGE" | head -n 5
else
    echo "No supported package manager detected."
fi

echo ""
case "$PACKAGE" in
    apache|apache2|httpd)
        echo "Apache: an open-source web server that helped build the modern web."
        ;;
    mysql)
        echo "MySQL: an open-source database used in many real applications."
        ;;
    firefox)
        echo "Firefox: a community-driven browser that supports an open web."
        ;;
    vlc)
        echo "VLC: a free multimedia player built for openness and portability."
        ;;
    *)
        echo "This package represents the spirit of open collaboration."
        ;;
esac