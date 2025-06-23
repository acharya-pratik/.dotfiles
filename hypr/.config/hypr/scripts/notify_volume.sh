
#!/bin/bash
VOL=$(pamixer --get-volume)
MUTE=$(pamixer --get-mute)

ICON="🔊"
[ "$MUTE" = "true" ] && ICON="🔇"

dunstify -u low -r 9110 "$ICON Volume: ${VOL}%"
sleep 5
dunstctl close 9110
