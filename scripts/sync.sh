#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

# dotDir="~/github/dotFiles"                    # dotfiles directory
# olddir="dotfiles_old"             # old dotfiles backup directory

dotFiles=('.bashrc' '.bash_profile' '.vimrc.d' '.vimrc/' '.Xresources' '.config/i3' '.config/sway' '.config/pystatus')    # list of files/folders to symlink in homedir
rsync -rtv --exclude=.git* --exclude=*.sh --exclude=*.md --exclude=etc --exclude=scripts ~/github/dotFiles/ ~/
# create dotfiles_old in homedir 
