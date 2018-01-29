typeset -U path

export XKB_DEFAULT_LAYOUT=us
# remap caps to escape
export XKB_DEFAULT_OPTIONS=caps:escape

export CHROME_BIN="/usr/bin/chromium"
export NODE_ENV="development"
# can also set in .npmrc
export npm_config_prefix=$HOME/.local/node_modules
export npm_config_cache=$HOME/.local/npm_cache
export PATH=$PATH:$npm_config_prefix/bin
export ASPNETCORE_ENVIRONMENT=Development
export ASPNETCORE_URLS=http://0.0.0.0:5000
export HISTCONTROL=ignoredups
export LANG="en_US.UTF-8"
export EDITOR="nvim"
export XDG_CONFIG_HOME=$HOME/.config

# fix issue with android studio on tiling managers
# https://issuetracker.google.com/issues/36975466
export _JAVA_AWT_WM_NONREPARENTING=1
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk

# ------------- PATH ----------------
# if [ -d ~/.local/Android/sdk ]; then
    export ANDROID_HOME=$HOME/.local/Android/sdk
    export PATH=$PATH:$ANDROID_HOME/tools
    export PATH=$PATH:$ANDROID_HOME/tools/bin
    export PATH=$PATH:$ANDROID_HOME/platform-tools
# fi

# my scripts folder
if [ -d ~/.local/bin ]; then
    export PATH=$PATH:$HOME/.local/bin
fi
