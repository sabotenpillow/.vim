-- Basic settings: options, keymaps, autocmds
require('basic')

-- Plugin declarations and plugin-specific settings
if vim.g.vscode == nil then
  require('plugins')
end

-- VSCode Neovim extension settings
if vim.g.vscode ~= nil then
  require('vscode')
end
