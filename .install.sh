#!/bin/bash
# install.sh

# Packages
brew install neovim tmux fzf ripgrep starship zsh uv

# Set up dotfiles bare repo
git clone --bare git@github.com:williamsnsung/dotfiles.git ~/.dotfiles
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
