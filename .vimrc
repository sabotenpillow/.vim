"***********************************************************************
" plugin
"***********************************************************************

" プラグインのインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~#'/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(expand('~/.cache/dein'))

  let s:toml = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_tomll(s:lazy_toml, {'lazy': 1})
  
  " call dein#add(~/.vim/dein/repos/github.com/Shougo/dein.vim)
  " call dein#add('Shougo/neocomplete.vim')
  
  " NeoBundle 'tpope/vim-surround'
  " 
  " NeoBundle 'mattn/emmet-vim'
  " 
  " NeoBundle 'Yggdroot/indentLine'
  " " let g:indentLine_faster = 1
  " " nmap <silent><Leader>i :<C-u>IndentLinesToggle<CR>
  " " let g:indentLine_color_term = 111
  " " let g:indentLine_color_gui = '#708090'
  " let g:indentLine_char = '¦'
  
  " NeoBundle 'MaxMEllon/molokai'
  
  " call dein#add('MaxMEllon/molokai')
  " call dein#add('')
  
  " filetype plugin indent on     " required!
  " filetype indent on
  
  call dein#end()
  call dein#save_state()
endif

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
" if has('mouse')
"   set mouse=a
" endif

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



" カラースキーマの設定--------------------------------------------------

syntax on

" 色の設定(syntax onのあと) molokai
" set t_Co=256
" try
"   colorscheme molokai
"   let g:molokai_original = 1
" catch
"   colorscheme desert
" endtry

