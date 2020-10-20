#!/bin/bash

xrandr --output DP1-2 --auto --primary
xrandr --output DP1-3 --auto --right-of DP1-2
xrandr --output eDP1 --off
i3 restart
xset r rate 400 50
