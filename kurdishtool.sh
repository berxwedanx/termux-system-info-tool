#!/bin/bash

clear

echo "=============================="
echo "📱 TERMUX SYSTEM INFO TOOL"
echo "=============================="
echo ""

# Device
echo "📱 Device:"
getprop ro.product.model

# Android version
echo ""
echo "🤖 Android Version:"
getprop ro.build.version.release

# Battery (safe + timeout)
echo ""
echo "🔋 Battery Status:"

if command -v termux-battery-status > /dev/null; then
    timeout 2 termux-battery-status > battery.txt 2>/dev/null
    
    if [ -s battery.txt ]; then
        cat battery.txt | grep percentage
        cat battery.txt | grep status
    else
        echo "Battery info not available"
    fi
    
    rm -f battery.txt
else
    echo "termux-api not installed"
fi

# Storage
echo ""
echo "💾 Storage:"
df -h /data | tail -1

# RAM
echo ""
echo "🧠 RAM Usage:"
free -h

# Time
echo ""
echo "🕒 Time:"
date +"%H:%M:%S"

# Date
echo ""
echo "📅 Date:"
date +"%d-%m-%Y"

# Year / Month
echo ""
echo "📆 Year / Month:"
date +"Year: %Y | Month: %B"

echo ""
echo "=============================="
