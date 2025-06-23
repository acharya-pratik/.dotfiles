
#!/bin/bash
BRIGHT=$(brightnessctl | grep -oP '\(\K[0-9]+(?=%)')
dunstify -u low -r 9112 "🌞 Brightness: ${BRIGHT}%"
sleep
dunstctl close 9112
