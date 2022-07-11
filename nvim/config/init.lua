local rc = require('mine.rc')

rc.source('common')
rc.source('neovim')
if vim.fn.exists('g:vscode') == 1 then
  rc.source('vscode')
end
