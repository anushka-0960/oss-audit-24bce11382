#!/bin/bash
# Script 1: System Identity Report
# Author: Anushka | Course: Open Source Software

STUDENT_NAME="Anushka"
SOFTWARE_CHOICE="Apache HTTP Server"

KERNEL=$(uname -r)
USER_NAME=$(whoami)
HOME_DIR=$HOME
UPTIME=$(uptime -p 2>/dev/null)
CURRENT_DATE=$(date)
DISTRO=$(uname -o 2>/dev/null)

echo "========================================"
echo " Open Source Audit — $STUDENT_NAME"
echo "========================================"
echo "Chosen Software : $SOFTWARE_CHOICE"
echo "Distribution    : $DISTRO"
echo "Kernel Version  : $KERNEL"
echo "Logged-in User  : $USER_NAME"
echo "Home Directory  : $HOME_DIR"
echo "System Uptime   : $UPTIME"
echo "Current Date    : $CURRENT_DATE"
echo "OS License Note : Linux kernel is licensed under GPLv2"
echo "========================================"