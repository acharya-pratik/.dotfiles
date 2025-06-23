#!/bin/bash

profile=$1

# Set profile (adjust to your hardware as needed)
case "$profile" in
  performance)
    echo "performance" > /sys/firmware/acpi/platform_profile
    ;;
  balanced)
    echo "balanced" > /sys/firmware/acpi/platform_profile
    ;;
  powersave)
    echo "low-power" > /sys/firmware/acpi/platform_profile
    ;;
  *)
    ~/.config/hypr/scripts/notify_profile.sh invalid
    exit 1
    ;;
esac

# Call the notification
~/.config/hypr/scripts/notify_profile.sh $profile

