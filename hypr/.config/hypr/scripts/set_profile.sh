#!/bin/bash
# Optimized power profile toggle
current=$(powerprofilesctl get 2>/dev/null || echo "balanced")
case $current in
    performance)
        powerprofilesctl set balanced
        notify-send "Power Profile: Balanced"
        ;;
    balanced)
        powerprofilesctl set power-saver
        notify-send "Power Profile: Power-Saver"
        ;;
    *)
        powerprofilesctl set performance
        notify-send "Power Profile: Performance"
        ;;
esac
