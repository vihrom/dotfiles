#!/bin/sh

setxkbmap -layout "us,ru" -option "grp:alt_shift_toggle"
setxkbmap -option "caps:escape"
xkb-switch -W | while read -r _; do kill -45 $(pidof dwmblocks); done &

#xssproxy &
xset s 600 600 &
xss-lock --transfer-sleep-lock -- slock &

xwallpaper --stretch ~/Pictures/Wallpapers/wallpaper.png &
picom -b
dwmblocks &

pipewire &

xrdb -merge ~/.Xresources

exec dbus-run-session -- dwm
