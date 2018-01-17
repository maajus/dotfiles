#! /bin/sh


## Wait for program coming up
# Wait for program coming up
wait_for_program () {
  n=0
  while true
  do
    # PID of last background command
    if xdotool search --onlyvisible --pid $! 2>/dev/null; then
      break
    else
      if [ $n -eq 90 ]; then
        notify-send -u critical "Error during start"
        break
      else
        n=`expr $n + 1`
        sleep 0.2
      fi
    fi
  done
}

# Start some programs
#
# ______________________
# |          |          |
# |  emacs   |  chrome  |
# |          |          |
# |          |          |
# |          |----------|
# |          |  xterm   |
# |__________|__________|


urxvt &
wait_for_program

i3-msg split h

urxvt &
wait_for_program

i3-msg split v

urxvt &
wait_for_program

exit 0
