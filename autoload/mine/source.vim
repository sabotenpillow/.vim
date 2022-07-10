function mine#source#Call(path)
  let l:filepath = expand('~/.vim/vimrc.d/') .. a:path .. '.vim'
  if filereadable(l:filepath)
    execute('source ' .. l:filepath)
  endif
endfunction
