if &compatible
  set nocompatible               " Be iMproved
endif

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
" call dein#add('Shougo/neocomplete.vim')

" NeoBundle 'tpope/vim-surround'
" NeoBundle 'mattn/emmet-vim'
" NeoBundle 'Yggdroot/indentLine'
" " let g:indentLine_faster = 1
" " nmap <silent><Leader>i :<C-u>IndentLinesToggle<CR>
" " let g:indentLine_color_term = 111
" " let g:indentLine_color_gui = '#708090'
" let g:indentLine_char = '¦'

call dein#add('MaxMEllon/molokai')
" call dein#add('')

call dein#add('Shougo/vimshell', { 'rev': '3787e5'})

call dein#end()

filetype plugin indent on     " required!


if dein#check_install()
  call dein#install()
endif

"***** set *********************************************
" encord
set encoding=utf-8
" file encord
set fileencodings=utf-8
set fileformats=unix,dos,mac
" swapファイルを作成しない
set noswapfile
" line number display
set number
set relativenumber
" display by relative number
" set relativenumber
" 不可視文字
set list
set listchars=eol:$,tab:>-,trail:_,extends:<
" 現在行
set ruler
" ペアマッチに <> を追加
set matchpairs& matchpairs+=<:>
" 不明
set showmatch
" 不明
set matchtime=3
" no Beep
set visualbell
set vb t_vb
if has('mouse')
  set mouse=a
endif

" 不明
set infercase
" not distinguish upper and lower
set ignorecase
" 不明
set smartcase
" 不明
set incsearch
" 不明
set hlsearch
" 不明
set showcmd
" 
set backspace=indent,eol,start
" indent
set expandtab     " タブ入力を複数の空白入力に置き換える
set tabstop=2     " 画面上でタブ文字が占める幅
set shiftwidth=2  " 自動インデントでずれる幅
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent    " 開業時に前の行のインデントを継続
set smartindent   " 開業時に入力された行の末尾に合わせて次の行のインデントを増減
" 不明
set cursorline

"***** normal & command **********************************************
"noremap <silent> <C-,> ^
"noremap <silent> <C-.> $
"noremap <silent> < {
"noremap <silent> > }

"***** normal mode ***************************************************
" nnoremap ; ^
nnoremap ; :

"***** insert mode ***************************************************
" insert
" inoremap <silent> <C-j> <ESC>
inoremap <silent> jj <ESC>
inoremap <silent> <C-j> j

" move
inoremap <silent> <C-l> <right>

" backspase & delete
inoremap <silent> <C-h> <C-g>u<C-h>
inoremap <silent> <C-d> <DEL>

" 
inoremap { {}<left>
inoremap [ []<left>
inoremap ( ()<left>
inoremap " ""<left>
inoremap ' ''<left>
inoremap <> <><left>


"***********************************************************************
" plugin
"***********************************************************************


" カラースキーマの設定--------------------------------------------------

filetype indent on
syntax on

" 色の設定(syntax onのあと) molokai
set t_Co=256
try
  colorscheme molokai
  let g:molokai_original = 1
catch
  colorscheme desert
endtry

