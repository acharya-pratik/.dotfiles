#!/bin/bash

# Only run if device is charging
if upower -i $(upower -e | grep BAT) | grep -q "state:\s*charging"; then
    echo "[+] Laptop is charging. Changing wallpaper..."
else
    echo "[!] Not charging. Skipping wallpaper change."
    exit 0
fi

# Pick a random wallpaper
WALLPAPER=$(find ~/Pictures/wallpapers -type f | shuf -n 1)

# Set wallpaper with transition
swww img "$WALLPAPER" --transition-type any --transition-duration 2

