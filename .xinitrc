#!/bin/sh

setxkbmap -layout "us,ru" -option "grp:alt_shift_toggle"
setxkbmap -option "caps:escape"

xrdb -merge ~/.Xresources

exec dbus-run-session -- dwm
