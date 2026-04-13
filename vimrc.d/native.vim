let s:state_dir = expand('~/.vim/state')
if !isdirectory(s:state_dir)
  call mkdir(s:state_dir, 'p')
endif
execute 'set viminfo=' . "'50,\\\"1877,:0,h,n" . fnameescape(s:state_dir . '/.viminfo')
" <F11>でpaste, nopaste を切り替え
set pastetoggle=<F11>
