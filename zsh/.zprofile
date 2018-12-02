[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'

bindkey '^[[3~'  delete-char
bindkey '^?' backward-delete-char
bindkey -v '^?' backward-delete-char

# alt hjkl vim movement
bindkey "^[h" backward-char
bindkey "^[l" forward-char
bindkey "^[k" up-line-or-history
bindkey "^[j" down-line-or-history
