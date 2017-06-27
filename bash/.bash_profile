#
# ~/.bash_profile
#

# export JAVA_HOME=$(update-alternatives --query javac | sed -n -e 's/Best: *\(.*\)\/bin\/javac/\1/p')
HISTSIZE=50
export HISTCONTROL=ignoredups
export LANG="en_US.UTF-8"
export EDITOR="vim"
export CHROME_BIN="/usr/bin/chromium"
export NODE_ENV="development"
# export npm_config_prefix=~/.local/node_modules
export npm_config_prefix=~/.node_modules

export ASPNETCORE_ENVIRONMENT=Development
export DOTNET_CLI_TELEMETRY_OPTOUT=1 # seems to cause segmentation faults with openssl-1.0

export ANDROID_HOME=/opt/android-sdk

# fix issue with android studio on tiling managers
# https://issuetracker.google.com/issues/36975466
# export _JAVA_AWT_WM_NONREPARENTING=1
# export JAVA_HOME=/usr/lib/jvm/java-x-openjdk

PATH=$PATH:$HOME/.node_modules/bin:$HOME/.bin:$Home/.local/bin
PATH=$PATH:$ANDROID_HOME
export PATH

if [ -d ~/.gem/ruby/2.4.0/bin ]; then
    PATH=$PATH:~/.gem/ruby/2.4.0/bin
fi
export LIBVA_DRIVER_NAME="i965"
export VDPAU_DRIVER="vs_gl"

[[ -f ~/.bashrc ]] && . ~/.bashrc
