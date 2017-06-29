#
# ~/.bash_profile
#

# export JAVA_HOME=$(update-alternatives --query javac | sed -n -e 's/Best: *\(.*\)\/bin\/javac/\1/p')
export XKB_DEFAULT_LAYOUT=us

# remap caps to escape
export XKB_DEFAULT_OPTIONS=caps:escape

# LS_COLORS=$LS_COLORS:'di=0;32:' ; export LS_COLORS
HISTSIZE=50
export HISTCONTROL=ignoredups
export LANG="en_US.UTF-8"
export EDITOR="vim"
export LIBVA_DRIVER_NAME="i965"
export VDPAU_DRIVER="vs_gl"
export XDG_CONFIG_HOME=$HOME/.config

[[ -f ~/.bashrc ]] && . ~/.bashrc

# start cdm on loggin 
# NOTE:: cdm started for all users in /etc/profile.d/zzz-cdm.sh
if [[ "$(tty)" == '/dev/tty1' ]]; then
    [[ -n "$CDM_SPAWN" ]] && return
    # Avoid executing cdm(1) when X11 has already been started.
    [[ -z "$DISPLAY$SSH_TTY$(pgrep xinit)" ]] && exec cdm
fi
 # autologin on tty1
#  if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
#      echo "Start my window manager script"
#      bash .bin/wm-menu.sh
#  fi
