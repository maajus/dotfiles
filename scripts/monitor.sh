#!/bin/bash

IN="LVDS-0"
EXT="DP-0"

if (xrandr | grep "$EXT" | grep "+")
    then
    xrandr --output $EXT --off --output $IN --auto
    else
        if (xrandr | grep "$EXT" | grep " connected")
            then
            xrandr --output $IN --off --output $EXT --auto
        fi
fi
#killall trayer conky&
#sleep 2
#/home/justas/scripts/xmobar.sh &
