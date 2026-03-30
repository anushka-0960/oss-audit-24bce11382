#!/bin/bash
# Script 3: Disk and Permission Auditor
# Audits important directories

DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "========================================"
echo " Directory Audit Report"
echo "========================================"

for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        echo "$DIR => Permissions/Owner: $PERMS | Size: $SIZE"
    else
        echo "$DIR does not exist on this system"
    fi
done

echo ""
echo "----------------------------------------"
echo "Checking common Apache config directories..."
echo "----------------------------------------"

for CONF in "/etc/apache2" "/etc/httpd"; do
    if [ -d "$CONF" ]; then
        CONF_INFO=$(ls -ld "$CONF" | awk '{print $1, $3, $4}')
        echo "$CONF exists => $CONF_INFO"
    else
        echo "$CONF not found"
    fi
done