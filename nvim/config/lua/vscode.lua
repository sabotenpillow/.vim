-- vscode.lua: VSCode Neovim extension specific settings
-- Converted from vimrc.d/vscode.vim

local map = vim.keymap.set

vim.g.maplocalleader = '\\'

-- Definition
map('n', 'gd', '<Cmd>call VSCodeNotify("editor.action.revealDefinition")<CR>')
map('n', 'gD', '<Cmd>call VSCodeNotify("editor.action.revealDefinitionAside")<CR>')

-- Implementation
map('n', 'gi', '<Cmd>call VSCodeNotify("editor.action.goToImplementation")<CR>')
map('n', 'gI', '<Cmd>call VSCodeNotify("references-view.findImplementations")<CR>')

-- References
map('n', 'gr', '<Cmd>call VSCodeNotify("references-view.findReferences")<CR>')
map('n', 'gR', '<Cmd>call VSCodeNotify("editor.action.referenceSearch.trigger")<CR>')

-- Navigation
map('n', 'gb', '<Cmd>call VSCodeNotify("workbench.action.navigateBack")<CR>')
map('n', 'gf', '<Cmd>call VSCodeNotify("workbench.action.navigateForward")<CR>')

-- Hover
map('n', '<LocalLeader>h', '<Cmd>call VSCodeNotify("editor.action.showHover")<CR>')

-- Copy & Paste
map('n', '<C-S-c>', '<Cmd>call VSCodeNotify("editor.action.clipboardCopyAction")<CR>')
map('i', '<C-S-c>', '<Cmd>call VSCodeNotify("editor.action.clipboardCopyAction")<CR>')
map('v', '<C-S-c>', '<Cmd>call VSCodeNotifyVisual("editor.action.clipboardCopyAction", 0)<CR>')
map('n', '<C-S-v>', '<Cmd>call VSCodeNotify("editor.action.clipboardPasteAction")<CR>')
map('i', '<C-S-v>', '<Cmd>call VSCodeNotify("editor.action.clipboardPasteAction")<CR>')
map('x', '<C-S-v>', '<Cmd>call VSCodeNotify("editor.action.clipboardPasteAction")<CR>')

-- Rename
map('n', '<LocalLeader>rn', '<Cmd>call VSCodeNotify("editor.action.rename")<CR>')

-- Undo
map('n', 'u', '<Cmd>call VSCodeNotify("undo")<CR>')
