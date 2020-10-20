#!/bin/sh -e

# Save this file as /etc/sbin/thinkpad-dock.sh

# NB: you will need to modify the username and tweak the xrandr
# commands to suit your setup.

# wait for the dock state to change
sleep 0.5

username=justas
export DISPLAY=:0
export XAUTHORITY=/home/justas/.Xauthority

#export IFS=$"\n"

if [[ "$ACTION" == "add" ]]; then
  DOCKED=1
  logger -t DOCKING "Detected condition: docked"
elif [[ "$ACTION" == "remove" ]]; then
  DOCKED=0
  logger -t DOCKING "Detected condition: un-docked"
else
  logger -t DOCKING "Detected condition: unknown"
  echo Please set env var \$ACTION to 'add' or 'remove'
  exit 1
fi

# invoke from XSetup with NO_KDM_REBOOT otherwise you'll end up in a KDM reboot loop
NO_KDM_REBOOT=0
for p in $*; do
  case "$p" in
  "NO_KDM_REBOOT") NO_KDM_REBOOT=1 ;;
  "SWITCH_TO_LOCAL") DOCKED=0 ;;
  esac
done

function switch_to_local {
  logger -t DOCKING "Switching off DP and switching on eDP"
  /usr/bin/xrandr --output eDP1  --auto --primary;
  /usr/bin/xrandr --output DP1-2 --off;
  /usr/bin/xrandr --output DP1-3 --off;
  /usr/bin/xrandr --output HDMI1 --off;
  /usr/bin/xrandr --output VGA1  --off;
  #i3 restart
  killall polybar
  sudo -H -u justas bash -c /home/justas/scripts/launch_polybar.sh

}

function switch_to_external {

  sleep 2
  # The Display port on the docking station is on HDMI2 - let's use it and turn off local display
  logger -t DOCKING "Switching off eDP and switching on DP"
  /usr/bin/xrandr --output DP1-2 --auto;
  /usr/bin/xrandr --output DP1-3 --auto --right-of DP1-2 --primary;
  /usr/bin/xrandr --output eDP1  --off;
  #i3 restart
  killall polybar
  sudo -H -u justas bash -c /home/justas/scripts/launch_polybar.sh

}

case "$DOCKED" in
  "0")
    #undocked event
    switch_to_local :0 ;;
  "1")
    #docked event
    switch_to_external :0 ;;
esac
