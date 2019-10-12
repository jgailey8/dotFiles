#!/bin/bash

amixer sget Master | grep off > /dev/null
is_muted=$?

if (( is_muted == 0 )); then
  volume=0
  class=muted
else
  volume=$(awk -F"[][]" '/dB/ { print $2 }' <(amixer sget Master) | sed 's/[^0-9]*//g')
  class=active
fi

echo -e "{\"text\":\""$volume% "\", \"class\":\""$class"\",\"percentage\":\"$volume\"}"
