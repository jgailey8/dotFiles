#!/usr/bin/python
#http://i3pystatus.readthedocs.io/en/latest/i3pystatus.html
from i3pystatus import Status
# from i3pystatus.updates import pacman, cower
status = Status(standalone=True)

status.register("battery",
    format="{status} {percentage_design:.2f}% {remaining:%E%hh:%Mm}",
    alert=True,
    alert_percentage=15,
    charging_color ="#ffffff",
    full_color="#ffffff",
    status={
        "DIS":  "",
        "CHR":  "",
        "FULL": "",
    },)

status.register("network",
        interface="enp0s25",
        format_up="{v4cidr}",
        format_down="",
        ignore_interfaces = ["lo", "wlp3s0"])

status.register("network",
    interface="wlp3s0",
    format_up=" {essid} \[{v4} \]",
    #format_up="W: {v4} {quality}% at {essid}",
    format_down="  none",
    color_up="#FFFFFF",
    color_down="#FFFFFF",
    ignore_interfaces = ["lo", "enp0s25"])

status.register("backlight",
    format="   {percentage}",
    backlight="intel_backlight",
    on_upscroll="brightness up",
    on_downscroll="brightness down",)

status.register("alsa",
    format="  {volume}",
    format_muted=" {volume}")

status.run()
