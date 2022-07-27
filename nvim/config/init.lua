local rc = require('mine.rc')

-- source common
rc.source('common')

-- source common between native vim and neovim
if vim.fn.exists('g:vscode') == 0 then
  rc.source('origin')
end

-- source neovim
rc.source('neovim')

-- source vscode extension
if vim.fn.exists('g:vscode') == 1 then
  rc.source('vscode')
end
