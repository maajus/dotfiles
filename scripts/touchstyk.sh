#!/bin/bash


xinput  set-prop "PS/2 Generic Mouse" "Evdev Wheel Emulation" 1
xinput  set-prop "PS/2 Generic Mouse" "Evdev Wheel Emulation Button" 3
xinput  set-prop "PS/2 Generic Mouse" "Evdev Wheel Emulation Timeout" 150

xinput  set-prop "PS/2 Generic Mouse" "Evdev Middle Button Emulation" 1
xinput  set-prop "PS/2 Generic Mouse" "Evdev Middle Button Timeout" 100
xinput  set-prop "PS/2 Generic Mouse" "Evdev Wheel Emulation Inertia" 3 

xinput  set-prop  "PS/2 Generic Mouse" "Device Accel Constant Deceleration" 0.2


