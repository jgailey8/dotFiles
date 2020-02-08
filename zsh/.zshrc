setopt correct                                                  # Auto correct mistakes
# setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
# setopt rcexpandparam                                            # Array expension with parameters
# setopt nocheckjobs                                              # Don't warn about running processes when exiting
# setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
# setopt autocd                                                   # if only directory path is entered, cd there.

autoload -Uz compinit
compinit

COMPLETION_WAITING_DOTS="true"

# smart case sensitive completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
expand-or-complete-with-dots() {
  echo -n "\e[31m...\e[0m"
  zle expand-or-complete
  zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

## ==== zgen ==== {{{
source "${HOME}/.zgen/zgen.zsh"

# if the init script doesn't exist
if ! zgen saved; then
	# zgen oh-my-zsh
	zgen oh-my-zsh plugins/jump
	zgen oh-my-zsh plugins/extract
	# zgen load zsh-users/zsh-completions
	# zgen load lukechilds/zsh-better-npm-completion

	# zgen oh-my-zsh plugins/git
    zgen load lukechilds/zsh-better-npm-completion
	zgen load paulmelnikow/zsh-startup-timer

	zgen load mafredri/zsh-async
	zgen load sindresorhus/pure pure.zsh

  # generate the init script from plugins above
  zgen save
fi
#}}}
## ==== zplug ==== {{{
# export ZPLUG_HOME=${HOME}/.zplug
# if [[ ! -d ${ZPLUG_HOME} ]]; then
#     git clone https://github.com/zplug/zplug $ZPLUG_HOME
# fi
#
# if [ -d $ZPLUG_HOME ]; then
#     source $ZPLUG_HOME/init.zsh
#
#     # Let zplug manage zplug
#     zplug 'zplug/zplug', hook-build:'zplug --self-manage'
#
#     if ! zplug check --verbose; then
#         printf "Install? [y/N]: "
#         if read -q; then
#             echo; zplug install
#         fi
#     fi
#
#     # zplug "zsh-users/zsh-autosuggestions" # history completion
#     zplug "plugins/jump", from:oh-my-zsh
#     # zplug "plugins/systemd", from:oh-my-zsh
#     #zplug "plugins/extract", from:oh-my-zsh
#
#     # Load completion library for those sweet [tab] squares
#     zplug "lib/completion", from:oh-my-zsh
#     # Syntax highlighting for commands, load last
#     # zplug "zsh-users/zsh-syntax-highlighting", from:github, defer:3
#     zplug "paulmelnikow/zsh-startup-timer"
#
#     # zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme from:github, if:"[[ $TERM != linux ]]"
#     # zplug "agnoster/agnoster-zsh-theme", use:agnoster.zsh-theme, from:github, as:theme
#     # zplug "BrandonRoehl/zsh-clean", use:clean.plugin.zsh, from:github, as:theme
#     # zplug "wesbos/Cobalt2-iterm", use:cobalt2.zsh-theme, from:github, as:theme
#     # zplug "mafredri/zsh-async", defer:0
#     # zplug "sindresorhus/pure", use:pure.zsh, as:theme
#     # zplug "mafredri/zsh-async", from:github
#     # zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
#     # zplug "DFurnes/purer", use:pure.zsh, from:github, as:theme
#
#
#     zplug load #--verbose
# fi
# }}}
## ==== Aliases ==== {{{
## Alias section 
alias e="$EDITOR"
alias v="nvim"
alias cp="cp -i"                                                # Confirm before overwriting something
alias df='df -h'                                                # Human-readable sizes
alias ls="ls --color=auto"
alias ll="ls -l --color=auto"
alias la="ls -la --color=auto"
alias i3rc="$EDITOR ~/.config/i3/config"
alias swayrc="$EDITOR ~/.config/sway/config"
alias bashrc="$EDITOR ~/.bashrc"
alias vimrc="$EDITOR ~/.vimrc"
alias nvimrc="$EDITOR ~/.config/nvim/init.vim"
alias xrc="$EDITOR ~/.Xresources"
alias gitrc="$EDITOR $HOME/.gitconfig"
alias chrome="chromium"
alias dropTerm="urxvt -name dropTerm"
alias h="history"
alias cl="clear"
alias sc="sudo systemctl"
alias scu="systemctl --user"
alias chrome-dev="google-chrome-stable --remote-debugging-port=9222"
alias node-dev="export NODE_ENV=development"
alias node-test="export NODE_ENV=test"
alias node-prod="export NODE_ENV=production"
alias dotnet-dev="export ASPNETCORE_ENVIRONMENT=Development"
alias dotnet-prod="export ASPNETCORE_ENVIRONMENT=Production"
alias gs="git status"
alias gl="git log"
alias gb="git branch"
alias gc="git checkout"
alias gd="git diff"

alias torrent="transmission-remote-cli -n -c danglePi:8080"
alias mount-danglepi="sshfs jared@danglePi:/mnt/Drive /mnt/DanglePi"
alias serve="browser-sync start -s -f . --no-notify --host $LOCAL_IP --port 9000 --single"
alias weather="curl wttr.in"
alias wiki="vim -c VimwikiIndex" #$HOME/.wiki/index.md"
alias st="tabbed -r 2 st -w ''"

# use trash-cli
if type trash > /dev/null 2>&1; then
    alias rm="trash"
fi

# migrating to neovim
if type nvim > /dev/null 2>&1; then
    alias vim="nvim"
fi

alias vless="/bin/sh -c \"col -b | \vim --not-a-term -c 'set ft=man laststatus=0 nomod nolist noma' -\""

# export PAGER=/usr/bin/vimpager
# alias less=$PAGER
# export MANPAGER="/bin/sh -c \"col -b | \vim --not-a-term -c 'set ft=man laststatus=0 nomod nolist noma' -\""
#}}}

if [[ $TERM == linux ]]; then
    autoload -Uz promptinit
    promptinit
    prompt suse
fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fnm
export PATH=/home/jared/.fnm:$PATH
eval "`fnm env --multi`"
