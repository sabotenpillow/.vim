vim9script

export def Source(path: string): void
  const filepath: string = expand('~/.vim/vimrc.d/') .. path .. '.vim'
  if filereadable(filepath)
    execute('source ' .. filepath)
  endif
enddef
