
#!/bin/bash
STATE=$(pactl get-source-mute @DEFAULT_SOURCE@ | awk '{print $2}')

if [ "$STATE" = "yes" ]; then
    dunstify -u low -r 9111 "🎙️ Mic Muted"
else
    dunstify -u low -r 9111 "🎤 Mic Unmuted"
fi

sleep 5
dunstctl close 9111
