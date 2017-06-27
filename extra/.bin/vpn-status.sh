#!/bin/sh
#Author: Jared Gailey
#Date: 5/3/17
#
var=$(ip route show | grep tun0)
if [[ -z "$var" ]]; then
    echo false
else
    echo true
fi
