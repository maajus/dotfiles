#!/bin/bash

xrandr --output DP2 --mode 1920x1080_60.00 --primary
xrandr --output eDP1 --below DP2
i3 restart
