#!/bin/sh

if test -z "$WAYLAND_DISPLAY"
then
    cd ~/Pictures
    sleep 3 && scrot
    # sleep 3 && scrot -g "$(slurp)" ~/Pictures/$(date +%d\-%m\-%Y\_%I.%M).png
else
    sleep 2 && grim -g "$(slurp)" ~/Pictures/$(date +%d\-%m\-%Y\_%I.%M).png
fi
