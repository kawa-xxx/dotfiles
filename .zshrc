# 言語設定
export LANG=ja_JP.UTF-8

# プロンプトの表示設定
PROMPT="%(3~,%-1~/.../%1~,%~)/%% "
PROMPT2="%_%% "
SPROMPT="% is corrent?[n,y,a,e]: "

#########################
# キーバインド
#########################
# viライク
#bindkey -v
# Emacsライク（デフォルト）
#bindkey -e


########################
# 補完関係
#########################
# 補完機能を有効にする
autoload -U compinit
compinit

# ディレクトリ名を入力するだけでカレントディレクトリを変更
setopt auto_cd


#########################
# エイリアス関連
#########################
# gvimでMacVimが立ち上がるようする
alias gvim='env LANG=ja_JP.UTF-8 open -a /Applications/MacVim.app/Contents/MacOS/MacVim "$@"'
# vimでMacVim(ターミナル版)が立ち上がるようにする
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'


#########################
# カラー関連
#########################
# ls コマンドをカラー表示する
alias ls='ls -G'
# lsコマンドの補完候補にも色付き表示
# ls出表示されるディレクトリの色変更（黒画面で見やすいように）
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors \
        'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# kill の候補にも色付き表示
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'


#########################
# 履歴関連
#########################
# ヒストリーファイルを指定
HISTFILE=~/.zsh_history
# ヒストリに保存するコマンド数
HISTSIZE=10000
# ヒストリファイルに保存するコマンド数
SAVEHIST=10000
# 重複するコマンド行は古い行を削除する
setopt hist_ignore_all_dups
# 直前と同じコマンド行はヒストリに追加しない
setopt hist_ignore_dups
# コマンド履歴ファイルを共有する
setopt share_history
# 履歴を追記する
setopt append_history
# 履歴をインクリメンタルに追加
setopt inc_append_history
# historyコマンドは経歴に追加しない
setopt hist_no_store
# 余分な空白は詰めて記録
setopt hist_reduce_blanks
# 先頭がスペースの場合ヒストリに追加しない
#setopt hist_ignore_space

#########################
# その他
#########################


