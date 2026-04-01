-- plugins.lua: vim-plug declarations and plugin-specific settings
-- Converted from vimrc.d/common.vim (plugin sections)

-- Conditional plugin helper: disable plugin when cond is false
-- Note: only used when opts are non-empty; prefer direct `if` for simple cases
local function Cond(cond, opts)
  opts = opts or vim.empty_dict()
  if cond then
    return opts
  else
    return vim.tbl_extend('force', opts, { on = {}, ['for'] = {} })
  end
end

local is_vscode = vim.g.vscode ~= nil

-- ------------------------------------------------------------
-- vim-plug declarations
-- ------------------------------------------------------------
vim.cmd('filetype off')
vim.cmd('filetype plugin indent off')

local Plug = vim.fn['plug#']
vim.call('plug#begin', vim.fn.expand('~/.vim/plugged'))

-- Colorschemes
Plug 'MaxMEllon/molokai'
Plug 'cocopon/iceberg.vim'
Plug 'stulzer/heroku-colorscheme'
Plug 'nobarudo/tender.vim'
Plug 'itchyny/landscape.vim'
Plug 'cocopon/lightline-hybrid.vim'

-- View / UI
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-startify'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug('Shougo/vimproc.vim', { ['do'] = 'make' })
Plug 'Shougo/vimshell.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'Shougo/unite.vim'
Plug 'rhysd/accelerated-jk'
Plug 'tpope/vim-surround'
Plug 'cohama/lexima.vim'
Plug 'osyo-manga/vim-over'
Plug('junegunn/fzf', { dir = vim.fn.expand('~/.fzf'), ['do'] = './install --all' })
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'LeafCage/yankround.vim'
Plug 'kana/vim-smartchr'

-- Completion (ddc.vim + denops.vim)
Plug 'vim-denops/denops.vim'
Plug 'Shougo/ddc.vim'
Plug 'Shougo/pum.vim'
Plug 'Shougo/ddc-ui-pum'
Plug 'Shougo/ddc-source-around'
Plug 'Shougo/ddc-source-nvim-lsp'
Plug 'Shougo/ddc-filter-matcher_head'
Plug 'Shougo/ddc-filter-sorter_rank'
Plug 'Shougo/ddc-filter-converter_remove_overlap'

-- Snippets
Plug 'honza/vim-snippets'

-- Language support
Plug('osyo-manga/vim-monster',   { ['for'] = 'ruby' })
Plug 'moll/vim-node'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'

-- Text objects
Plug 'coderifous/textobj-word-column.vim'
if not is_vscode then
  Plug 'easymotion/vim-easymotion'
end
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/vim-asterisk'
Plug 'osyo-manga/vim-anzu'
Plug 'tmhedberg/matchit'
Plug 'osyo-manga/vim-jplus'
Plug 't9md/vim-quickhl'
Plug 'wellle/targets.vim'
Plug 'bkad/CamelCaseMotion'
Plug 'rking/ag.vim'
Plug 'kana/vim-niceblock'
Plug 'kshenoy/vim-signature'
Plug 'kana/vim-altr'
Plug 'kana/vim-textobj-user'
Plug 'osyo-manga/vim-textobj-multiblock'
Plug 'kana/vim-textobj-function'
Plug('rhysd/vim-textobj-ruby',     { ['for'] = 'ruby' })
Plug 'machakann/vim-textobj-delimited'
Plug 'glts/vim-textobj-indblock'
Plug 'thinca/vim-textobj-between'
Plug 'Julian/vim-textobj-variable-segment'
Plug 'vimtaku/vim-textobj-sigil'

-- Operators
Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace'
Plug 'tyru/operator-camelize.vim'
Plug 'haya14busa/vim-operator-flashy'

-- Syntax highlight
Plug('slim-template/vim-slim',           { ['for'] = 'slim'           })
Plug('kchmck/vim-coffee-script',         { ['for'] = 'coffee'         })
Plug('maxmellon/vim-jsx-pretty',         { ['for'] = 'javascript.jsx' })
Plug('elzr/vim-json',                    { ['for'] = { 'json', 'ika' } })
Plug('tmux-plugins/vim-tmux',            { ['for'] = { 'tmux', 'conf' } })
Plug('octol/vim-cpp-enhanced-highlight', { ['for'] = { 'c', 'cpp' }   })
Plug('derekwyatt/vim-scala',             { ['for'] = 'scala'          })
Plug('elixir-editors/vim-elixir',        { ['for'] = 'elixir'         })

