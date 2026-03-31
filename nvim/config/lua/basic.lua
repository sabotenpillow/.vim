-- basic.lua: NeoVim basic settings (options, keymaps, autocmds)
-- Converted from vimrc.d/common.vim and vimrc.d/neovim.vim

-- Shell
vim.opt.shell = '/bin/bash'

-- Encoding
vim.opt.encoding    = 'utf-8'
vim.opt.fileencodings = 'utf-8'
vim.opt.fileformats = { 'unix', 'dos', 'mac' }

-- File management
vim.opt.swapfile = false
vim.opt.backup   = false

-- Line numbers
vim.opt.number         = true
vim.opt.relativenumber = true

-- Invisible characters
vim.opt.list      = true
vim.opt.listchars = { eol = '¬', tab = '  ', trail = '_', extends = '<' }

-- Misc display
vim.opt.ruler      = true
vim.opt.showmatch  = true
vim.opt.matchtime  = 3
vim.opt.matchpairs:append('<:>')
vim.opt.visualbell = true
vim.opt.scrolloff  = 5
vim.opt.cursorline = true
vim.opt.background = 'dark'
vim.opt.showcmd    = true
vim.opt.cmdheight  = 1

-- Editing
vim.opt.confirm   = true
vim.opt.infercase = true
vim.opt.backspace = { 'indent', 'eol', 'start' }
vim.opt.whichwrap = 'b,s,h,l,<,>,[,]'

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase  = true
vim.opt.incsearch  = true
vim.opt.hlsearch   = true

-- Indent defaults (Go overrides via FileType autocmd below)
vim.opt.expandtab   = true
vim.opt.tabstop     = 2
vim.opt.shiftwidth  = 2
vim.opt.softtabstop = 2
vim.opt.autoindent  = true
vim.opt.smartindent = true

-- Persistent undo (NeoVim-specific paths, from neovim.vim)
vim.opt.undofile = true
vim.opt.undodir  = vim.fn.expand('~/.vim/undo.nvim')

-- ShaDa (NeoVim replacement for viminfo, from neovim.vim)
vim.opt.shadafile = vim.fn.expand('~/.vim/viminfo.nvim')

-- Terminal true colors
if vim.fn.has('termguicolors') == 1 then
  vim.opt.termguicolors = true
end

-- Security: disable dangerous commands in per-directory .vimrc
vim.opt.secure = true

-- Leader key
vim.g.mapleader = ' '

-- ------------------------------------------------------------
-- Filetype detection
-- ------------------------------------------------------------
local filetypes = {
  { '.md',       'markdown'       },
  { '.slim',     'slim'           },
  { '.less',     'less'           },
  { '.coffee',   'coffee'         },
  { '.scss',     'scss'           },
  { '.sass',     'sass'           },
  { '.cjsx',     'coffee'         },
  { '.exs',      'elixir'         },
  { '.ex',       'elixir'         },
  { '.toml',     'toml'           },
  { '_spec.rb',  'rspec'          },
  { '.jsx',      'javascript.jsx' },
  { '.es6',      'javascript'     },
  { '.react.js', 'javascript.jsx' },
  { '.fish',     'fish'           },
  { '.babelrc',  'json'           },
  { '.ika',      'ika'            },
  { '.eslintrc', 'yaml'           },
  { '.tex',      'tex'            },
  { '.scala',    'scala'          },
}

for _, ft in ipairs(filetypes) do
  vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
    pattern  = '*' .. ft[1],
    callback = function() vim.bo.filetype = ft[2] end,
  })
end

-- Go: use hard tabs
vim.api.nvim_create_autocmd('FileType', {
  pattern  = 'go',
  callback = function()
    vim.opt_local.expandtab   = false
    vim.opt_local.tabstop     = 4
    vim.opt_local.shiftwidth  = 4
    vim.opt_local.softtabstop = 0
  end,
})

-- ------------------------------------------------------------
-- Autocmds
-- ------------------------------------------------------------

-- Restore cursor to last position when reopening a file
vim.api.nvim_create_augroup('vimrcEx', { clear = true })
vim.api.nvim_create_autocmd('BufRead', {
  group    = 'vimrcEx',
  callback = function()
    local last = vim.fn.line("'\"")
    if last > 0 and last <= vim.fn.line('$') then
      vim.cmd('normal! g`"')
    end
  end,
})

