"***********************************************************************
" vim-plug
"***********************************************************************

call plug#begin('~/.vim/plugged')

Plug 'MaxMEllon/molokai'
Plug 'jonathanfilip/vim-lucius'
Plug 'cocopon/iceberg.vim'

Plug 'mhinz/vim-startify'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'tpope/vim-surround'    " similar to 'vim-operator-surround' and 'vim-sandwich'
Plug 'cohama/lexima.vim'
Plug 'osyo-manga/vim-over'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/vim-easy-align'
Plug 'LeafCage/yankround.vim'
Plug 'kana/vim-smartchr'
Plug 'Shougo/neocomplete.vim'
Plug 'osyo-manga/vim-monster', { 'for': 'ruby' }
Plug 'moll/vim-node'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'coderifous/textobj-word-column.vim'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/vim-asterisk'
Plug 'haya14busa/vim-operator-flashy'
Plug 'osyo-manga/vim-anzu'
Plug 'tmhedberg/matchit'
Plug 'osyo-manga/vim-jplus'
Plug 'osyo-manga/vim-over'
Plug 't9md/vim-quickhl'
Plug 'wellle/targets.vim'
Plug 'bkad/CamelCaseMotion'
Plug 'rking/ag.vim'
" Plug 'terryma/vim-multiple-cursors'
Plug 'kana/vim-niceblock'
Plug 'kshenoy/vim-signature'
Plug 'kana/vim-altr'

Plug 'kana/vim-textobj-user'
Plug 'osyo-manga/vim-textobj-multiblock'
Plug 'kana/vim-textobj-function'
Plug 'rhysd/vim-textobj-ruby', { 'for': 'ruby' }
Plug 'machakann/vim-textobj-delimited'
Plug 'glts/vim-textobj-indblock'
Plug 'thinca/vim-textobj-between'
Plug 'Julian/vim-textobj-variable-segment'    " similar to 'machakann/vim-textobj-delimited'
Plug 'vimtaku/vim-textobj-sigil'

Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace'
Plug 'tyru/operator-camelize.vim'

