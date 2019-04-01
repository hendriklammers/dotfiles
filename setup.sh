#!/bin/bash

# Create symlinks
links=(
  ".aliases"
  ".bash_profile"
  ".bashrc"
  ".functions"
  ".ghci"
  ".gitconfig"
  ".inputrc"
  ".prompt"
  ".ripgreprc"
  ".tern-config"
  ".tmux.conf"
  ".vim"
  ".vimrc"
)

for i in "${links[@]}"
do
  ln -svh "$HOME"/dotfiles/"$i" "$HOME"/"$i"
done
