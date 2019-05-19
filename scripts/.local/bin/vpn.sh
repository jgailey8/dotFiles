#!/bin/bash

status=$(nmcli con show --active | grep -i vpn | awk '{ printf "%s %s", $1, $2 }')

if [ -z "$status" ]
    then
        class=inactive
    else
        class=active
        tooltip=$(ip addr show tun0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)
fi

echo -e "{\"text\":\""$status"\", \"class\":\""$class"\", \"tooltip\":\""$tooltip"\"}"
