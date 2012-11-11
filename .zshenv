#パス関連の設定
#
#rvm関係
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

#nvm関連
[[ -s "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh"

#PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:

###PATHの追加###
#アンドロイドの開発ツールのパス
export PATH=$PATH:$HOME/eclipse/android-sdk-mac_86/tools
export PATH=$PATH:$HOME/eclipse/android-sdk-mac_86/platform-tools
export PATH=$PATH:$HOME/eclipse/findbugs-2/bin

# wireshark
export PATH=$PATH:/Applications/Wireshark.app/Contents/Resources/bin

PATH=$HOME/.rvm/bin:$PATH # Add RVM to PATH for scripting
PATH=${HOME}/.cabal/bin:$PATH
