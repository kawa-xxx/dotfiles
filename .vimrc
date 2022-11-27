"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('~/.cache/dein/')

call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
" Load toml files

let s:toml_dir = $HOME . '/.config/nvim/'
let s:toml = s:toml_dir . 'dein.toml'
let s:lazy_toml = s:toml_dir . 'dein_lazy.toml'

call dein#load_toml(s:toml, {'lazy':0})
call dein#load_toml(s:lazy_toml, {'lazy':1})

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------


"--keymapファイルを読み込む
if filereadable(expand('~/.vimrc.keymap'))
  source ~/.vimrc.keymap
endif

"---GUIに依存しない設定------------------------------------
"行番号を表示する
set number
"TAB幅を2にする
set tabstop=2
"autoindentなどのタブ幅
set shiftwidth=2
"タブをスペースに展開する
set expandtab
"新しい行のインデントを現在行と同じにする
set autoindent
"ルーラを表示する
set ruler
" エンコーディングの設定
set encoding=utf-8
"不可視文字を表示する
set list
set listchars=tab:»-,trail:-,eol:$,extends:»,precedes:«,nbsp:%
hi SpecialKey term=underline ctermfg=darkgray guifg=darkgray

"タイトルを表示する
set title
"対応する｛を表示する
set showmatch
"モードを表示する
set showmode
" ヤンクでクリップボードと共有する
set clipboard=unnamed
"シンタックスハイライトを有効にする
syntax on
"検索結果をハイライトする
set hlsearch
" ターミナルでもマウスを使用できる用にする
set mouse=a
set guioptions+=a
if !has('nvim')
  set ttymouse=xterm2
endif

" ESCを押すとIMEをオフにする
set imdisable
" undo ディレクトリを設定する
set undodir=~/var/vim/

"---GUI関連の設定-----------------------------------------------
" ステータスラインを表示する
set laststatus=2
" ステータスラインに改行コードを表示する
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" vim-powerlineでフォントにパッチを当てないなら以下をコメントアウト
let g:Powerline_symbols = 'fancy'
" ツールバーを非表示にする
set guioptions-=T
" カレント行にアンダーラインを引く
set cursorline
" カレントウインドウにのみアンダーラインを引く
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END
" アンダーラインのカラー設定
hi CusorLine cterm=underline ctermfg=NONE ctermbg=NONE
hi CusorLine gui=underline guifg=NONE guibg=NONE

" 256色表示にする
" colorscheme よりも先に指定する必要がある！
set t_Co=256
colorscheme desert

" カーソルの形状を変化させる ESCで抜けると画面が一瞬動くけど
" Ctrl+cで抜けると動かない(tmux上のVimだと動作しない
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
inoremap <Esc> <Esc>gg`]`

"---ファイル関連の設定------------------------------------------
"バックアップファイルを作成しない
set nobackup
" スワップファイルを作成しない
set noswapfile

"---開発関連の設定----------------------------------------------
" JavaScriptの設定
autocmd FileType javascript :compiler gjslint
autocmd QuickFixCmdPost make copen

autocmd FileType javascript setlocal omnifunc=nodejscomplete#CompleteJS
if !exists('g:neocomplcache_omni_functions')
  let g:neocomplcache_omni_functions = {}
endif
let g:neocomplcache_omni_functions.javascript = 'nodejscomplete#CompleteJS'

let g:node_usejscomplete = 1


"--- deoplete の設定 -------------------------------------------
let g:deoplete#enable_at_startup = 1

"---QuickRunの設定----------------------------------------------
" Markdownの設定
let g:quickrun_config = {}
let g:quickrun_config._ = {'runner' : 'vimproc'}
let g:quickrun_config.markdown = { 'outputter' : 'browser', }
" HTMLの設定
let g:quickrun_config['html'] = {'command' : 'cat', 'exec':['%c %s'], 'outputter' : 'browser'}
" Rspecの設定
" specファイル全体を実行する場合
let g:quickrun_config['ruby.rspec'] = {
                \ 'command': 'rspec',
                \ 'outputter/buffer/filetype' : 'rspec-result'
                \ }
augroup RSpec
  autocmd!
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END

"---ShowMark7の設定---------------------------------------------
hi SingColumn ctermfg=white ctermbg=black cterm=none

hi default ShowMarksHLl ctermfg=red ctermbg=black cterm=none
hi default ShowMarksHLu ctermfg=red ctermbg=black cterm=none
hi default ShowMarksHLo ctermfg=red ctermbg=black cterm=none
hi default ShowMarksHLm ctermfg=red ctermbg=black cterm=none

let g:showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

"---バイナリエディタの設定--------------------------------------
"バイナリ編集(xxd)モード（vim -b での起動、もしくは *.bin ファイルを開くと発動します）
augroup BinaryXXD
  autocmd!
  autocmd BufReadPre  *.bin let &binary =1
  autocmd BufReadPost * if &binary | silent %!xxd -g 1
  autocmd BufReadPost * set ft=xxd | endif
  autocmd BufWritePre * if &binary | %!xxd -r | endif
  autocmd BufWritePost * if &binary | silent %!xxd -g 1
  autocmd BufWritePost * set nomod | endif
augroup END

"---全角スペースを視覚化----------------------------------------
if has('syntax')
  syntax enable
  function! ActivateInvisibleIndicator()
    highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=#FF0000
    match ZenkakuSpace /　/
  endfunction
  augroup InvisibleIndicator
    autocmd!
    autocmd BufEnter * call ActivateInvisibleIndicator()
  augroup END
endif

"---<TAB>で補完-------------------------------------------------
" {{{ Autocompletion using the TAB key
" This function determines, wether we are on the start of the line text (then tab indents) or
" if we want to try autocompletion
function! InsertTabWrapper()
        let col = col('.') - 1
        if !col || getline('.')[col - 1] !~ '\k'
                return "\<TAB>"
        else
                if pumvisible()
                        return "\<C-N>"
                else
                        return "\<C-N>\<C-P>"
                end
        endif
endfunction
" Remap the tab key to select action with InsertTabWrapper
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
" }}} Autocompletion using the TAB key
"---<TAB>で補完終了--------------------------------------------

" 文字コードの自動認識------------------------------------------------
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

" 文字コードの自動認識終わり----------------------------------------------
