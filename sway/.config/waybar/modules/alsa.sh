#!/bin/bash

format() {
  perl_filter='if (/.*\[(\d+%)\] (\[(-?\d+.\d+dB)\] )?\[(on|off)\]/)'
  perl_filter+='{CORE::say $4 eq "off" ? "MUTE" : "'
  perl_filter+='$1'
  perl_filter+='"; exit}'
  output=$(perl -ne "$perl_filter")
  echo "$output"
}


volume=$(amixer -D default | format)

echo -e "{\"text\":\""$volume "\", \"percentage\":\"$volume\"}"
