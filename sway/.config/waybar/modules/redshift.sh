#!/bin/sh

while [[ "$#" -gt 0 ]]; do case $1 in
  -t|--toggle) toggle=1;;
esac; shift; done
isRunning=$(pgrep -x redshift)
if [ $toggle ]; then
    if [ $isRunning ]; then
            systemctl --user stop redshift
    else
            systemctl --user start redshift
    fi
else
    if [ $isRunning ]; then
        echo -e "{\"text\":\"\", \"class\":\"active\"}"
    else
        echo -e "{\"text\":\"\", \"class\":\"inactive\"}"
    fi
fi
