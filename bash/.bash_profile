#
# ~/.bash_profile
#

# --------------- environment variables ---------------------
# export JAVA_HOME=$(update-alternatives --query javac | sed -n -e 's/Best: *\(.*\)\/bin\/javac/\1/p')

export XKB_DEFAULT_LAYOUT=us
# remap caps to escape
export XKB_DEFAULT_OPTIONS=caps:escape

export CHROME_BIN="/usr/bin/chromium"
export NODE_ENV="development"
# export TERM=rxvt-unicode-256color # for a colorful rxvt unicode session
# can also set in .npmrc
export npm_config_prefix=$HOME/.local/node_modules
export npm_config_cache=$HOME/.local/npm_cache

export ASPNETCORE_ENVIRONMENT=Development
export DOTNET_CLI_TELEMETRY_OPTOUT=1 # seems to cause segmentation faults with openssl-1.0

# export ANDROID_HOME=/opt/android-sdk

export HISTCONTROL=ignoredups
export LANG="en_US.UTF-8"
export EDITOR="vim"
# export LIBVA_DRIVER_NAME="i965"
# export VDPAU_DRIVER="vs_gl"
export XDG_CONFIG_HOME=$HOME/.config

# fix issue with android studio on tiling managers
# https://issuetracker.google.com/issues/36975466
export _JAVA_AWT_WM_NONREPARENTING=1
# export JAVA_HOME=/usr/lib/jvm/java-x-openjdk
# ------------- PATH ----------------
# if [ -d ~/$HOME/.local/android-sdk ]; then
    export ANDROID_HOME=$HOME/.local/android-sdk
    export PATH=$PATH:$ANDROID_HOME/tools
    export PATH=$PATH:$ANDROID_HOME/tools/bin
    export PATH=$PATH:$ANDROID_HOME/platform-tools
# fi
# if which  npm>/dev/null; then
# export PATH=$PATH:$(npm bin -g)
# fi
# if [ -d ~/$HOME/.local/node_modules/bin ]; then
    export PATH=$PATH:$HOME/.local/node_modules/bin
# fi

export PATH=$PATH:$HOME/.local/bin:$HOME/.bin

# LS_COLORS=$LS_COLORS:'di=0;32:' ; export LS_COLORS
HISTSIZE=50

[[ -f ~/.bashrc ]] && . ~/.bashrc

# start cdm on loggin
# NOTE:: cdm started for all users in /etc/profile.d/zzz-cdm.sh
if [[ "$(tty)" == '/dev/tty1' ]]; then
    [[ -n "$CDM_SPAWN" ]] && return
    # Avoid executing cdm(1) when X11 has already been started.
    [[ -z "$DISPLAY$SSH_TTY$(pgrep xinit)" ]] && exec cdm
fi
