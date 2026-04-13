let s:state_dir = expand('~/.vim/state')
if !isdirectory(s:state_dir)
  call mkdir(s:state_dir, 'p')
endif
execute 'set viminfo+=' . fnameescape(s:state_dir . '/viminfo.nvim')
let &viminfo .= '.nvim'
set undodir=~/.vim/undo.nvim
