#!/bin/bash

xrandr --output DP1 --off
xrandr --output DP1-1 --off
xrandr --output DP1-2 --off
xrandr --output DP1-3 --off
xrandr --output eDP1 --auto --primary
i3 restart
