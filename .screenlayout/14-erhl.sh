#!/bin/sh
xrandr --output eDP-1 --mode 1366x768 --pos 1920x312 --rotate normal --output HDMI-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VGA-1 --off
feh --bg-scale $HOME/.Wallpaper/wallpaper.png
