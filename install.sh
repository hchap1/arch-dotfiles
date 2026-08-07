#!/usr/bin/env bash
cd ~/dotfiles || exit
stow -t ~/.config fish git nvim
stow -t ~ bash tmux
