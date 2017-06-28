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

[[ -f ~/.bashrc ]] && . ~/.bashrc
