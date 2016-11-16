#!/usr/bin/python
#http://i3pystatus.readthedocs.io/en/latest/i3pystatus.html
from i3pystatus import Status
from i3pystatus.updates import pacman, cower
status = Status()

status.register("clock",
    format="%a %-d %b %X",)

status.register("text",
    text="HELLO",
    #on_leftclick ="pkill -SIGUSR1 -f 'python /home/user/.config/i3/bar.py'",
    on_leftclick ="open_webbrowser")

# Shows your CPU temperature, if you have a Intel CPU
status.register("temp",
    format=" {temp:.0f}°C",)

status.register("battery",
    #format='{status}: {percentage_design:.2f}% {remaining:%E%hh:%Mm}',
    format="{status} {percentage_design:.2f}% {remaining:%E%hh:%Mm}",
    alert=True,
    alert_percentage=5,
    charging_color ="#ffffff",
    full_color="#ffffff",
    status={
        "DIS":  "",
        "CHR":  "",
        "FULL": "",
    },)

status.register("load",
    format=" {avg5}",)

status.register("cpu_freq",
    format="{avgg} GHz",)
status.register("backlight",
    format=" : {percentage}",
    backlight="intel_backlight",
    on_upscroll="brightness up",
    on_downscroll="brightness down",)
status.register("alsa",
    format="  {volume}",
    format_muted=" {volume}")

status.register("network",
        interface="enp0s25",
        format_up="{v4cidr}",
        format_down="")

status.register("network",
    interface="wlp3s0",
    format_up=" {essid} \[{v4} \]",
    #format_up="W: {v4} {quality}% at {essid}",
    format_down="  none",
    color_up="#FFFFFF",
    color_down="#FFFFFF")

status.register("updates",
                format = "Updates: {count}",
                format_no_updates = "No updates",
                backends = [pacman.Pacman(), cower.Cower()])

status.register("dpms")
# Shows disk usage of /
# Format:
# 42/128G [86G]
#status.register("disk",
#    path="/",
#    format="{used}/{total}G [{avail}G]",)


# Shows mpd status
# Format:
# Cloud connected▶Reroute to Remain
#status.register("mpd",
#    format="{title}{status}{album}",
#    status={
#        "pause": "▷",
#        "play": "▶",
#        "stop": "◾",
#    },)

status.run()
