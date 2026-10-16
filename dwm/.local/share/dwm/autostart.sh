#!/bin/sh

# Kill existing instances to prevent duplicates
pkill -u "$USER" -f "xkb-switch -W"
for app in xss-lock picom pipewire pipewire-pulse wireplumber dwmblocks; do
	pkill -u "$USER" -x "$app"
done
sleep 0.2

xkb-switch -W | while read -r _; do kill -45 $(pidof dwmblocks); done &

xset s 600 600 &
xset dpms 0 0 900 &
xss-lock --transfer-sleep-lock -- slock &

xwallpaper --stretch ~/pics/wallpapers/wallpaper.jpg &
picom -b

pipewire &
pipewire-pulse &
wireplumber &

dwmblocks &
(sleep 15 && kill -42 $(pidof dwmblocks)) &