Plug 'slim-template/vim-slim', { 'for': 'slim' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'maxmellon/vim-jsx-pretty', { 'for': ['javascript.jsx'] }
Plug 'elzr/vim-json', { 'for': ['json', 'ika'] }
Plug 'tmux-plugins/vim-tmux', { 'for': ['tmux', 'conf'] }

Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'

if has('ruby')
  Plug 'todesking/ruby_hl_lvar.vim', { 'for': 'ruby' }
endif
Plug 'tpope/vim-rails'
Plug 'mattn/emmet-vim'

call plug#end()

filetype off
filetype plugin indent off


"***** filetype ****************************************
let mapleader = "\<Space>"

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
  \   {'file' : '.ika',      'type' : 'ika'},
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

"***** normal & commandline **********************************************
"noremap <silent> <C-,> ^
"noremap <silent> <C-.> $
"noremap <silent> < {
"noremap <silent> > }

"***** normal mode ***************************************************
" nnoremap ; ^
" nnoremap ; :
nnoremap Y y$

" nnoremap <expr> / _(":%s/<Cursor>/&/gn")
" function! s:move_cursor_pos_mapping(str, ...)
"   let left = get(a:, 1, "<Left>")
"   let lefts = join(map(split(matchstr(a:str, '.*<Cursor>\zs.*\ze'), '.\zs'), 'left'), "")
"   return substitute(a:str, '<Cursor>', '', '') . lefts
" endfunction
" function! _(str)
"   return s:move_cursor_pos_mapping(a:str, "\<Left>")
" endfunction

"***** commandline mode ***************************************************
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>

"***** insert mode ***************************************************
" insert
inoremap <silent> jj <ESC>
inoremap <silent> <C-j> j
" move
inoremap <silent> <C-l> <right>
" backspase & delete
inoremap <silent> <C-h> <C-g>u<C-h>
inoremap <silent> <C-d> <DEL>
" add a newline & move the newline
inoremap <silent> <C-o> <ESC>o

"***** visual mode ***************************************************
" vnoremap * "zy:let @/ = @z<CR>n

"***** plugins ***************************************************
let s:plug = {
  \ "plugs": get(g:, 'plugs', {})
  \ }
function! s:plug.is_installed(name)
  return has_key(self.plugs, a:name) ? isdirectory(self.plugs[a:name].dir) : 0
endfunction
" }}}

if s:plug.is_installed('vim-startify') " {{{
  " startifyのヘッダー部分に表示する文字列を設定する(dateコマンドを実行して日付を設定している)
  let g:startify_custom_header =
    \ map(split(system('date'), '\n'), '"   ". v:val') + ['','']
  " デフォルトだと、最近使ったファイルの先頭は数字なので、使用するアルファベットを指定
  " let g:startify_custom_indices = ['f', 'g', 'h', 'r', 'i', 'o', 'b']
  let g:startify_custom_indices = ['f', 'd', 'n', 'm', 'v', 'g', 'u', 'r', 'i', 's', 'l', 'a', 'c', 'x', 'w', 'o', 'h', 'y', 't', 'b', 'z', 'p']
  " よく使うファイルをブックマークとして登録しておく
  let g:startify_bookmarks = [
    \ '~/.vimrc',
    \ ]
endif

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
    \             [ 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'separator': { 'left': "\ue0c6", 'right': "" },
    \ 'subseparator': { 'left': '|', 'right': '|' },}
    " \ 'component_function': {
    " \   'fugitive': 'LightLineFugitive',
    " \ },}
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

if s:plug.is_installed('neocomplete.vim')
  "Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
  " Disable AutoComplPop.
  let g:acp_enableAtStartup = 0
  " Use neocomplete.
  let g:neocomplete#enable_at_startup = 1
  " Use smartcase.
  let g:neocomplete#enable_smart_case = 1
  " Set minimum syntax keyword length.
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

  " Define dictionary.
  let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

  " Define keyword.
  if !exists('g:neocomplete#keyword_patterns')
      let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'

  " Plugin key-mappings.
  inoremap <expr><C-g>     neocomplete#undo_completion()
  inoremap <expr><C-l>     neocomplete#complete_common_string()

  " Recommended key-mappings.
  " <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? "\<C-y>" : "\<CR>"
  endfunction
  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
  " Close popup by <Space>.
  "inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

  " AutoComplPop like behavior.
  "let g:neocomplete#enable_auto_select = 1

  " Shell like behavior(not recommended).
  "set completeopt+=longest
  "let g:neocomplete#enable_auto_select = 1
  "let g:neocomplete#disable_auto_complete = 1
  "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

  " Enable omni completion.
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

  " Enable heavy omni completion.
  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif
  "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
  "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
  "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

  " For perlomni.vim setting.
  " https://github.com/c9s/perlomni.vim
  let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
endif

if s:plug.is_installed('vim-monster')
  " Use neocomplete.vim
  let g:neocomplete#sources#omni#input_patterns = {
    \   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
    \}

  " Set async completion.
  let g:monster#completion#rcodetools#backend = "async_rct_complete"

  " With neocomplete.vim
  let g:neocomplete#sources#omni#input_patterns = {
    \   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
    \}

  " With deoplete.nvim
  let g:monster#completion#rcodetools#backend = "async_rct_complete"
  let g:deoplete#sources#omni#input_patterns = {
    \   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
    \}
endif

if s:plug.is_installed('todesking/ruby-hl-lvar.vim')
  " Highligt group name for local variable
  " Default: 'Identifier'
  let g:ruby_hl_lvar_hl_group = 'RubyLocalVariable'

  " Auto enable and refresh highlight when text is changed. Useful but bit slow.
  " Default: 1
  let g:ruby_hl_lvar_auto_enable = 0

  " If you wish to control the plugin manually, map these functions.
  nmap <leader>he <Plug>(ruby_hl_lvar-enable)
  nmap <leader>hd <Plug>(ruby_hl_lvar-disable)
  nmap <leader>hr <Plug>(ruby_hl_lvar-refresh)
