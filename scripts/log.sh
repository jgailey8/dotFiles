#!/bin/bash
#script to keep basic personal log entries and quickly view system logfiles
logfile=~/.myLog

if [ ! -e "$logfile" ] ; then
    touch "$logfile"
fi


if [ $# -eq 0 ]; then
    #echo "No arguments provided"
    cat $logfile
    exit 1
fi
 
while getopts ":a:vpxm" opt; do
  case $opt in
    a) #add log entry
      TIME=$(date +"[%b/%d/%Y:%k:%M]")
      echo "$TIME : $OPTARG" >> $logfile #>&2
      ;;
    v)	#view logfile
      less $logfile
      ;;
    p)  #pacman log
      #echo "pacman log"
      less /var/log/pacman.log | grep -i installed
      ;;
    x) #xorg log
      less  ~/.local/share/xorg/Xorg.0.log
      #echo "xorg log"
      ;;
    # m) #messages log
    #   less /var/log/messages
    #   ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

