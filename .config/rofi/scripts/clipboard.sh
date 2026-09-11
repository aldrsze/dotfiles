#!/bin/bash

# Clipboard manager for X11
# Stores clipboard history in ~/.cache/clipboard_history

HISTORY_FILE="$HOME/.cache/clipboard_history"
mkdir -p "$(dirname "$HISTORY_FILE")"

# Add current clipboard to history
add_to_history() {
    local content
    content=$(xclip -selection clipboard -o 2>/dev/null)
    if [ -n "$content" ]; then
        # Remove duplicate entries and add to top
        local tmp=$(mktemp)
        echo "$content" > "$tmp"
        if [ -f "$HISTORY_FILE" ]; then
            grep -v -F -x -f "$tmp" "$HISTORY_FILE" > "$tmp.2" 2>/dev/null || true
            cat "$tmp.2" > "$tmp"
        fi
        cat "$tmp" >> "$HISTORY_FILE"
        rm -f "$tmp" "$tmp.2"
    fi
}

# Monitor clipboard changes in background
if [ "$1" = "--monitor" ]; then
    while true; do
        add_to_history
        sleep 2
    done
    exit 0
fi

# Show clipboard history in rofi
if [ ! -f "$HISTORY_FILE" ] || [ ! -s "$HISTORY_FILE" ]; then
    notify-send "Clipboard" "Clipboard history is empty"
    exit 0
fi

# Get last 50 entries (most recent last)
entries=$(tail -n 50 "$HISTORY_FILE" | tac)

if [ -z "$entries" ]; then
    notify-send "Clipboard" "Clipboard history is empty"
    exit 0
fi

selected=$(echo "$entries" | rofi -dmenu -p "Clipboard" -config ~/.config/rofi/config.rasi -theme ~/.config/rofi/style.rasi -i -no-custom -mesg "Press Enter to copy")

if [ -n "$selected" ]; then
    echo -n "$selected" | xclip -selection clipboard
    notify-send "Clipboard" "Copied to clipboard"
fi
