"---書式設定---
"新しい行のインデントを前の行と揃える
set autoindent

" 縦幅　デフォルト24
set lines=40
" 横幅　デフォルト80
set columns=120

" ウインドウを半透明にする
gui
set transparency=230

" 256色表示にする
" colorscheme よりも先に指定する必要がある！
set t_Co=256
colorscheme desert

" IMEの状況によってカーソルの色をかえる
if has('multi_byte_ime')
  highlight Cursor guifg=NONE guibg=Green
  highlight CursorIM guifg=NONE guibg=Purple
endif

" フォントの設定
set guifont=Ricty_Diminished:h12:cSHIFTJIS
set guifontwide=Ricty_Diminished:h12:cSHIFTJIS
