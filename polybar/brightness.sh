#!/bin/bash

# Define the maximum brightness
max=120000

# Adjust brightness based on the argument
if [ "$1" == "inc" ]; then
    brightnessctl set +10%
elif [ "$1" == "dec" ]; then
    brightnessctl set 10%-
fi

# Wait a moment for the change to take effect
sleep 0.1

# Get the current brightness
current=$(brightnessctl get)

# Calculate percentage
if [ "$max" -gt 0 ]; then
    percentage=$(($current * 100 / $max))
    echo "$percentage%"
else
    echo "N/A"
fi
