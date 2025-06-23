
#!/bin/bash

profile=$1

# Example icons/text for profiles
case "$profile" in
  performance)
    icon="⚡"
    ;;
  balanced)
    icon="🌗"
    ;;
  powersave)
    icon="💤"
    ;;
  *)
    icon="❓"
    ;;
esac

# Send to the overlay
eww open profile_notify

# Set the message (you need this variable in your EWW config)
eww update profile_text="$icon $profile"

# Close after 300ms
sleep 0.3
eww close profile_notify
