#!/bin/bash

# Get battery information
battery_status=$(cat /sys/class/power_supply/BAT1/status)
battery_capacity=$(cat /sys/class/power_supply/BAT1/capacity)

# File to keep track of the last status
status_file="/tmp/battery_status.txt"

# Read the last status
if [ -f "$status_file" ]; then
    last_status=$(cat "$status_file")
else
    last_status="Unknown"
fi

# Determine the icon based on the battery status
if [[ "$battery_status" == "Charging" ]]; then
    icon="󱐋"  # Charging icon
    if [ "$last_status" != "Charging" ]; then
        notify-send -t 3000 "Battery Status" "Charging: $battery_capacity%"
    fi
elif [[ "$battery_status" == "Discharging" ]]; then
    icon="󱐤"  # Discharging icon
    if [ "$last_status" != "Discharging" ]; then
        notify-send -t 3000 "Battery Status" "Discharging: $battery_capacity%"
    fi
elif [[ "$battery_status" == "Full" ]]; then
    icon="󱐥"  # Full icon
else
    icon="⚠️"  # Default warning icon for unknown status
fi

# Output the icon and capacity
echo "$icon $battery_capacity%"

# Save the current status for the next check
echo "$battery_status" > "$status_file"
