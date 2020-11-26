#!/bin/sh

DOT_FILES=(.vim .vimrc .vimrc.plugin .vimrc.keymap .gvimrc .gitconfig .tmux.conf Brewfile)

for file in ${DOT_FILES[@]}
do
  ln -s $HOME/dotfiles/$file $HOME/$file
done

FISH_CONFIGS=(config.fish fishfile)

for file in ${FISH_CONFIGS[@]}
do
  ln -s $HOME/dotfiles/$file $HOME/.config/fish/$file
done

# nvim configs
ln -s $HOME/.vimrc $HOME/.config/nvim/init.vim
ln -s $HOME/dotfiles/dein.toml $HOME/.config/nvim/dein.toml
ln -s $HOME/dotfiles/dein_lazy.toml $HOME/.config/nvim/dein_lazy.toml
