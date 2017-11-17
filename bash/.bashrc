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


if [ -d ~/.gem/ruby/2.4.0/bin ]; then
    PATH=$PATH:~/.gem/ruby/2.4.0/bin
fi
# ------- bash completions ------------

# git completion
if [ -f ~/.bash_completions/git-completion.bash ]; then
    . ~/.bash_completions/git-completion.bash
fi

# ng-cli completion
if [ -f ~/.bash_completions/ng-completion.bash ]; then
    . ~/.bash_completions/ng-completion.bash
fi

#-tns-completion-start-#
if [ -f ~/.bash_completions/tns-completion.bash ]; then
    source ~/.bash_completions/tns-completion.bash
fi

#-dotnet-completion-start-#
if [ -f ~/.bash_completions/dotnet-completion.bash ]; then
    source ~/.bash_completions/dotnet-completion.bash
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
[ -e "$HOME/.dircolors" ]; DIR_COLORS="$HOME/.dircolors"
[ -e "$DIR_COLORS" ] || DIR_COLORS=""
eval "`dircolors -b $DIR_COLORS`"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
