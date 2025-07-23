
#!/bin/bash

while true; do
    BATTERY_PATH=$(upower -e | grep BAT)
    BATTERY_INFO=$(upower -i "$BATTERY_PATH")

    # Get charging state
    IS_CHARGING=$(echo "$BATTERY_INFO" | grep -E "state:\s*charging")

    # Get battery percentage (strip % symbol)
    CHARGE=$(echo "$BATTERY_INFO" | awk '/percentage:/ {gsub(/%/, "", $2); print $2}')

    # Check if charging OR battery > 95
    if [ -n "$IS_CHARGING" ] || [ "$CHARGE" -gt 95 ]; then
        echo "[+] Charging or battery is $CHARGE%. Changing wallpaper..."

        WALLPAPER=$(find  wallpapers -type f | shuf -n 1)
        swww img "$WALLPAPER" --transition-type any --transition-duration 2

        sleep 1200  # Sleep for 20 minutes
    else
        echo "[!] Not charging and battery ≤ 95%. Exiting."
        exit 0
    fi
done





