alias less=$PAGER
alias ls="ls --color=auto"
alias i3rc="vim ~/.config/i3/config"
alias swayrc="vim ~/.config/sway/config"
alias bashrc="vim ~/.bashrc"
alias vimrc="vim ~/.vimrc"
alias nvimrc="vim ~/.config/nvim/init.vim"
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
alias dotnet-dev="export ASPNETCORE_ENVIRONMENT=Development"
alias dotnet-prod="export ASPNETCORE_ENVIRONMENT=Production"
alias snapshot-home="snapper -c home create -d '$(date)'"
alias snapshot-root="sudo snapper -c root create -d '$(date)'"

# use trash-cli
if type trash > /dev/null 2>&1; then
    alias rm="trash"
fi
# migrating to neovim
if type nvim > /dev/null 2>&1; then
    alias vim="nvim"
fi
