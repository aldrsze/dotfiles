#!/bin/bash
# Show icon only when connected to wifi with working internet.
# Empty output = polybar hides the module entirely.

SSID=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2)

if [ -z "$SSID" ]; then
    exit 1
fi

if ! ping -c 1 -W 1 8.8.8.8 >/dev/null 2>&1; then
    exit 1
fi

echo " "