endif

if s:plug.is_installed('moll/vim-node')
  autocmd User Node
    \ if &filetype == "javascript" |
    \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
    \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
    \ endif
endif

if s:plug.is_installed('vim-easymotion')
  map <Leader> <Plug>(easymotion-prefix)
  let g:EasyMotion_do_mapping = 0 " Disable default mappings
  " let g:EasyMotion_keys='jkfdnmvgurieslacxwohytbzqpJKFDNMVGURIESLACXWOHYTBZQP'
  let g:EasyMotion_keys='jkfdnmvgurieslacxwohytbzqp;,.'
  let g:EasyMotion_leader_key=";"
  " 1 ストローク選択を優先
  " let g:EasyMotion_grouping=1
  " カラー設定変更
  hi EasyMotionTarget ctermbg=none ctermfg=red
  hi EasyMotionShade  ctermbg=none ctermfg=blue
  " JK motions: Line motions
  map  <Leader>h <Plug>(easymotion-linebackward)
  map  <Leader>j <Plug>(easymotion-j)
  map  <Leader>k <Plug>(easymotion-k)
  map  <Leader>l <Plug>(easymotion-lineforward)
  nmap <Leader><Leader>l <Plug>(easymotion-lineanywhere)
  let g:EasyMotion_startofline = 0  " keep cursor column when JK motion
  " Move to line
  map  <Leader>L <Plug>(easymotion-bd-jk)
  nmap <Leader><Leader>L <Plug>(easymotion-overwin-line)
  " <Leader>f{char}{char} to move to {char}
  map  <Leader>f <Plug>(easymotion-bd-f2)
  map  <Leader>F <Plug>(easymotion-F2)
  nmap <Leader><Leader>f <Plug>(easymotion-overwin-f2)
  map  <Leader>t <Plug>(easymotion-bd-t2)
  map  <Leader>T <Plug>(easymotion-T2)
  " Gif config
  nmap <Leader>s <Plug>(easymotion-s2)
  " Move to word
  map  <Leader>w <Plug>(easymotion-bd-w)
  map  <Leader>W <Plug>(easymotion-bd-W)
  nmap <Leader><Leader>w <Plug>(easymotion-overwin-w)
  map  <Leader>b <Plug>(easymotion-b)
  map  <Leader>B <Plug>(easymotion-B)
  map  <Leader>e <Plug>(easymotion-bd-e)
  map  <Leader>E <Plug>(easymotion-bd-E)
  map  <Leader>ge <Plug>(easymotion-ge)
  map  <Leader>gE <Plug>(easymotion-gE)
  " Jump to latest '/' or '?'
  nmap <Leader>n <Plug>(easymotion-vim-n)
  nmap <Leader>N <Plug>(easymotion-vim-N)
  nmap <Leader>; <Plug>(easymotion-next)
  nmap <Leader>, <Plug>(easymotion-prev)
  " Turn on case insensitive feature
  let g:EasyMotion_smartcase = 1
  " nmap <Leader>a <Plug>(easymotion-iskeyword-b)
  " nmap <Leader>c <Plug>(easymotion-n)
endif

