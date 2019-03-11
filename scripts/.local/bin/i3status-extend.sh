#!/bin/bash

i3status $@ | while :
do
    read line
    brightness=`printf %.0f $(light)`
# faa7
    # gmail=`perl gmail.pl`

    echo " $brightness% | $line" || exit 1
done
