#!/bin/sh

DOT_FILES=(config.fish fishfile .vim .vimrc .vimrc.plugin .vimrc.keymap .gvimrc .gitconfig .tmux.conf)

for file in ${DOT_FILES[@]}
do
  ln -s $HOME/dotfiles/$file $HOME/$file
done