if s:plug.is_installed('incsearch.vim')
  map /  <Plug>(incsearch-forward)
  map ?  <Plug>(incsearch-backward)
  map g/ <Plug>(incsearch-stay)
  " :h g:incsearch#auto_nohlsearch
  set hlsearch
  let g:incsearch#auto_nohlsearch = 1
  map n  <Plug>(incsearch-nohl-n)
  map N  <Plug>(incsearch-nohl-N)
  " coexist with vim-anzu
  if s:plug.is_installed('vim-anzu')
    nmap  n <Plug>(incsearch-nohl)<Plug>(anzu-n-with-echo)
    nmap  N <Plug>(incsearch-nohl)<Plug>(anzu-N-with-echo)
  endif
  if s:plug.is_installed('vim-asterisk')
    " coexist with vim-asterisk
    map *   <Plug>(incsearch-nohl)<Plug>(asterisk-*)
    map #   <Plug>(incsearch-nohl)<Plug>(asterisk-#)
    map g*  <Plug>(incsearch-nohl)<Plug>(asterisk-g*)
    map g#  <Plug>(incsearch-nohl)<Plug>(asterisk-g#)
    map z*  <Plug>(incsearch-nohl0)<Plug>(asterisk-z*)
    map gz* <Plug>(incsearch-nohl0)<Plug>(asterisk-gz*)
    map z#  <Plug>(incsearch-nohl0)<Plug>(asterisk-z#)
    map gz# <Plug>(incsearch-nohl0)<Plug>(asterisk-gz#)
    let g:asterisk#keeppos = 1
  else
    map *  <Plug>(incsearch-nohl-*)
    map #  <Plug>(incsearch-nohl-#)
    map g* <Plug>(incsearch-nohl-g*)
    map g# <Plug>(incsearch-nohl-g#)
  endif
  " see: https://github.com/haya14busa/incsearch.vim#example
  " function! s:noregexp(pattern) abort
  "   return '\V' . escape(a:pattern, '\')
  " endfunction
  " function! s:config() abort
  "   return {'converters': [function('s:noregexp')]}
  " endfunction
  " noremap <silent><expr> z/ incsearch#go(<SID>config())
endif

if s:plug.is_installed('incsearch-fuzzy.vim')
  map z/  <Plug>(incsearch-fuzzy-/)
  map z?  <Plug>(incsearch-fuzzy-?)
  map zg/ <Plug>(incsearch-fuzzy-stay)
  " Use both fuzzy & fuzzyspell feature
  function! s:config_fuzzyall(...) abort
    return extend(copy({
    \   'converters': [
    \     incsearch#config#fuzzy#converter(),
    \     incsearch#config#fuzzyspell#converter()
    \   ],
    \ }), get(a:, 1, {}))
  endfunction
  noremap <silent><expr> z/ incsearch#go(<SID>config_fuzzyall())
  noremap <silent><expr> z? incsearch#go(<SID>config_fuzzyall({'command': '?'}))
  noremap <silent><expr> zg? incsearch#go(<SID>config_fuzzyall({'is_stay': 1}))
endif

