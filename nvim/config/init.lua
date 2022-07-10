local source = require('mine.source')

source.exec('common')
source.exec('neovim')
if vim.fn.exists('g:vscode') == 1 then
  source.exec('vscode')
end
