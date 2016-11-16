# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTSIZE=50
export HISTCONTROL=ignoredups
if [ -f `which powerline-daemon` ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/lib/python3.5/site-packages/powerline/bindings/bash/powerline.sh
fi

export LANG="en_US.UTF-8"
export NODE_ENV="development"
alias ls='ls --color=auto'
alias i3rc='vim ~/.config/i3/config'
alias bashrc='vim ~/.bashrc'
alias vimrc='vim ~/.vimrc'
alias xrc='vim ~/.Xresources'
alias gitrc='$EDITOR $HOME/.gitconfig'
alias xrdb='xrdb ~/.Xresources'
alias h="history"
alias cl="clear"
alias sc="systemctl"