-- Binary file editing with xxd
vim.api.nvim_create_augroup('BinaryXXD', { clear = true })
vim.api.nvim_create_autocmd('BufReadPre', {
  group   = 'BinaryXXD',
  pattern = '*.bin',
  callback = function() vim.opt_local.binary = true end,
})
vim.api.nvim_create_autocmd('BufReadPost', {
  group    = 'BinaryXXD',
  callback = function()
    if vim.bo.binary then
      vim.cmd('silent %!xxd -g 1')
      vim.bo.filetype = 'xxd'
    end
  end,
})
vim.api.nvim_create_autocmd('BufWritePre', {
  group    = 'BinaryXXD',
  callback = function()
    if vim.bo.binary then vim.cmd('%!xxd -r') end
  end,
})
vim.api.nvim_create_autocmd('BufWritePost', {
  group    = 'BinaryXXD',
  callback = function()
    if vim.bo.binary then
      vim.cmd('silent %!xxd -g 1')
      vim.bo.modified = false
    end
  end,
})

-- ------------------------------------------------------------
-- Keymaps
-- ------------------------------------------------------------
local map = vim.keymap.set

-- Leader
vim.g.mapleader = ' '

-- Normal & Visual
map({ 'n', 'v' }, '<Leader>r', 'r')
map({ 'n', 'v' }, ',d', '"_d')
map({ 'n', 'v' }, ',c', '"_c')
map({ 'n', 'v' }, 'x',  '"_x')

-- Normal mode
map('n', 'Y',  'y$')
map('n', '}',  '}zz')
map('n', '{',  '{zz')
map('n', ']]', ']]zz')
map('n', '[[', '[[zz')
map('n', 'X',  '"_X')
map('n', ',x', 'x')
map('n', ',X', 'X')
map('n', 's',  '"_s')
map('n', ',p', '"0p')
map('n', ',P', '"0P')
map('n', 'い', 'i', { silent = true })

-- Swap : and ;
map('n', ';', ':')
map('n', ':', ';')
map('v', ';', ':')
map('v', ':', ';')

-- Visual mode search & replace helper
_G._nvim_set_vsearch = function()
  vim.cmd('silent normal gv"zy')
  local escaped = vim.fn.escape(vim.fn.getreg('z'), '/\\')
  vim.fn.setreg('/', '\\V' .. vim.fn.substitute(escaped, '\n', '\\\\n', 'g'))
end

-- Search under cursor (normal mode)
map('n', '*', '"zyiw:let @/ = \'\\<\' . @z . \'\\>\'<CR>:set hlsearch<CR>', { silent = true })
map('n', '<Space>#', '*:%s/<C-r>///g<Left><Left>')

-- Visual mode search
map('x', '*', function()
  _G._nvim_set_vsearch()
  vim.opt.hlsearch = true
end, { silent = true })
map('x', '#', function()
  _G._nvim_set_vsearch()
  vim.cmd('/' .. vim.fn.getreg('/'))
end)
map('x', '<Space>#', '*:%s/<C-r>///g<Left><Left>')

-- Command mode (Emacs-style)
map('c', '<C-a>', '<Home>')
map('c', '<C-b>', '<Left>')
map('c', '<C-d>', '<Del>')
map('c', '<C-e>', '<End>')
map('c', '<C-f>', '<Right>')
map('c', '<C-n>', '<Down>')
map('c', '<C-p>', '<Up>')
map('c', '<C-k>', "<C-\\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>")
map('c', 'bb',    'ls<CR>:buf')

-- Insert mode
map('i', 'jj',   '<ESC>',        { silent = true })
map('i', '<C-j>', 'j',            { silent = true })
map('i', '<C-a>', '<Home>')
map('i', '<C-b>', '<Left>')
map('i', '<C-e>', '<End>')
map('i', '<C-f>', '<Right>')
map('i', '<M-b>', '<S-Left>')   -- Alt+b: word backward
map('i', '<M-f>', '<S-Right>')  -- Alt+f: word forward
map('i', '<C-h>', '<C-g>u<C-h>', { silent = true })
map('i', '<C-d>', '<DEL>',        { silent = true })
map('i', '<C-k>', '<C-\\><C-o>D', { silent = true })
map('i', '<M-d>', '<C-\\><C-o>dw')  -- Alt+d: delete word forward
map('i', '<C-o>', '<End><CR>',    { silent = true })

-- Visual mode line movement
map('v', '<C-p>', '"zx<Up>"zP`[V`]')
map('v', '<C-n>', '"zx"zp`[V`]')
