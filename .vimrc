"***** $B4D6-@_Dj7O(B*********************************************
" encord
set encoding=utf-8
" file encord
set fileencodings=utf-8
set fileformats=unix,dos,mac
" swapファイルを作成しない
set noswapfile
" line number display
set number
" $BHV9f(B+j(k)$B$GAjBPI=<((B+$B%8%c%s%W(B
" set relativenumber
" $BIT2D;kJ8;z$rI=<((B
set list
set listchars=eol:$,tab:>-,trail:_,extends:<
" $B1&2<$KI=<($5$l$k9T!&Ns$NHV9f$rI=<((B
set ruler
" $BBP1~3g8L$K(B<>$B$N%Z%"$rDI2C(B
set matchpairs& matchpairs+=<:>
" $BBP1~3g8L$r%O%$%i%$%HI=<((B
set showmatch
" $BBP1~3g8L$NI=<(IC?t$r(B3$BIC(B
set matchtime=3
" $BJ]4I$K$*$$$FBgJ8;z>.J8;z$N6hJL$r$7$J$$(B
set infercase
" not distinguish upper and lower
set ignorecase
" $BBgJ8;z$r4^$a$?8!:w$O$=$NDL$j$K8!:w(B
set smartcase
" $B%$%s%/%j%a%s%?%k%5!<%A$r9T$&(B
set incsearch
" $B8!:w7k2L$r%O%$%i%$%HI=<((B
set hlsearch
" $B%?%$%WCf$N%3%^%s%I$rI=<((B
set showcmd
" $B%*!<%H%$%s%G%s%H(B,$B2~9T(B,insert mode $B3+;OD>8e$K(Bback space $B$G:o=|2DG=(B
set backspace=indent,eol,start
" $B%*!<%H%$%s%G%s%H(B
set autoindent
set smartindent
" $B8=:_9T$N6/D4I=<((B
set cursorline
" syntax highlight
syntax on

"***** normal & command **********************************************
" $B9TF,(B&$B9TKv0\F0(B
"noremap <silent> <C-,> ^
"noremap <silent> <C-.> $
"noremap <silent> < {
"noremap <silent> > }

"***** normal mode ***************************************************
nnoremap ; ^

"***** insert mode ***************************************************
" insert $B%b!<%I$+$iH4$1$k(B
inoremap <silent> jj <ESC>
inoremap <silent> <C-j> j
inoremap <silent> kk <ESC>
inoremap <silent> <C-k> k

" move
inoremap <silent> <C-l> <right>

" backspase & delete
inoremap <silent> <C-h> <C-g>u<C-h>
inoremap <silent> <C-d> <DEL>

" $B0zMQId!$3g8L$N@_Dj(B
inoremap { {}<left>
inoremap [ []<left>
inoremap ( ()<left>
inoremap " ""<left>
inoremap ' ''<left>
inoremap <> <><left>
