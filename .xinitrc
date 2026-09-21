#!/bin/sh

export PATH="$HOME/.local/bin:$PATH"

setxkbmap -option "caps:escape"

xrdb -merge ~/.Xresources

exec dbus-run-session -- dwm
