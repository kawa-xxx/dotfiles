#!/bin/sh

DOT_FILES=(.zshrc .zshenv .vim .vimrc .vimrc.plugin .gvimrc .gitconfig .tmux.conf .gemrc)

for file in ${DOT_FILES[@]}
do
  ln -s $HOME/dotfiles/$file $HOME/$file
done
