if has('nvim')
  echo 'you use nvim'
  command! -nargs=1 -bar Source call luaeval('require("mine.source").exec(_A)', expand(<args>))
else
  command! -nargs=1 -bar Source call mine#source#Call(<args>)
endif

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
