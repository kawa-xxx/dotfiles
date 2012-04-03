#!/bin/sh

DOT_FILES=(.zshrc .vim .vimrc .vimrc.plugin .gvimrc .gitconfig)

for file in ${DOT_FILES[@]}
do
  ln -s $HOME/dotfiles/$file $HOME/$file
done
