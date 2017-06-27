#!/bin/sh
# fan spindown controller script
# for i in {0..5};do echo 0 > /sys/class/thermal/cooling_device$i/cur_state; done
for i in {0..5};do cat /sys/class/thermal/cooling_device$i/cur_state; done
