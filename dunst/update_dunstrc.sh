#!/bin/bash
# Copyright (C) 2025 argEe

# Source pywal colors file
[ -f "$HOME/.cache/wal/colors.sh" ] && . "$HOME/.cache/wal/colors.sh"

# Replace single quotes with double quotes for colors used below
bg_normal="${color12//\'/\"}"
fg_normal="${background//\'/\"}"
bg_low="${color1//\'/\"}"
fg_low="${background//\'/\"}"
bg_critical="${color10//\'/\"}"
fg_critical="${background//\'/\"}"
fc="${color5//\'/\"}"

# Hardcoded colors for low and critical urgencies
low_bg="#FFFF00"
low_fg="#000000"
crit_bg="#FF0000"
crit_fg="#000000"

cat > ~/.config/dunst/dunstrc << EOF

[global]
    frame_width = 0
    font = Times New Roman 12
    alignment = left
    word_wrap = yes

    # Format for how notifications will be displayed
    format = "<b>%s</b>\n<b>%b</b>"

    
    # Allow some HTML tags like <i> and <u> in notifications
    markup = full

[urgency_low]
    background = "$bg_low"
    foreground = "$fg_low"
    timeout = 5

[urgency_normal]
    background = "$bg_normal"
    foreground = "$fg_normal"
    timeout = 5

[urgency_critical]
    background = "$bg_critical"
    foreground = "$fg_critical"
    timeout = 5
EOF

echo "New dunstrc written to ~/.config/dunst/dunstrc with pywal colors."
echo "Restart dunst now with: killall dunst && dunst &"
echo "Or just restart i3"
