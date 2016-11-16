#!/usr/bin/python
#http://i3pystatus.readthedocs.io/en/latest/i3pystatus.html
from i3pystatus import Status
from i3pystatus.updates import pacman, cower
from i3pystatus.mail import imap
status = Status(standalone=True)

# status.register("clock",
#     format="%b %-d %I:%M %P",)

status.register("clock",
    format="%b %-d %I:%M %P",)

# Shows your CPU temperature, if you have a Intel CPU
status.register("temp",
    format=" {temp:.0f}°C",)

status.register("updates",
                format = "Updates: {count}",
                format_no_updates = "No updates",
                backends = [pacman.Pacman(), cower.Cower()])

# status.register("mail",
#     backends=[
#         imap.IMAP(
#              # port and ssl are the defaults
#              host="imap.googlemail.com", port=993, ssl=True,
#              username="", password=""
#             )
#     ])

# status.register("keyboard_locks",
#     format="{caps}", caps_off="")
#
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
