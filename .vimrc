if &compatible
  set nocompatible               " Be iMproved
endif

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
" call dein#add('Shougo/neocomplete.vim')

call dein#add('Shougo/vimshell', { 'rev': '3787e5'})

call dein#add('MaxMEllon/molokai')
call dein#add('tpope/vim-surround')
call dein#add('mattn/emmet-vim')

call dein#add('Yggdroot/indentLine')
let g:indentLine_faster = 1
nmap <silent><Leader>i :<C-u>IndentLinesToggle<CR>
let g:indentLine_color_term = 111
let g:indentLine_color_gui = '#708090'
let g:indentLine_char = '¦'

call dein#add('Townk/vim-autoclose')

call dein#add('itchyny/lightline.vim')
call dein#add('tpope/vim-fugitive')
let g:lightline = {
  \ 'colorscheme': 'default',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'fugitive': 'LightLineFugitive',
  \ },
  \ }
function! LightLineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

set laststatus=2

call dein#add('tpope/vim-endwise')

call dein#end()

filetype plugin indent on     " required!


if dein#check_install()
  call dein#install()
endif

"***** set *********************************************
set nocompatible
" encord
set encoding=utf-8
" file encord
set fileencodings=utf-8
set fileformats=unix,dos,mac
" filetypeの自動認識をon
filetype on
" swapファイルを作成しない
set noswapfile
" cursorline
set cursorline
" コマンドライン保管を便利に
set wildmenu
" line number display
set number
set relativenumber
" 不可視文字
set list
set listchars=eol:$,tab:>-,trail:_,extends:<
" 現在行
set ruler
" ペアマッチに <> を追加
set matchpairs& matchpairs+=<:>
" 不明
set showmatch
" 移動コマンドを使ったとき，行頭に移動しない
set nostartofline
" 不明
set matchtime=3
" use OS's clipboard
set clipboard=unnamed,autoselect
" no Beep
set visualbell
set t_vb=
" if has('mouse')
"   set mouse=a
" endif
" 画面に余裕を持たせてスクロール
set scrolloff=5
" <F11>でpaste, nopaste を切り替え
set pastetoggle=<F11>
" bufferが変更されているとき，エラーでなく，保存するかを確認
set confirm
" 不明
set infercase
" not distinguish upper and lower
set ignorecase
" height of command line
set cmdheight=1
" 不明
set smartcase
" エンターを押す前から検索開始
set incsearch
" 検索結果をハイライト
set hlsearch
" コマンド表示
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
" view cursorline
set cursorline

"***** normal & command **********************************************
"noremap <silent> <C-,> ^
"noremap <silent> <C-.> $
"noremap <silent> < {
"noremap <silent> > }

"***** normal mode ***************************************************
" nnoremap ; ^
nnoremap ; :


"***** command line mode ***************************************************
cnoremap gad Gwrite
cnoremap gst Gstatus
cnoremap gdf Gdiff

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
" inoremap { {}<left>
" inoremap [ []<left>
" inoremap ( ()<left>
" inoremap " ""<left>
" inoremap ' ''<left>
" inoremap <> <><left>

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

set noshowmode
