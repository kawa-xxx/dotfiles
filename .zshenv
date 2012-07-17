#パス関連の設定
#
#rvm関係
[[ -s "/Users/kawamura/.rvm/scripts/rvm" ]] && source "/Users/kawamura/.rvm/scripts/rvm"  # This loads RVM into a shell session.

PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:

###PATHの追加###
#アンドロイドの開発ツールのパス
export PATH=$PATH:/Users/kawamura/eclipse/android-sdk-mac_86/tools
export PATH=$PATH:/Users/kawamura/eclipse/android-sdk-mac_86/platform-tools
export PATH=$PATH:/Users/kawamura/eclipse/findbugs-2/bin

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=${HOME}/.cabal/bin:$PATH
