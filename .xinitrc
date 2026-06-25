#!/bin/sh

setxkbmap -layout "us,ru" -option "grp:alt_shift_toggle"

#xssproxy &
xset s 600 600 &
xss-lock --transfer-sleep-lock -- slock &

feh --bg-fill "$HOME/Pictures/Wallpapers/wallhaven-jexkwm.jpg" &
picom -b
slstatus &
exec dwm
