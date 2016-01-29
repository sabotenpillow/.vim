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
set autoindent
set smartindent
" 不明
set cursorline

"***** normal & command **********************************************
"noremap <silent> <C-,> ^
"noremap <silent> <C-.> $
"noremap <silent> < {
"noremap <silent> > }

"***** normal mode ***************************************************
nnoremap ; ^

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

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

filetype off

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
    if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
      echo "install NeoBundle"
      :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vimT")
    endif
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" NeoBundle 自体を NeoBundle で管理
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'tpope/vim-surround'

NeoBundle 'mattn/emmet-vim'

" NeoBundle 'Yggdroot/indentLine'
" let g:indentLine_faster = 1
" nmap <silent><Leader>i :<C-u>IndentLinesToggle<CR>
" let g:indentLine_color_term = 111
" let g:indentLine_color_gui = '#708090'
" let g:indentLine_char = '¦'

" カラースキーマの設定--------------------------------------------------
NeoBundle 'MaxMEllon/molokai'

call neobundle#end()

filetype plugin indent on     " required!
filetype indent on

NeoBundleCheck


syntax on

" 色の設定(syntax onのあと) molokai
set t_Co=256
try
  colorscheme molokai
  let g:molokai_original = 1
catch
  colorscheme desert
endtry

