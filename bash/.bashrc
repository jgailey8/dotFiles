# ~/.bashrc
#

if [[ -f `which powerline-daemon` && $(tput colors) -gt 8 ]]; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    . /usr/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh
else
    export PS1='\033[0m\]\u@\h:\033[0m\]\w\[\033[1;33m\]$(parse_git_branch)\033[0m\]$ '
fi

LS_COLORS=$LS_COLORS:'di=0;32:' ; export LS_COLORS
# if [ "$TERM" != "dumb" ]; then
#     [ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
#     [ -e "$DIR_COLORS" ] || DIR_COLORS=""
#     eval "`dircolors -b $DIR_COLORS`"
# fi
export XKB_DEFAULT_LAYOUT=us
export XKB_DEFAULT_OPTIONS=caps:escape

alias less=$PAGER
alias rm="trash"
alias ls="ls --color=auto"
alias i3rc="vim ~/.config/i3/config"
alias swayrc="vim ~/.config/sway/config"
alias bashrc="vim ~/.bashrc"
alias vimrc="vim ~/.vimrc"
alias xrc="vim ~/.Xresources"
alias gitrc="$EDITOR $HOME/.gitconfig"
alias chrome="chromium"
alias myTerm="urxvtc -name myTerm"
alias xrdb="xrdb ~/.Xresources"
alias h="history"
alias cl="clear"
alias sc="systemctl"
alias chrome-dev="chromium --remote-debugging-port=9222"
alias node-dev="export NODE_ENV=development"
alias node-test="export NODE_ENV=test"
alias node-prod="export NODE_ENV=production"
alias snapshot-home="snapper -c home create -d '$(date)'"
alias snapshot-root="sudo snapper -c root create -d '$(date)'"

if [ -f ~/.bash_completions/git-completion.bash ]; then
    . ~/.bash_completions/git-completion.bash
fi

if [ -f ~/.bash_completions/ng-cli.bash ]; then
    . ~/.bash_completions/ng-cli.bash
fi

###-tns-completion-start-###
if [ -f /home/jared/.tnsrc ]; then
    source /home/jared/.tnsrc
fi

[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion


function docker-ip() {
    docker inspect --format '{{ .NetworkSettings.IPAddress }}' "$@"
}

function parse_git_dirty {
    [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

function extract()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)
                tar xvjf $1
                ;;
            *.tar.gz)
                tar xvzf $1
                ;;
            *.bz2)
                bunzip2 $1
                ;;
            *.rar)
                unrar x $1
                ;;
            *.gz)
                gunzip $1
                ;;
            *.tar)
                tar xvf $1
                ;;
            *.tbz2)
                tar xvjf $1
                ;;
            *.tgz)
                tar xvzf $1
                ;;
            *.zip)
                unzip $1
                ;;
            *.Z)
                uncompress $1
                ;;
            *.7z)
                7z x $1
                ;;
            *)
                echo "'$1' cannot be extracted via extract"
                ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#
