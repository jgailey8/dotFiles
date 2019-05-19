#!/bin/bash

amixer sget Master | grep off > /dev/null
is_muted=$?

if (( is_muted == 0 )); then
  volume=0
  class=muted
else
  volume=$(amixer sget Master | grep 'Right:' | awk -F'[][]' '{ print $2 }' | sed 's/%//')
fi

echo -e "{\"text\":\""$volume% "\", \"class\":\""$class"\", \"tooltip\":\""active: running"\", \"percentage\":$volume}"
