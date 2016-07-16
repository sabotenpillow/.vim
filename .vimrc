"***********************************************************************
" z-plug
"***********************************************************************

call plug#begin('~/.vim/plugged')

Plug 'MaxMEllon/molokai'
Plug 'jonathanfilip/vim-lucius'
Plug 'cocopon/iceberg.vim'

Plug 'tpope/vim-surround'
Plug 'cohama/lexima.vim'

Plug 'Yggdroot/indentLine'
  let g:indentLine_faster = 1
  nmap <silent><Leader>i :<C-u>IndentLinesToggle<CR>
  let g:indentLine_color_term = 207 "111
  let g:indentLine_color_gui = '#708090'
  let g:indentLine_char = '¦'

Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
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

Plug 'tpope/vim-rails'

call plug#end()

filetype plugin indent on

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
" 不明
set matchtime=3
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
" 不明
set incsearch
" 不明
set hlsearch
" show inputing command
set showcmd
" 
set backspace=indent,eol,start
" indent
if expand('%:t') =~ '.*\.go'
  set expandtab     " タブ入力を複数の空白入力に置き換える
  set tabstop=2     " 画面上でタブ文字が占める幅
  set shiftwidth=2  " 自動インデントでずれる幅
  set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
endif
set autoindent    " 改行時に前の行のインデントを継続
set smartindent   " 改行時に入力された行の末尾に合わせて次の行のインデントを増減
" display cursor line
set cursorline
" set background color
set background=dark

"***** normal & command **********************************************
"noremap <silent> <C-,> ^
"noremap <silent> <C-.> $
"noremap <silent> < {
"noremap <silent> > }

"***** normal mode ***************************************************
" nnoremap ; ^
" nnoremap ; :

"***** insert mode ***************************************************
" insert
inoremap <silent> jj <ESC>
inoremap <silent> <C-j> j

" move
inoremap <silent> <C-l> <right>

" backspase & delete
inoremap <silent> <C-h> <C-g>u<C-h>
inoremap <silent> <C-d> <DEL>


" カラースキーマの設定--------------------------------------------------

" syntax on

" 色の設定(syntax onのあと) molokai
set t_Co=256
try
  colorscheme iceberg
  " let g:molokai_original = 1
catch
  colorscheme pablo
endtry

set t_ut=    " see https://sunaku.github.io/vim-256color-bce.htmlet
syntax on
filetype indent on
set secure
