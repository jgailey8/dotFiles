# ===== ENVIRONMENT ===== {{{
export EDITOR='nvim'
export LANG=en_US.UTF-8
export XKB_DEFAULT_LAYOUT=us
# remap caps to escape
export XKB_DEFAULT_OPTIONS=caps:escape

export CHROME_BIN="/usr/bin/chromium"
# can also set in .npmrc
export npm_config_prefix=$HOME/.local/node_modules
export npm_config_cache=$HOME/.local/npm_cache

export HISTCONTROL=ignoredups
export LANG="en_US.UTF-8"
export EDITOR="nvim"
export XDG_CONFIG_HOME=$HOME/.config

# Development environment variables
export NODE_ENV="development"

export JAVA_HOME=/usr/lib/jvm/default
# export JAVA_HOME=/usr/lib/jvm/java-8-openjdk

# fix issue with android studio on tiling managers
# https://issuetracker.google.com/issues/36975466
export _JAVA_AWT_WM_NONREPARENTING=1

export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1
export DOTNET_ROOT=/opt/dotnet
export ASPNETCORE_URLS="http://*:5000/"

# meson pkconfig
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
# }}}
# ==== PATH ==== {{{
# npm/node
if type npm > /dev/null 2>&1; then
    export PATH=$PATH:$npm_config_prefix/bin
fi

# android sdk
if [ -d "/opt/android-sdk" ]; then
    export ANDROID_HOME=/opt/android-sdk
    export PATH=$PATH:$ANDROID_HOME/tools
    export PATH=$PATH:$ANDROID_HOME/tools/bin
    export PATH=$PATH:$ANDROID_HOME/platform-tools
    export PATH=$PATH:$ANDROID_HOME/build-tools
fi

# my scripts
if [ -d "$HOME/.local/bin" ]; then
    export PATH=$PATH:$HOME/.local/bin
fi

# dotnet
if type dotnet > /dev/null 2>&1; then
    export ASPNETCORE_ENVIRONMENT=Development
    export ASPNETCORE_URLS=http://0.0.0.0:5000
    export PATH="$PATH:$HOME/.dotnet/tools"
fi
if [ -d "$HOME/.dotnet" ]; then
    export PATH="$PATH:$HOME/.dotnet"
fi

# ruby
if type ruby > /dev/null 2>&1; then
    export GEM_HOME=$HOME/.local/gem
    export PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
fi
# go
export GOPATH=$HOME/.local/go
export PATH="$PATH:$GOPATH/bin"
#}}}
# ==== funcs === {{{
help() {
    if ! type tldr > /dev/null; then
        echo "could not find tldr"
    elif [ $# -eq 0 ]; then
        echo "No arguments provided"
    else
        command tldr "$@" | vless
    fi
}
# }}}

# vim:foldmethod=marker:foldlevel=0:ft=sh
