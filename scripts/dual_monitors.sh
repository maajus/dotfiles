#!/bin/bash

xrandr --output eDP1 --off
#xrandr --output DP1 --auto --primary
#xrandr --newmode "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
#xrandr --addmode DP1 1920x1080_60.00
#xrandr --output DP1 --mode 1920x1080_60.00
xrandr --output DP1 --auto --primary
xrandr --output HDMI1 --auto --left-of DP1
#--left-of DP1
i3 restart
