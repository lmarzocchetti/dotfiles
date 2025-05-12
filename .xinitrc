#!/bin/sh

xsetroot -name "DWM"

xrandr --auto --output DP-1 --mode 1920x1080 --left-of HDMI-0

feh --bg-scale ~/Images/eva.jpg &

picom &

xautolock -time 20 -locker slock &

exec dwm
