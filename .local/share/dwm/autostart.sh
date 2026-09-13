#!/bin/sh

xkb-switch -W | while read -r _; do kill -45 $(pidof dwmblocks); done &

xset s 600 600 &
xss-lock --transfer-sleep-lock -- slock &

xwallpaper --stretch ~/Pictures/Wallpapers/wallpaper.jpg &
picom -b

pipewire &
pipewire-pulse &
wireplumber &

dwmblocks &
(sleep 15 && kill -42 $(pidof dwmblocks)) &
