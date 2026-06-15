#!/bin/sh

setxkbmap -layout "us,ru" -option "grp:alt_shift_toggle"
sxhkd &

xssproxy &
xset s 600 600 &
xss-lock --transfer-sleep-lock -- slock &

feh --bg-fill "$HOME/Pictures/Wallpapers/wallhaven-ly22v2.png" &
picom -b
slstatus &
exec dwm
