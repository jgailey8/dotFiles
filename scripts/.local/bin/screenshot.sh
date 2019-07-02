#!/bin/sh

# sleep 4 && grim $(xdg-user-dir PICTURES)/$(date +'%Y-%m-%d-%H%M%S.png')

sleep 3 && grim -g "$(slurp)" screenshot.png
