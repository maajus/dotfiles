#herbstluftwm -c ~/.config/herbstluftwm/autostart
#exec  openbox-session
#exec awesome
setxkbmap -option caps:escape &
xset r rate 400 50&
exec i3 --force-xinerama
#xsetroot -cursor_name left_ptr
