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
  ".irbrc"
  ".prompt"
  ".psqlrc"
  ".ripgreprc"
  ".tmux.conf"
  ".vim"
  ".vimrc"
)

for i in "${links[@]}"
do
  ln -sv "$HOME"/.dotfiles/"$i" "$HOME"/"$i"
done
