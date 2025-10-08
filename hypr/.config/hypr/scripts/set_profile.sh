#!/bin/bash

# Easy single command toggle: performance → balanced → powersave
# Save the current profile in a temp file
PROFILE_FILE="$HOME/.config/hypr/current_profile"

# Read current profile
current=$(cat "$PROFILE_FILE" 2>/dev/null || echo "powersave")

# Determine next profile
case "$current" in
  powersave) next="balanced" ;;
  balanced)  next="performance" ;;
  performance) next="powersave" ;;
  *) next="powersave" ;;
esac

# Apply CPU governor
case "$next" in
  performance) sudo cpupower frequency-set -g performance ;;
  balanced)    sudo cpupower frequency-set -g ondemand ;;
  powersave)   sudo cpupower frequency-set -g powersave ;;
esac

# Save new profile
echo "$next" > "$PROFILE_FILE"

# Show notification
~/.config/hypr/scripts/notify_profile.sh "$next"

