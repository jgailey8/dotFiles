#
# ~/.bash_profile
#

PATH="$HOME/.node_modules/bin:$PATH"
PATH=$PATH:~/.bin
if [ -d ~/.gem/ruby/2.4.0/bin ]; then
    PATH=$PATH:~/.gem/ruby/2.4.0/bin
fi
export PATH

HISTSIZE=50
export HISTCONTROL=ignoredups
export LANG="en_US.UTF-8"
export EDITOR="vim"
export CHROME_BIN="/usr/bin/chromium"
export NODE_ENV="development"
export npm_config_prefix=~/.node_modules

export ASPNETCORE_ENVIRONMENT=Development
export DOTNET_CLI_TELEMETRY_OPTOUT=1 # seems to cause segmentation faults with openssl-1.0

export LIBVA_DRIVER_NAME="i965"
export VDPAU_DRIVER="vs_gl"

[[ -f ~/.bashrc ]] && . ~/.bashrc
