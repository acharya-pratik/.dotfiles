
#!/bin/bash
state=$(xset q | grep "Caps Lock:" | awk '{print $4}')

if [ "$state" = "on" ]; then
    dunstify -u low -r 9113 "🔡 CAPS ON"
else
    dunstify -u low -r 9113 "🔡 CAPS OFF"
fi

sleep 5
dunstctl close 9113
