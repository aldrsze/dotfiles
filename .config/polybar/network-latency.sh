#!/bin/bash
# Check active connection using nmcli
SSID=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2)

if [ -z "$SSID" ]; then
    echo "󰤭 offline"
    exit
fi

# Measure latency (ping Google DNS with 1 packet timeout 1s)
LATENCY=$(ping -c 1 -W 1 8.8.8.8 2>/dev/null | grep 'time=' | awk -F 'time=' '{print $2}' | awk '{print $1}')

if [ -z "$LATENCY" ]; then
    echo "$SSID (No Inet)"
else
    echo "$SSID (${LATENCY}ms)"
fi