-- Ruby
if vim.fn.has('ruby') == 1 then
  Plug('todesking/ruby_hl_lvar.vim', { ['for'] = 'ruby' })
end
Plug 'tpope/vim-rails'

-- HTML
Plug 'mattn/emmet-vim'

-- LSP
Plug 'neovim/nvim-lspconfig'
Plug 'mfussenegger/nvim-lint'

vim.call('plug#end')

-- Colorscheme (must come after plug#end so plugins are on runtimepath)
vim.cmd([[
  try
    colorscheme iceberg
  catch
    colorscheme pablo
  endtry
  syntax on
  filetype plugin indent on
]])

-- ------------------------------------------------------------
-- Plugin configuration helpers
-- ------------------------------------------------------------
local function is_installed(name)
  local plugs = vim.g.plugs
  if not plugs then return false end
  local plug = plugs[name]
  if not plug then return false end
  return vim.fn.isdirectory(plug.dir) == 1
end

local map = vim.keymap.set

-- nvim-tree
if is_installed('nvim-tree.lua') then
  require('nvim-tree').setup()
  map('n', ',t',    '<Cmd>NvimTreeToggle<CR>')
  map('n', ',T',    '<Cmd>NvimTreeFindFile<CR>')
  map('n', '<M-v>e', '<Cmd>NvimTreeFocus<CR>', { silent = true })
end

-- vim-startify
if is_installed('vim-startify') then
  vim.g.startify_custom_header  = vim.fn.map(vim.fn.split(vim.fn.system('date'), '\n'), '"   " . v:val') -- luacheck: ignore
  vim.g.startify_custom_indices = { 'f','d','n','m','v','g','u','r','i','s','l','a','c','x','w','o','h','y','t','b','z','p' }
  vim.g.startify_bookmarks = {
    '~/.vim/vimrc',
    '~/.zshrc',
    '~/.zshenv',
    '~/.zsh_history',
    '~/.dotfiles/zsh/alias.zsh',
    '~/.dotfiles/zsh/keybind.zsh',
    '~/.dotfiles/zsh/env_vars.zsh',
    '~/.dotfiles/zsh',
    '~/.dotfiles/tmux/.tmux.conf',
    '~/.dotfiles/tig',
  }
end

-- fzf.vim
map('n', '<M-p>', '<Cmd>Files<CR>')

-- indentLine
if is_installed('indentLine') then
  vim.g.indentLine_faster    = 1
  vim.g.indentLine_color_term = 207
  vim.g.indentLine_color_gui  = '#708090'
  vim.g.indentLine_char       = '¦'
  map('n', '<Leader>i', '<Cmd>IndentLinesToggle<CR>', { silent = true })
end

-- lightline.vim
if is_installed('lightline.vim') then
  vim.g.lightline = {
    colorscheme = 'hybrid',
    active = {
      left = {
        { 'mode', 'paste' },
        { 'readonly', 'filename', 'modified' },
      },
    },
    separator    = { left = "\xEE\x83\x86", right = '' },
    subseparator = { left = '|',      right = '|' },
  }
  vim.opt.laststatus = 2
end

-- vim-easy-align
if is_installed('vim-easy-align') then
  map('v', '<Enter>', ':EasyAlign<CR>')
  map('x', ',ga', '<Plug>(EasyAlign)')
  map('n', ',ga', '<Plug>(EasyAlign)')
end

-- yankround.vim
if is_installed('yankround.vim') then
  map('n', 'p',    '<Plug>(yankround-p)')
  map('x', 'p',    '<Plug>(yankround-p)')
  map('n', 'P',    '<Plug>(yankround-P)')
  map('n', 'gp',   '<Plug>(yankround-gp)')
  map('x', 'gp',   '<Plug>(yankround-gp)')
  map('n', 'gP',   '<Plug>(yankround-gP)')
  map('n', '<C-p>', '<Plug>(yankround-prev)')
  map('n', '<C-n>', '<Plug>(yankround-next)')
end

-- ddc.vim
if is_installed('ddc.vim') then
  local patch_global = vim.fn['ddc#custom#patch_global']

  patch_global('ui', 'pum')
  patch_global('sources', { 'nvim-lsp', 'around' })
  patch_global('sourceOptions', {
    _ = {
      matchers   = { 'matcher_head' },
      sorters    = { 'sorter_rank' },
      converters = { 'converter_remove_overlap' },
    },
    ['nvim-lsp'] = {
      mark = 'L',
      forceCompletionPattern = '\\.\\w*|:\\w*|->\\w*',
    },
    around = { mark = 'A' },
  })

  vim.fn['ddc#enable']()

  -- pum.vim mappings
  map('i', '<Tab>',   '<Cmd>call pum#map#insert_relative(+1)<CR>')
  map('i', '<S-Tab>', '<Cmd>call pum#map#insert_relative(-1)<CR>')
  map('i', '<C-y>',   '<Cmd>call pum#map#confirm()<CR>')
  map('i', '<C-e>',   '<Cmd>call pum#map#cancel()<CR>')
end

-- vim-monster (Ruby completion)
if is_installed('vim-monster') then
  vim.g['monster#completion#rcodetools#backend'] = 'async_rct_complete'
end

-- todesking/ruby_hl_lvar.vim
if is_installed('todesking/ruby-hl-lvar.vim') then
  vim.g.ruby_hl_lvar_hl_group    = 'RubyLocalVariable'
  vim.g.ruby_hl_lvar_auto_enable = 0
  map('n', '<leader>he', '<Plug>(ruby_hl_lvar-enable)')
  map('n', '<leader>hd', '<Plug>(ruby_hl_lvar-disable)')
  map('n', '<leader>hr', '<Plug>(ruby_hl_lvar-refresh)')
end

-- moll/vim-node
if is_installed('moll/vim-node') then
  vim.api.nvim_create_autocmd('User', {
    pattern  = 'Node',
    callback = function()
      if vim.bo.filetype == 'javascript' then
        map('n', '<C-w>f',    '<Plug>NodeVSplitGotoFile', { buffer = true })
        map('n', '<C-w><C-f>', '<Plug>NodeVSplitGotoFile', { buffer = true })
      end
    end,
  })
end

-- vim-easymotion
if is_installed('vim-easymotion') then
  map('', '<Leader>', '<Plug>(easymotion-prefix)')
  vim.g.EasyMotion_do_mapping  = 0
  vim.g.EasyMotion_keys        = 'jkfdnmvgurieslacxwohytbzqp;,.'
  vim.g.EasyMotion_leader_key  = ';'
  vim.g.EasyMotion_startofline = 0
  vim.g.EasyMotion_smartcase   = 1
  vim.cmd([[
    hi EasyMotionTarget ctermbg=none ctermfg=red
    hi EasyMotionShade  ctermbg=none ctermfg=blue
  ]])
  map('',  '<Leader>h',       '<Plug>(easymotion-linebackward)')
  map('',  '<Leader>j',       '<Plug>(easymotion-j)')
  map('',  '<Leader>k',       '<Plug>(easymotion-k)')
  map('',  '<Leader>l',       '<Plug>(easymotion-lineforward)')
  map('n', '<Leader><Leader>l', '<Plug>(easymotion-lineanywhere)')
  map('',  '<Leader>L',       '<Plug>(easymotion-bd-jk)')
  map('n', '<Leader><Leader>L', '<Plug>(easymotion-overwin-line)')
  map('',  '<Leader>f',       '<Plug>(easymotion-bd-f2)')
  map('',  '<Leader>F',       '<Plug>(easymotion-F2)')
  map('n', '<Leader><Leader>f', '<Plug>(easymotion-overwin-f2)')
  map('',  '<Leader>t',       '<Plug>(easymotion-bd-t2)')
  map('',  '<Leader>T',       '<Plug>(easymotion-T2)')
  map('n', '<Leader>s',       '<Plug>(easymotion-s2)')
  map('',  '<Leader>w',       '<Plug>(easymotion-w)')
  map('',  '<Leader>W',       '<Plug>(easymotion-W)')
  map('n', '<Leader><Leader>w', '<Plug>(easymotion-overwin-w)')
  map('',  '<Leader>b',       '<Plug>(easymotion-b)')
  map('',  '<Leader>B',       '<Plug>(easymotion-B)')
  map('',  '<Leader>e',       '<Plug>(easymotion-e)')
  map('',  '<Leader>E',       '<Plug>(easymotion-E)')
  map('',  '<Leader>ge',      '<Plug>(easymotion-ge)')
  map('',  '<Leader>gE',      '<Plug>(easymotion-gE)')
  map('n', '<Leader>n',       '<Plug>(easymotion-vim-n)')
  map('n', '<Leader>N',       '<Plug>(easymotion-vim-N)')
  map('n', '<Leader>;',       '<Plug>(easymotion-next)')
  map('n', '<Leader>,',       '<Plug>(easymotion-prev)')
end

-- incsearch.vim
if is_installed('incsearch.vim') then
  map('', '/',  '<Plug>(incsearch-forward)')
  map('', '?',  '<Plug>(incsearch-backward)')
  map('', 'g/', '<Plug>(incsearch-stay)')
  vim.opt.hlsearch = true
  vim.g['incsearch#auto_nohlsearch'] = 1
  if is_installed('vim-anzu') then
    map('n', 'n', '<Plug>(incsearch-nohl)<Plug>(anzu-n-with-echo)')
    map('n', 'N', '<Plug>(incsearch-nohl)<Plug>(anzu-N-with-echo)')
  else
    map('', 'n', '<Plug>(incsearch-nohl-n)')
    map('', 'N', '<Plug>(incsearch-nohl-N)')
  end
  if is_installed('vim-asterisk') then
    map('', '<space>*', '<Plug>(incsearch-nohl)<Plug>(asterisk-*)')
    map('', '#',        '<Plug>(incsearch-nohl)<Plug>(asterisk-#)')
    map('', 'g*',       '<Plug>(incsearch-nohl)<Plug>(asterisk-g*)')
    map('', 'g#',       '<Plug>(incsearch-nohl)<Plug>(asterisk-g#)')
    map('', 'z*',       '<Plug>(incsearch-nohl0)<Plug>(asterisk-z*)')
    map('', 'gz*',      '<Plug>(incsearch-nohl0)<Plug>(asterisk-gz*)')
    map('', 'z#',       '<Plug>(incsearch-nohl0)<Plug>(asterisk-z#)')
    map('', 'gz#',      '<Plug>(incsearch-nohl0)<Plug>(asterisk-gz#)')
    vim.g['asterisk#keeppos'] = 1
  else
    map('', '<space>*', '<Plug>(incsearch-nohl-*)')
    map('', '#',        '<Plug>(incsearch-nohl-#)')
    map('', 'g*',       '<Plug>(incsearch-nohl-g*)')
    map('', 'g#',       '<Plug>(incsearch-nohl-g#)')
  end
end

-- incsearch-fuzzy.vim
if is_installed('incsearch-fuzzy.vim') then
  map('', 'z/',  '<Plug>(incsearch-fuzzy-/)')
  map('', 'z?',  '<Plug>(incsearch-fuzzy-?)')
  map('', 'zg/', '<Plug>(incsearch-fuzzy-stay)')
  vim.cmd([[
    function! s:config_fuzzyall(...) abort
      return extend(copy({
      \   'converters': [
      \     incsearch#config#fuzzy#converter(),
      \     incsearch#config#fuzzyspell#converter()
      \   ],
      \ }), get(a:, 1, {}))
    endfunction
    noremap <silent><expr> z/  incsearch#go(<SID>config_fuzzyall())
    noremap <silent><expr> z?  incsearch#go(<SID>config_fuzzyall({'command': '?'}))
    noremap <silent><expr> zg? incsearch#go(<SID>config_fuzzyall({'is_stay': 1}))
  ]])
end

-- incsearch-easymotion.vim
if is_installed('incsearch-easymotion.vim') then
  map('', '<leader>/',  '<Plug>(incsearch-easymotion-/)')
  map('', '<leader>?',  '<Plug>(incsearch-easymotion-?)')
  map('', '<leader>g/', '<Plug>(incsearch-easymotion-stay)')
  if is_installed('incsearch-fuzzy.vim') then
    vim.cmd([[
      function! s:config_easyfuzzymotion(...) abort
        return extend(copy({
        \   'converters': [incsearch#config#fuzzy#converter()],
        \   'modules': [incsearch#config#easymotion#module()],
        \   'keymap': {"\<CR>": '<Over>(easymotion)'},
        \   'is_expr': 0,
        \   'is_stay': 1
        \ }), get(a:, 1, {}))
      endfunction
      noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())
    ]])
  end
end

-- vim-anzu
if is_installed('vim-anzu') then
  map('n', '<Esc><Esc>', '<Plug>(anzu-clear-search-status)')
  vim.opt.statusline = '%{anzu#search_status()}'
end

-- vim-asterisk
if is_installed('vim-asterisk') then
  vim.g['asterisk#keeppos'] = 1
end

-- vim-jplus
if is_installed('vim-jplus') then
  map('n', '<Leader>J', '<Plug>(jplus-getchar)')
  map('v', '<Leader>J', '<Plug>(jplus-getchar)')
  vim.g.jplus_config = {
    _ = { delimiter_format = ' %d ' },
  }
end

-- vim-quickhl
if is_installed('vim-quickhl') then
  map('n', '<Space>m', '<Plug>(quickhl-manual-this)')
  map('x', '<Space>m', '<Plug>(quickhl-manual-this)')
  map('n', '<Space>M', '<Plug>(quickhl-manual-reset)')
  map('x', '<Space>M', '<Plug>(quickhl-manual-reset)')
  map('n', '<Space>]', '<Plug>(quickhl-tag-toggle)')
end

-- CamelCaseMotion
if is_installed('CamelCaseMotion') then
  map('', ',w',  '<Plug>CamelCaseMotion_w',  { silent = true })
  map('', ',b',  '<Plug>CamelCaseMotion_b',  { silent = true })
  map('', ',e',  '<Plug>CamelCaseMotion_e',  { silent = true })
  map('', ',ge', '<Plug>CamelCaseMotion_ge', { silent = true })
  vim.cmd([[
    sunmap ,w
    sunmap ,b
    sunmap ,e
    sunmap ,ge
  ]])
end

-- vim-operator-replace
if is_installed('vim-operator-replace') then
  map('', 'r', '<Plug>(operator-replace)')
end

-- operator-camelize.vim
if is_installed('operator-camelize.vim') then
  map('', '<Leader>c', '<Plug>(operator-camelize)')
  map('', '<Leader>C', '<Plug>(operator-decamelize)')
end

-- vim-operator-flashy
if is_installed('vim-operator-flashy') then
  map('', 'y', '<Plug>(operator-flashy)')
  map('n', 'Y', '<Plug>(operator-flashy)$')
end

-- vim-niceblock
if is_installed('vim-niceblock') then
  map('x', 'I', '<Plug>(niceblock-I)')
  map('x', 'A', '<Plug>(niceblock-A)')
end

-- vim-smartchr
if is_installed('vim-smartchr') then
  map('i', ',', "smartchr#loop(', ', ',')",  { expr = true, buffer = true })
  map('i', '>', "smartchr#loop('>', '>>', '=>', '->')", { expr = true, buffer = true })
  map('i', '=', "smartchr#loop('=', ' == ', '===')",   { expr = true, buffer = true })
end

-- accelerated-jk
if is_installed('accelerated-jk') then
  map('n', 'j', '<Plug>(accelerated_jk_j)')
  map('n', 'k', '<Plug>(accelerated_jk_k)')
end

-- nvim-lspconfig (ruff for Python)
if is_installed('nvim-lspconfig') then
  local lspconfig = require('lspconfig')

  local on_attach = function(_, bufnr)
    local opts = { silent = true, buffer = bufnr }
    map('n', 'gd',         vim.lsp.buf.definition,      opts)
    map('n', 'K',          vim.lsp.buf.hover,            opts)
    map('n', 'gi',         vim.lsp.buf.implementation,   opts)
    map('n', 'gr',         vim.lsp.buf.references,       opts)
    map('n', '<Leader>rn', vim.lsp.buf.rename,           opts)
    map('n', '<Leader>ca', vim.lsp.buf.code_action,      opts)
    map('n', ']d',         vim.diagnostic.goto_next,     opts)
    map('n', '[d',         vim.diagnostic.goto_prev,     opts)
    map('n', '<Leader>d',  vim.diagnostic.open_float,    opts)
  end

  lspconfig.ruff.setup({ on_attach = on_attach })
  lspconfig.ts_ls.setup({ on_attach = on_attach })
end

-- nvim-lint (mypy for Python)
if is_installed('nvim-lint') then
  require('lint').linters_by_ft = {
    python = { 'mypy' },
  }
  vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
    group    = vim.api.nvim_create_augroup('nvim-lint', { clear = true }),
    callback = function() require('lint').try_lint() end,
  })
end