if s:plug.is_installed('incsearch-easymotion.vim')
  map <leader>/  <Plug>(incsearch-easymotion-/)
  map <leader>?  <Plug>(incsearch-easymotion-?)
  map <leader>g/ <Plug>(incsearch-easymotion-stay)
  " incsearch.vim x fuzzy x vim-easymotion
  if s:plug.is_installed('incsearch-fuzzy.vim')
    function! s:config_easyfuzzymotion(...) abort
      return extend(copy({
      \   'converters': [incsearch#config#fuzzy#converter()],
      \   'modules': [incsearch#config#easymotion#module()],
      \   'keymap': {"\<CR>": '<Over>(easymotion)'},
      \   'is_expr': 0,
      \   'is_stay': 1
      \ }), get(a:, 1, {}))
    endfunction
    noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())
  endif
endif

if s:plug.is_installed('vim-anzu')
  " mapping
  " nmap n <Plug>(anzu-n-with-echo)
  " nmap N <Plug>(anzu-N-with-echo)
  " nmap * <Plug>(anzu-star-with-echo)
  " nmap # <Plug>(anzu-sharp-with-echo)
  " clear status
  nmap <Esc><Esc> <Plug>(anzu-clear-search-status)
  " statusline
  set statusline=%{anzu#search_status()})
endif

if s:plug.is_installed('vim-asterisk')
  " map *   <Plug>(asterisk-*)
  " map #   <Plug>(asterisk-#)
  " map g*  <Plug>(asterisk-g*)
  " map g#  <Plug>(asterisk-g#)
  " map z*  <Plug>(asterisk-z*)
  " map gz* <Plug>(asterisk-gz*)
  " map z#  <Plug>(asterisk-z#)
  " map gz# <Plug>(asterisk-gz#)
  let g:asterisk#keeppos = 1
endif

if s:plug.is_installed('vim-jplus')
  " Jの挙動を jplus.vim で行う
  " nmap J <Plug>(jplus)
  " vmap J <Plug>(jplus)
  " getchar() を使用して挿入文字を入力します
  nmap <Leader>J <Plug>(jplus-getchar)
  vmap <Leader>J <Plug>(jplus-getchar)
  " input() を使用したい場合はこちらを使用して下さい
  " nmap <Leader>J <Plug>(jplus-input)
  " vmap <Leader>J <Plug>(jplus-input)
  " <Plug>(jplus-getchar) 時に左右に空白文字を入れたい場合
  " %d は入力した結合文字に置き換えられる
  let g:jplus#config = {
  \   "_" : {
  \       "delimiter_format" : ' %d '
  \   }
  \}
endif

if s:plug.is_installed('vim-quickhl')
  nmap <Space>m <Plug>(quickhl-manual-this)
  xmap <Space>m <Plug>(quickhl-manual-this)
  nmap <Space>M <Plug>(quickhl-manual-reset)
  xmap <Space>M <Plug>(quickhl-manual-reset)
  " nmap <Space>j <Plug>(quickhl-cword-toggle)
  nmap <Space>] <Plug>(quickhl-tag-toggle)
  " map H <Plug>(operator-quickhl-manual-this-motion)
endif

" if s:plug.is_installed('vim-textobj-between')
"   omap iA <Plug>(textobj-function-i)
"   omap aA <Plug>(textobj-function-a)
"   vmap iA <Plug>(textobj-function-i)
"   vmap aA <Plug>(textobj-function-a)
" endif

if s:plug.is_installed('CamelCaseMotion')
  " call camelcasemotion#CreateMotionMappings('<leader>')
  map <silent> ,w <Plug>CamelCaseMotion_w
  map <silent> ,b <Plug>CamelCaseMotion_b
  map <silent> ,e <Plug>CamelCaseMotion_e
  map <silent> ,ge <Plug>CamelCaseMotion_ge
  sunmap ,w
  sunmap ,b
  sunmap ,e
  sunmap ,ge
  " omap <silent> iw <Plug>CamelCaseMotion_iw
  " xmap <silent> iw <Plug>CamelCaseMotion_iw
  " omap <silent> ib <Plug>CamelCaseMotion_ib
  " xmap <silent> ib <Plug>CamelCaseMotion_ib
  " omap <silent> ie <Plug>CamelCaseMotion_ie
  " xmap <silent> ie <Plug>CamelCaseMotion_ie
endif

if s:plug.is_installed('vim-operator-replace')
  map <Leader>r <Plug>(operator-replace)
endif

if s:plug.is_installed('operator-camelize.vim')
  map <Leader>c <Plug>(operator-camelize)
  map <Leader>C <Plug>(operator-decamelize)
endif

if s:plug.is_installed('vim-multiple-cursors')
  let g:multi_cursor_next_key='<C-n>'
  let g:multi_cursor_prev_key='<C-p>'
  let g:multi_cursor_skip_key='<C-x>'
  " let g:multi_cursor_start_key='<C-n>'
  let g:multi_cursor_start_word_key='g<C-n>'
  let g:multi_cursor_quit_key='<C-c>'
  " nnoremap <C-c> :call_multiple_cursor#quit()<CR>
endif

if s:plug.is_installed('vim-operator-flashy')
  map y <Plug>(operator-flashy)
  nmap Y <Plug>(operator-flashy)$
endif

if s:plug.is_installed('vim-niceblock')
  xmap I <Plug>(niceblock-I)
  xmap A <Plug>(niceblock-A)
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
