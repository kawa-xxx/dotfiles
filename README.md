# usage
* install fish, git, tmux, pyenv, fzf
* only mac
  * brew install reattach-to-user-namespace

## Deploy the config files
* $ git clone git@github.com:kawa-xxx/dotfiles.git
* $ setup.sh

## Change shell
* $ sudo vim /etc/shells に fish を追記する
* $ chsh -s /usr/local/bin/fish

## Install fisher
* $ curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
* $ fisher

## Vim のセットアップ
* $ curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
* $ sh ./installer.sh {specify the installation director
* vim :call dein#install()
* patched font
  * https://github.com/Lokaltog/vim-powerline/wiki/Patched-fonts

* $ pyenv install 3.6.10
* $ pyenv global 3.6.10
* $ pip install neovim

## Font のインストール
$ git clone https://github.com/powerline/fonts.git
$ cd fonts
$ ./install.sh

## vscode のセットアップ
```
$ cd vscode
$ sh restore.sh
```
