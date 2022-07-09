command! -nargs=+ -bar Source call mine#source#Call(<args>)
Source 'common'

if exists('g:vscode')
  " VSCode extension
  Source 'vscode'
else
  " ordinary vim or neovim
  if has('nvim')
    Source 'neovim'
  else
    Source 'vim'
  endif
endif
