#!/bin/bash

# Network control menu for rofi
# Uses simple text for case matching (icons in display only)

wifi_status=$(nmcli radio wifi 2>/dev/null | head -1)
bluetooth_status=$(bluetoothctl show 2>/dev/null | grep "Powered:" | awk '{print $2}')

if [[ "$wifi_status" == *"enabled"* ]]; then
    wifi_label="WiFi: ON"
    wifi_action="off"
else
    wifi_label="WiFi: OFF"
    wifi_action="on"
fi

if [[ "$bluetooth_status" == "yes" ]]; then
    bt_label="Bluetooth: ON"
    bt_action="off"
else
    bt_label="Bluetooth: OFF"
    bt_action="on"
fi

options="${wifi_label}\n${bt_label}\nWiFi Networks\nBluetooth Devices"

selected=$(echo -e "$options" | rofi -dmenu -p "Network" -config ~/.config/rofi/config.rasi -theme ~/.config/rofi/style.rasi -i -no-custom -selected-row 0)

case "$selected" in
    "WiFi: ON")
        nmcli radio wifi off
        notify-send "Network" "WiFi turned OFF"
        ;;
    "WiFi: OFF")
        nmcli radio wifi on
        notify-send "Network" "WiFi turned ON"
        ;;
    "Bluetooth: ON")
        bluetoothctl power off
        notify-send "Bluetooth" "Turned OFF"
        ;;
    "Bluetooth: OFF")
        bluetoothctl power on
        notify-send "Bluetooth" "Turned ON"
        ;;
    "WiFi Networks")
        current=$(nmcli -t -f NAME connection show --active 2>/dev/null | head -1)

        networks=$(nmcli -t -f SSID,SIGNAL,SECURITY device wifi list 2>/dev/null | \
            awk -F: '
            BEGIN { delete seen }
            {
                if ($1 != "" && !seen[$1]++) {
                    signal = $2 + 0
                    if (signal >= 75) sig = "██"
                    else if (signal >= 50) sig = "▓▓"
                    else if (signal >= 25) sig = "░░"
                    else sig = "  "

                    sec = ""
                    if ($3 ~ /WPA2/ || $3 ~ /WPA/) sec = " [WPA]"
                    else if ($3 ~ /WEP/) sec = " [WEP]"

                    if ($1 == current) mark = " *"
                    else mark = ""

                    printf "%s  %d%%%s%s\n", $1, signal, sec, mark
                }
            }' | sort -t'%' -k1 -rn)

        if [ -z "$networks" ]; then
            notify-send "Network" "No WiFi networks found"
            exit 0
        fi

        selected_net=$(echo "$networks" | rofi -dmenu -p "Select Network" -config ~/.config/rofi/config.rasi -theme ~/.config/rofi/style.rasi -i)

        if [ -n "$selected_net" ]; then
            net_name=$(echo "$selected_net" | awk '{print $1}')

            if [ "$net_name" = "$current" ]; then
                notify-send "Network" "Already connected to $net_name"
            else
                result=$(nmcli device wifi connect "$net_name" 2>&1)
                if [ $? -eq 0 ]; then
                    notify-send "Network" "Connected to $net_name"
                else
                    notify-send "Network" "Failed: $result"
                fi
            fi
        fi
        ;;
    "Bluetooth Devices")
        devices=$(bluetoothctl devices 2>/dev/null)

        if [ -z "$devices" ]; then
            notify-send "Bluetooth" "No paired devices found"
            exit 0
        fi

        formatted=$(echo "$devices" | while read -r line; do
            mac=$(echo "$line" | awk '{print $2}')
            name=$(echo "$line" | cut -d' ' -f3-)
            info=$(bluetoothctl info "$mac" 2>/dev/null)
            connected=$(echo "$info" | grep "Connected:" | awk '{print $2}')

            if [ "$connected" = "yes" ]; then
                echo "[Connected] $name"
            else
                echo "[Disconnected] $name"
            fi
        done)

        selected_device=$(echo "$formatted" | rofi -dmenu -p "Select Device" -config ~/.config/rofi/config.rasi -theme ~/.config/rofi/style.rasi -i)

        if [ -n "$selected_device" ]; then
            dev_name=$(echo "$selected_device" | sed 's/^\[.*\] //')
            mac=$(echo "$devices" | awk -v name="$dev_name" '$0 ~ name {print $2}' | head -1)

            if echo "$selected_device" | grep -q "Connected"; then
                bluetoothctl disconnect "$mac" 2>/dev/null
                notify-send "Bluetooth" "Disconnected from $dev_name"
            else
                bluetoothctl connect "$mac" 2>/dev/null
                notify-send "Bluetooth" "Connecting to $dev_name..."
            fi
        fi
        ;;
esac
