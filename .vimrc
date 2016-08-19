"***********************************************************************
" vim-plug
"***********************************************************************

call plug#begin('~/.vim/plugged')

Plug 'MaxMEllon/molokai'
Plug 'jonathanfilip/vim-lucius'
Plug 'cocopon/iceberg.vim'

Plug 'tpope/vim-surround'
Plug 'cohama/lexima.vim'
Plug 'osyo-manga/vim-over'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/vim-easy-align'
Plug 'LeafCage/yankround.vim'
Plug 'kana/vim-smartchr'

Plug 'slim-template/vim-slim', { 'for': 'slim' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'maxmellon/vim-jsx-pretty', { 'for': ['javascript.jsx'] }
Plug 'elzr/vim-json', { 'for': ['json.ika'] }

Plug 'Yggdroot/indentLine'

Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-rails'
Plug 'mattn/emmet-vim'

call plug#end()

filetype off
filetype plugin indent off

"***** filetype ****************************************
" set filetype {{{
function! s:set_filetype(...)
  execute 'autocmd BufRead,BufNewFile ' . '*'.a:1 . ' set filetype=' . a:2
endfunction
command! -nargs=* SetFileType call s:set_filetype(<f-args>)

let s:MyFileTypes = [
  \   {'file' : '.md',       'type' : 'markdown'},
  \   {'file' : '.slim',     'type' : 'slim'},
  \   {'file' : '.less',     'type' : 'less'},
  \   {'file' : '.coffee',   'type' : 'coffee'},
  \   {'file' : '.scss',     'type' : 'scss'},
  \   {'file' : '.sass',     'type' : 'sass'},
  \   {'file' : '.cjsx',     'type' : 'coffee'},
  \   {'file' : '.exs',      'type' : 'elixir'},
  \   {'file' : '.ex',       'type' : 'elixir'},
  \   {'file' : '.toml',     'type' : 'toml'},
  \   {'file' : '_spec.rb',  'type' : 'rspec'},
  \   {'file' : '.jsx',      'type' : 'javascript.jsx'},
  \   {'file' : '.es6',      'type' : 'javascript'},
  \   {'file' : '.react.js', 'type' : 'javascript.jsx'},
  \   {'file' : '.fish',     'type' : 'fish'},
  \   {'file' : '.babelrc',  'type' : 'json'},
  \   {'file' : '.eslintrc', 'type' : 'yaml'},
  \ ]

for s:e in s:MyFileTypes
  execute 'SetFileType ' . s:e['file'] . ' ' . s:e['type']
endfor
" }}}


"***** set *********************************************
" encord
set encoding=utf-8
" file encord
set fileencodings=utf-8
set fileformats=unix,dos,mac
" swapファイルを作成しない
set noswapfile
" set directory=$HOME/vim_swap
" backup
set nobackup
" set backup
" set backupdir=$HOME/vim_backup
" liny number display
set number
" display by relative number
set relativenumber
" 不可視文字
set list
set listchars=eol:¬,tab:»\ ,trail:_,extends:<
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
" set virtualedit=onemore
" set viminfo
set viminfo='50,\"1877,:0,h,n~/.vim/.viminfo

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
set whichwrap=b,s,h,l,<,>,[,]
" set nowrapscan
" 
set backspace=indent,eol,start
" indent
if expand('%:e') != 'go'
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

" regist undo history
if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
endif

" share yank data on other vim process
" see: http://shirakiya.hatenablog.com/entry/2015/01/30/025257
" Linuxの場合はviminfoを用いてヤンクデータを共有
" let OSTYPE = system('uname')
" if OSTYPE == "Linux\n"
"     noremap y y:wv<CR>
"     noremap p :rv!<CR>p
" endif

"***** normal & command **********************************************
"noremap <silent> <C-,> ^
"noremap <silent> <C-.> $
"noremap <silent> < {
"noremap <silent> > }

"***** normal mode ***************************************************
" nnoremap ; ^
" nnoremap ; :
" nnoremap <expr> / _(":%s/<Cursor>/&/gn")

function! s:move_cursor_pos_mapping(str, ...)
    let left = get(a:, 1, "<Left>")
    let lefts = join(map(split(matchstr(a:str, '.*<Cursor>\zs.*\ze'), '.\zs'), 'left'), "")
    return substitute(a:str, '<Cursor>', '', '') . lefts
endfunction

function! _(str)
    return s:move_cursor_pos_mapping(a:str, "\<Left>")
endfunction

"***** insert mode ***************************************************
" insert
inoremap <silent> jj <ESC>
inoremap <silent> <C-j> j

" move
inoremap <silent> <C-l> <right>

" backspase & delete
inoremap <silent> <C-h> <C-g>u<C-h>
inoremap <silent> <C-d> <DEL>

"***** visual mode ***************************************************
vnoremap * "zy:let @/ = @z<CR>n

"***** plugins ***************************************************
let s:plug = {
  \ "plugs": get(g:, 'plugs', {})
  \ }
function! s:plug.is_installed(name)
  return has_key(self.plugs, a:name) ? isdirectory(self.plugs[a:name].dir) : 0
endfunction
" }}}

if s:plug.is_installed('indentLine') " {{{
  let g:indentLine_faster = 1
  nmap <silent><Leader>i :<C-u>IndentLinesToggle<CR>
  let g:indentLine_color_term = 207
  let g:indentLine_color_gui = '#708090'
  let g:indentLine_char = '¦'
endif
" }}}

if s:plug.is_installed('lightline.vim') "{{{
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
endif
" }}}

if s:plug.is_installed('vim-easy-align') "{{{
  vnoremap <Enter> :EasyAlign<CR>
  xmap ga <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)
endif
" }}}

if s:plug.is_installed('yankround.vim')
  nmap p <Plug>(yankround-p)
  xmap p <Plug>(yankround-p)
  nmap P <Plug>(yankround-P)
  nmap gp <Plug>(yankround-gp)
  xmap gp <Plug>(yankround-gp)
  nmap gP <Plug>(yankround-gP)
  nmap <C-p> <Plug>(yankround-prev)
  nmap <C-n> <Plug>(yankround-next)
endif

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
filetype plugin indent on
set secure
