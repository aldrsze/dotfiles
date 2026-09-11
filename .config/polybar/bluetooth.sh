#!/bin/bash
# Show different icons based on bluetooth state.

powered=$(bluetoothctl show 2>/dev/null | grep "Powered:" | awk '{print $2}')

if [ "$powered" != "yes" ]; then
    # Bluetooth is off
    echo "󰂜"
    exit 0
fi

connected=$(bluetoothctl info 2>/dev/null | grep "Connected: yes" | head -1)

if [ -n "$connected" ]; then
    # Device connected
    echo "󰂱"
else
    # Powered on but no device connected
    echo "󰂲"
fi
