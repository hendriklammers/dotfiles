#!/bin/bash

# Create symlinks
links=(
  ".aliases"
  ".bash_profile"
  ".bashrc"
  ".functions"
  ".gitconfig"
  ".inputrc"
  ".prompt"
  ".tern-config"
  ".tmux.conf"
  ".vim"
  ".vimrc"
)

for i in "${links[@]}"
do
  ln -svh $HOME/dotfiles/$i $HOME/$i
done
