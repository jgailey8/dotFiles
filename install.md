# install dots with
    stow -v -t $HOME bash vim Xresources xinit i3 sway

# remove dots with
    stow -D -v -t $HOME bash vim Xresources xinit i3 sway

# relink dots with 

    stow -D -v -t $HOME bash vim Xresources xinit i3 sway

## dev-stuff

    stow -v dev-stuff

## extra ...ie choose only what you want
    stow -v -t $HOME extra --ignore '\.config|\.bin|\.evroutercc|\.wallpapers'
## etc
 recomend just copying files
