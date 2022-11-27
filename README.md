# usage

## Deploy the config files
* $ git clone git@github.com:kawa-xxx/dotfiles.git
* $ setup.sh

## Instal form Homebrew
* $ brew bundle install

## Change shell
* $ sudo vim /etc/shells に fish を追記する
* $ chsh -s /usr/local/bin/fish

## Install fisher
* $ curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
* $ fisher

## Vim のセットアップ
* $ mkdir .cache
* $ curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
* $ sh ./installer.sh .cache
* vim :call dein#install()

* $ pyenv install 3.10.8
* $ pyenv global 3.10.8
* $ pip install neovim

## tmux のセットアップ
* $ pip install powerline-status

## Font のインストール
- $ git clone https://github.com/powerline/fonts.git
- $ cd fonts
- $ ./install.sh
- ターミナルのフォントをパワーラインのものに変更する
