#!/bin/bash

# Power menu for rofi

options="󰍃  Logout\n󰤄  Suspend\n󰜉  Reboot\n󰐥  Shutdown"

selected=$(echo -e "$options" | rofi -dmenu -p "Power" -config ~/.config/rofi/config.rasi -theme ~/.config/rofi/style.rasi -i -no-custom -selected-row 0)

case "$selected" in
    *Logout)
        i3-msg exit
        ;;
    *Suspend)
        systemctl suspend
        ;;
    *Reboot)
        systemctl reboot
        ;;
    *Shutdown)
        systemctl poweroff
        ;;
esac
