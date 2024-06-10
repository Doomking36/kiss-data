#!/bin/sh

xrdb merge ~/.Xresources 
feh --bg-fill ~/Wallpapers/moon.jpg &
xset r rate 200 50 &
picom &

dash ~/.config/chadwm/scripts/bar.sh &
while type chadwm >/dev/null; do chadwm && continue || break; done
