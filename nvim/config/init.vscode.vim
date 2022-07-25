if has('nvim')
  command! -nargs=1 -bar Source call luaeval('require("mine.rc").source(_A)', expand(<args>))
else
  command! -nargs=1 -bar Source call mine#rc#Source(<args>)
endif

Source 'common'

" VSCode extension
if exists('g:vscode')
  Source 'vscode'
endif

" ordinary vim or neovim
if has('nvim')
  Source 'neovim'
else
  Source 'vim'
endif
