# ~/.bashrc
#
# ----------------- bash prompt ----------------------------
if [[ -f `which powerline-daemon` && $(tput colors) -gt 8 ]]; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    . /usr/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh
else
    export PS1='\033[0m\]\u@\h:\033[0m\]\w\[\033[1;33m\]$(parse_git_branch)\033[0m\]$ '
fi
# ------------------- aliases ------------------------------
# Add bash aliases.
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# --------------- environment variables ---------------------
export CHROME_BIN="/usr/bin/chromium"
export NODE_ENV="development"
# export TERM=rxvt-unicode-256color # for a colorful rxvt unicode session
# can also set in .npmrc
export npm_config_prefix=$HOME/.local/node_modules

export ASPNETCORE_ENVIRONMENT=Development
export DOTNET_CLI_TELEMETRY_OPTOUT=1 # seems to cause segmentation faults with openssl-1.0

export ANDROID_HOME=/opt/android-sdk

# ------------- PATH ----------------
PATH=$PATH:$HOME/.local/bin:$HOME/.bin:$HOME/.local/node_modules/bin
export PATH

# fix issue with android studio on tiling managers
# https://issuetracker.google.com/issues/36975466
# export _JAVA_AWT_WM_NONREPARENTING=1
# export JAVA_HOME=/usr/lib/jvm/java-x-openjdk

# PATH=$PATH:$HOME/.node_modules/bin:$HOME/.bin:$Home/.local/bin
# PATH=$PATH:$ANDROID_HOME:$npm_config_prefix/bin
# PATH=$PATH:$ANDROID_HOME

if [ -d ~/.gem/ruby/2.4.0/bin ]; then
    PATH=$PATH:~/.gem/ruby/2.4.0/bin
fi
# ------- bash completions ------------

# git completion
if [ -f ~/.bash_completions/git-completion.bash ]; then
    . ~/.bash_completions/git-completion.bash
fi

# ng-cli completion
if [ -f ~/.bash_completions/ng-cli.bash ]; then
    . ~/.bash_completions/ng-cli.bash
fi

#-tns-completion-start-#
if [ -f ~/.bash_completions/nativescript.bash ]; then
    source ~/.bash_completions/nativescript.bash
fi

[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion


#  --------- some functions -----------
function docker-ip() {
    docker inspect --format '{{ .NetworkSettings.IPAddress }}' "$@"
}

function snapshot-home() {
    sudo snapper -c home create -d "$(date)"
}

function snapshot-root() {
    sudo snapper -c root create -d "$(date)"
}

function parse_git_dirty {
    [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}

function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

# eval `dircolors ~/.dir_colors`
if [[ -f ~/.dircolors && $(tput colors) -gt 8 ]]; then
    eval "`dircolors -b ~/.dircolors`"
else
    LS_COLORS=$LS_COLORS:'di=0;32:'
    export LS_COLORS
fi
