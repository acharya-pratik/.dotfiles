#!/bin/bash

# Start TLP for power saving
sudo systemctl enable --now tlp.service

# Power tweaks
sudo systemctl enable --now thermald.service
sudo systemctl enable --now earlyoom.service

# Clipboard manager
wl-paste --watch cliphist store &

# Notifications
dunst &

# Waybar
waybar &

# Wallpaper
swww-daemon && swww img ~/Wallpapers/default.jpg &

# Night light
wlsunset -l 27.7 -L 85.3 &

# Idle lock
swayidle -w timeout 300 'swaylock -f' timeout 600 'systemctl suspend' &

# Gamemode
gamemoded -r &

# Virt services
sudo systemctl enable --now libvirtd.service

