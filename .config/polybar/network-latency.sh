#!/bin/bash
# Show different icons based on network state.

SSID=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2)

if [ -z "$SSID" ]; then
    # Not connected to any WiFi
    echo "󰤭 "
    exit 0
fi

if ! ping -c 1 -W 1 8.8.8.8 >/dev/null 2>&1; then
    # Connected to WiFi but no internet
    echo "󰀦 "
    exit 0
fi

# Connected with working internet
echo "󰤨 "
