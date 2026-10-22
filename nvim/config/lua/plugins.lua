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

local function append_fzf_default_bind(binding)
  local option = '--bind ' .. binding
  local current = vim.env.FZF_DEFAULT_OPTS or ''
  if not string.find(current, option, 1, true) then
    vim.env.FZF_DEFAULT_OPTS = current == '' and option or (current .. ' ' .. option)
  end
end

append_fzf_default_bind('ctrl-w:backward-kill-word')

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
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'
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
Plug 'Shougo/ddc-source-lsp'
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
Plug 'mason-org/mason.nvim'
Plug 'mason-org/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'mfussenegger/nvim-lint'

-- Testing
Plug 'antoinemadec/FixCursorHold.nvim'
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate', ['branch'] = 'master' })
Plug 'nvim-neotest/nvim-nio'
Plug 'nvim-neotest/neotest'
Plug 'nvim-neotest/neotest-python'
Plug 'marilari88/neotest-vitest'

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

local function escaped(path)
  return vim.fn.fnameescape(path)
end

local function with_window_cwd(path, fn)
  local previous_cwd = vim.fn.getcwd()
  vim.cmd('keepalt lcd ' .. escaped(path))
  local ok, err = pcall(fn)
  vim.cmd('keepalt lcd ' .. escaped(previous_cwd))
  if not ok then
    error(err)
  end
end

local function fugitive_repo_root()
  if vim.fn.exists('*FugitiveWorkTree') == 1 then
    local bufname = vim.api.nvim_buf_get_name(0)
    if bufname ~= '' then
      local buf_root = vim.fn.FugitiveWorkTree(vim.fn.fnamemodify(bufname, ':p:h'))
      if buf_root ~= '' then
        return buf_root
      end
    end

    local startup_root = vim.fn.FugitiveWorkTree(startup_cwd)
    if startup_root ~= '' then
      return startup_root
    end

    local cwd_root = vim.fn.FugitiveWorkTree()
    if cwd_root ~= '' then
      return cwd_root
    end
  end

  return startup_cwd
end

if is_installed('vim-fugitive') then
  pcall(vim.cmd, 'delcommand Git')
  vim.api.nvim_create_user_command('Git', function(opts)
    local command = 'G' .. (opts.bang and '!' or '')
    local mods = opts.smods ~= '' and (opts.smods .. ' ') or ''

    if opts.args == '' then
      with_window_cwd(fugitive_repo_root(), function()
        vim.cmd(mods .. command)
      end)
    else
      vim.cmd(mods .. command .. ' ' .. opts.args)
    end
  end, {
    bang = true,
    nargs = '*',
    complete = 'customlist,fugitive#Complete',
  })
end

local function normalized_path(path)
  return vim.fn.fnamemodify(path, ':p'):gsub('/+$', '')
end

local function current_git_root()
  local cwd = vim.fn.getcwd()
  local root = vim.fn.systemlist({ 'git', '-C', cwd, 'rev-parse', '--show-toplevel' })
  if vim.v.shell_error == 0 and root[1] and root[1] ~= '' then
    return normalized_path(root[1])
  end
end

local function current_repo_root()
  local root = current_git_root()
  if root then
    return root
  end
  return normalized_path(vim.fn.getcwd())
end

local function git_lines(root, args)
  local cmd = { 'git', '-C', root }
  vim.list_extend(cmd, args)

  local lines = vim.fn.systemlist(cmd)
  if vim.v.shell_error ~= 0 then
    return nil
  end
  return lines
end

local function open_with_fzf_action(path, action)
  local command = ({
    ['ctrl-x'] = 'split',
    ['ctrl-v'] = 'vsplit',
    ['ctrl-t'] = 'tabedit',
  })[action] or 'edit'

  vim.cmd(command .. ' ' .. escaped(path))
end

local function open_git_file_picker(name, root, paths, prompt, empty_message)
  if #paths == 0 then
    vim.notify(empty_message, vim.log.levels.INFO)
    return
  end

  local spec = vim.fn['fzf#vim#with_preview']({
    dir = root,
    source = paths,
    options = {
      '--prompt', prompt,
      '--scheme', 'path',
      '--tiebreak=index',
      '--expect=ctrl-x,ctrl-v,ctrl-t',
    },
    ['sink*'] = function(lines)
      if not lines or #lines < 2 then
        return
      end

      local action = lines[1]
      local choice = lines[2]
      if choice and choice ~= '' then
        open_with_fzf_action(root .. '/' .. choice, action)
      end
    end,
    window = { width = 0.9, height = 0.6 },
  })

  vim.fn['fzf#run'](vim.fn['fzf#wrap'](name, spec))
end

local function repo_relative_path(root, path)
  local prefix = root .. '/'
  if path == root then
    return '.'
  end
  if path:sub(1, #prefix) == prefix then
    return path:sub(#prefix + 1)
  end
  return path
end

local function open_file_at_position(path, action, lnum, col)
  open_with_fzf_action(path, action)
  vim.api.nvim_win_set_cursor(0, { lnum, math.max(col - 1, 0) })
  vim.cmd('normal! zz')
end

local function lsp_symbol_entry(root, item)
  local location = item.location
  if not location or not location.uri or not location.range then
    return nil
  end

  local path = normalized_path(vim.uri_to_fname(location.uri))
  local relpath = repo_relative_path(root, path)
  local kind = vim.lsp.protocol.SymbolKind[item.kind] or 'Unknown'
  local lnum = location.range.start.line + 1
  local col = location.range.start.character + 1
  local columns = {
    item.name .. ' [' .. kind .. ']',
    relpath,
    tostring(lnum),
    tostring(col),
  }

  if item.containerName and item.containerName ~= '' then
    table.insert(columns, item.containerName)
  end

  return table.concat(columns, '\t')
end

local function lsp_symbol_path(root, path)
  if path:sub(1, 1) == '/' then
    return path
  end
  return root .. '/' .. path
end

local function lsp_symbol_query_at_cursor()
  return vim.fn.expand('<cword>')
end

local function open_lsp_symbol_picker(query)
  local bufnr = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients({ bufnr = bufnr, method = 'workspace/symbol' })
  if #clients == 0 then
    vim.notify('No attached LSP supports workspace/symbol', vim.log.levels.WARN)
    return
  end

  local responses = vim.lsp.buf_request_sync(bufnr, 'workspace/symbol', { query = query }, 5000)
  if not responses then
    vim.notify('LSP symbol search timed out', vim.log.levels.WARN)
    return
  end

  local root = current_repo_root()
  local items = {}
  for _, response in pairs(responses) do
    if response.result then
      for _, item in ipairs(response.result) do
        local entry = lsp_symbol_entry(root, item)
        if entry then
          table.insert(items, entry)
        end
      end
    end
  end

  if #items == 0 then
    vim.notify('No symbols found for ' .. query, vim.log.levels.INFO)
    return
  end

  table.sort(items)

  local spec = vim.fn['fzf#vim#with_preview']({
    dir = root,
    source = items,
    options = {
      '--prompt', 'LspSymbols> ',
      '--delimiter=\t',
      '--preview=sh -c \'file="$1"; line="$2"; start=$((line>3 ? line-3 : 1)); finish=$((line+3)); sed -n "${start},${finish}p" "$file"\' sh {2} {3}',
      '--preview-window=right:70%',
      '--expect=ctrl-x,ctrl-v,ctrl-t',
    },
    ['sink*'] = function(lines)
      if not lines or #lines < 2 then
        return
      end

      local action = lines[1]
      local fields = vim.split(lines[2], '\t', { plain = true })
      local path = fields[2]
      local lnum = tonumber(fields[3]) or 1
      local col = tonumber(fields[4]) or 1
      if not path or path == '' then
        return
      end

      open_file_at_position(lsp_symbol_path(root, path), action, lnum, col)
    end,
    window = { width = 0.9, height = 0.6 },
  })

  vim.fn['fzf#run'](vim.fn['fzf#wrap']('lsp-symbols', spec))
end

local function flatten_document_symbols(root, path, symbols, container, acc)
  for _, item in ipairs(symbols) do
    local range = item.selectionRange or item.range
    if not range and item.location then
      range = item.location.range
    end
    if range then
      local kind = vim.lsp.protocol.SymbolKind[item.kind] or 'Unknown'
      local lnum = range.start.line + 1
      local col = range.start.character + 1
      local columns = {
        item.name .. ' [' .. kind .. ']',
        repo_relative_path(root, path),
        tostring(lnum),
        tostring(col),
      }
      local parent = container or item.containerName
      if parent and parent ~= '' then
        table.insert(columns, parent)
      end
      table.insert(acc, table.concat(columns, '\t'))
    end
    if item.children and #item.children > 0 then
      flatten_document_symbols(root, path, item.children, item.name, acc)
    end
  end
end

local function open_lsp_document_symbol_picker()
  local bufnr = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients({ bufnr = bufnr, method = 'textDocument/documentSymbol' })
  if #clients == 0 then
    vim.notify('No attached LSP supports textDocument/documentSymbol', vim.log.levels.WARN)
    return
  end

  local params = { textDocument = vim.lsp.util.make_text_document_params(bufnr) }
  local responses = vim.lsp.buf_request_sync(bufnr, 'textDocument/documentSymbol', params, 5000)
  if not responses then
    vim.notify('LSP document symbol request timed out', vim.log.levels.WARN)
    return
  end

  local root = current_repo_root()
  local path = normalized_path(vim.api.nvim_buf_get_name(bufnr))
  local items = {}
  for _, response in pairs(responses) do
    if response.result then
      flatten_document_symbols(root, path, response.result, nil, items)
    end
  end

  if #items == 0 then
    vim.notify('No document symbols found', vim.log.levels.INFO)
    return
  end

  -- keep document order; it reads as a file outline

  local spec = vim.fn['fzf#vim#with_preview']({
    dir = root,
    source = items,
    options = {
      '--prompt', 'DocSymbols> ',
      '--delimiter=\t',
      '--preview=sh -c \'file="$1"; line="$2"; start=$((line>3 ? line-3 : 1)); finish=$((line+3)); sed -n "${start},${finish}p" "$file"\' sh {2} {3}',
      '--preview-window=right:70%',
      '--expect=ctrl-x,ctrl-v,ctrl-t',
    },
    ['sink*'] = function(lines)
      if not lines or #lines < 2 then
        return
      end

      local action = lines[1]
      local fields = vim.split(lines[2], '\t', { plain = true })
      local file = fields[2]
      local lnum = tonumber(fields[3]) or 1
      local col = tonumber(fields[4]) or 1
      if not file or file == '' then
        return
      end

      open_file_at_position(lsp_symbol_path(root, file), action, lnum, col)
    end,
    window = { width = 0.9, height = 0.6 },
  })

  vim.fn['fzf#run'](vim.fn['fzf#wrap']('lsp-document-symbols', spec))
end

local function branch_diff_path(line)
  local fields = vim.split(line, '\t', { plain = true })
  if #fields >= 3 then
    return fields[3]
  end
  return fields[2]
end

local function open_branch_diff_picker(base)
  local root = current_git_root()
  if not root then
    vim.notify('Not in a git repository', vim.log.levels.WARN)
    return
  end

  local range = base .. '...HEAD'
  local changed = git_lines(root, {
    'diff',
    '--name-status',
    '--find-renames',
    '--relative',
    range,
  })

  if not changed then
    vim.notify('Failed to diff against ' .. base .. '. Fetch that ref first if needed.', vim.log.levels.WARN)
    return
  end

  if #changed == 0 then
    vim.notify('No files changed vs ' .. base, vim.log.levels.INFO)
    return
  end

  local preview = table.concat({
    'git',
    '-C',
    vim.fn.shellescape(root),
    '--no-pager',
    'diff',
    '--color=always',
    range,
    '--',
    '{2}',
  }, ' ')

  local spec = vim.fn['fzf#vim#with_preview']({
    dir = root,
    source = changed,
    options = {
      '--prompt', base .. '> ',
      '--delimiter=\t',
      '--with-nth=2..',
      '--preview=' .. preview,
      '--preview-window=right:70%',
    },
    sink = function(choice)
      if not choice or choice == '' then
        return
      end

      local path = branch_diff_path(choice)
      if not path or path == '' then
        return
      end

      vim.cmd('Git difftool -y ' .. range .. ' -- ' .. escaped(path))
    end,
    window = { width = 0.9, height = 0.6 },
  })

  vim.fn['fzf#run'](vim.fn['fzf#wrap']('git-branch-diff-files', spec))
end

-- nvim-tree
if is_installed('nvim-tree.lua') then
  require('nvim-tree').setup()
  map('n', ',t',    '<Cmd>NvimTreeToggle<CR>')
  map('n', ',T',    '<Cmd>NvimTreeFindFile<CR>')
end

-- vim-startify
if is_installed('vim-startify') then
  if vim.fn.exists(':StartifyGitStatus') == 0 then
    vim.api.nvim_create_user_command('StartifyGitStatus', function()
      local startify_buf = vim.api.nvim_get_current_buf()

      vim.cmd('Git')

      if vim.api.nvim_buf_is_valid(startify_buf) and vim.bo[startify_buf].filetype == 'startify' then
        vim.api.nvim_buf_delete(startify_buf, { force = true })
      end
    end, {})
  end

  -- ファイルを開いてもカレントディレクトリを変更しない
  vim.g.startify_change_to_dir = 0
  vim.g.startify_custom_header  = vim.fn.map(vim.fn.split(vim.fn.system('date'), '\n'), '"   " . v:val') -- luacheck: ignore
  vim.g.startify_custom_indices = { 'f','d','n','m','v','g','u','r','i','s','l','a','c','x','w','o','h','y','t','b','z','p' }
  vim.g.startify_commands = {
    { 'Git status', 'StartifyGitStatus' },
  }
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
local function open_repo_files_float()
  local root = current_git_root()
  if not root then
    vim.notify('Not in a git repository', vim.log.levels.WARN)
    return
  end

  local files = {}
  local seen = {}
  local paths = git_lines(root, { 'ls-files', '--cached', '--others', '--exclude-standard' }) or {}

  for _, path in ipairs(paths) do
    if path ~= '' and not seen[path] and vim.fn.filereadable(root .. '/' .. path) == 1 then
      seen[path] = true
      table.insert(files, path)
    end
  end

  open_git_file_picker('git-repo-files', root, files, 'GitFiles> ', 'No files in repository')
end

map('n', '<M-p>', open_repo_files_float, { silent = true })

local function open_changed_files_float()
  local root = current_git_root()
  if not root then
    vim.notify('Not in a git repository', vim.log.levels.WARN)
    return
  end

  local changed = {}
  local seen = {}
  local sources = {
    { 'diff', '--name-only', '--relative', '--diff-filter=ACMRTUXB' },
    { 'diff', '--cached', '--name-only', '--relative', '--diff-filter=ACMRTUXB' },
    { 'ls-files', '--others', '--exclude-standard' },
  }

  for _, args in ipairs(sources) do
    local lines = git_lines(root, args)
    if lines then
      for _, path in ipairs(lines) do
        if path ~= '' and not seen[path] and vim.fn.filereadable(root .. '/' .. path) == 1 then
          seen[path] = true
          table.insert(changed, path)
        end
      end
    end
  end

  open_git_file_picker('git-changed-files', root, changed, 'GitChanged> ', 'No changed files')
end

map('n', '<M-g>', open_changed_files_float, { silent = true })
map('n', '<M-d>', function()
  open_branch_diff_picker('origin/main')
end, { silent = true, desc = 'Changed files vs origin/main' })

vim.api.nvim_create_user_command('GitBranchDiffFiles', function(opts)
  open_branch_diff_picker(opts.args ~= '' and opts.args or 'origin/main')
end, {
  nargs = '?',
})

local function open_ignored_files_float()
  local root = current_git_root()
  if not root then
    vim.notify('Not in a git repository', vim.log.levels.WARN)
    return
  end

  local ignored = git_lines(root, { 'ls-files', '--others', '--ignored', '--exclude-standard' }) or {}
  open_git_file_picker('git-ignored-files', root, ignored, 'GitIgnored> ', 'No ignored files')
end

map('n', '<M-i>', open_ignored_files_float, { silent = true })

local function open_repo_recent_files()
  local root = current_repo_root()
  local prefix = root .. '/'
  local recent = {}
  local seen = {}

  local function add_if_in_repo(path)
    if path == '' then
      return
    end

    local absolute = normalized_path(path)
    if vim.fn.filereadable(absolute) ~= 1 then
      return
    end

    if absolute ~= root and absolute:sub(1, #prefix) ~= prefix then
      return
    end

    if seen[absolute] then
      return
    end

    seen[absolute] = true
    table.insert(recent, absolute)
  end

  add_if_in_repo(vim.fn.expand('%'))
  for _, buf in ipairs(vim.fn.getbufinfo({ buflisted = 1 })) do
    add_if_in_repo(buf.name)
  end
  for _, path in ipairs(vim.v.oldfiles) do
    add_if_in_repo(path)
  end

  if #recent == 0 then
    vim.notify('No recent files in repository', vim.log.levels.INFO)
    return
  end

  local source = vim.tbl_map(function(path)
    return path:sub(#prefix + 1)
  end, recent)

  local spec = vim.fn['fzf#vim#with_preview']({
    source = source,
    options = {
      '--scheme', 'path',
      '--prompt', vim.fn.fnamemodify(root, ':t') .. '> ',
      '--tiebreak=index',
    },
    sink = function(choice)
      if choice and choice ~= '' then
        vim.cmd('edit ' .. escaped(root .. '/' .. choice))
      end
    end,
  })

  vim.fn['fzf#run'](vim.fn['fzf#wrap']('repo-history-files', spec))
end

map('n', '<M-o>', open_repo_recent_files, { silent = true })

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

-- gitsigns.nvim
if is_installed('gitsigns.nvim') then
  require('gitsigns').setup({
    on_attach = function(bufnr)
      local gitsigns = require('gitsigns')

      local function hunk_map(lhs, fallback, jump, desc)
        map('n', lhs, function()
          if vim.wo.diff then
            vim.cmd.normal({ fallback, bang = true })
          else
            jump()
          end
        end, { buffer = bufnr, desc = desc })
      end

      hunk_map('gh', ']c', gitsigns.next_hunk, 'Next git hunk')
      hunk_map('gH', '[c', gitsigns.prev_hunk, 'Previous git hunk')
      hunk_map('gs', ']c', function()
        gitsigns.nav_hunk('next', { target = 'staged' })
      end, 'Next staged git hunk')
      hunk_map('gS', '[c', function()
        gitsigns.nav_hunk('prev', { target = 'staged' })
      end, 'Previous staged git hunk')
    end,
  })
end

local function navigate_staged_hunk(direction, fallback)
  if vim.wo.diff then
    vim.cmd.normal({ fallback, bang = true })
    return
  end

  local ok, gitsigns = pcall(require, 'gitsigns')
  if ok then
    gitsigns.nav_hunk(direction, { target = 'staged' })
  end
end

map('n', 'gs', function()
  navigate_staged_hunk('next', ']c')
end, { silent = true, desc = 'Next staged git hunk' })

map('n', 'gS', function()
  navigate_staged_hunk('prev', '[c')
end, { silent = true, desc = 'Previous staged git hunk' })

-- vim-fugitive
if is_installed('vim-fugitive') then
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'fugitive',
    callback = function(ev)
      map('n', 'dt', function()
        vim.cmd.normal({ 'O' })
        vim.cmd('Gvdiffsplit')
      end, {
        buffer = ev.buf,
        silent = true,
        desc = 'Open Fugitive diff in new tab',
      })
    end,
  })
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
  patch_global('sources', { 'lsp', 'around' })
  patch_global('sourceOptions', {
    _ = {
      matchers   = { 'matcher_head' },
      sorters    = { 'sorter_rank' },
      converters = { 'converter_remove_overlap' },
    },
    ['lsp'] = {
      isVolatile = true,
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

-- mason.nvim / mason-lspconfig.nvim
if is_installed('mason.nvim') then
  require('mason').setup()
end

if is_installed('mason-lspconfig.nvim') then
  require('mason-lspconfig').setup({
    ensure_installed = { 'pyright', 'ruff', 'ts_ls' },
    automatic_enable = false,
  })
end

-- nvim-lspconfig (pyright + ruff for Python, ts_ls for TypeScript)
if is_installed('nvim-lspconfig') then
  vim.api.nvim_create_user_command('LspSymbols', function(opts)
    local query = opts.args ~= '' and opts.args or vim.fn.input('LSP symbol query: ')
    if query == '' then
      return
    end
    open_lsp_symbol_picker(query)
  end, {
    nargs = '*',
  })

  vim.api.nvim_create_user_command('LspSymbolsCursor', function()
    local query = lsp_symbol_query_at_cursor()
    if query == '' then
      vim.notify('No symbol under cursor', vim.log.levels.WARN)
      return
    end
    open_lsp_symbol_picker(query)
  end, {})

  vim.api.nvim_create_user_command('LspDocumentSymbols', function()
    open_lsp_document_symbol_picker()
  end, {})

  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('lsp-keymaps', { clear = true }),
    callback = function(ev)
      local opts = { silent = true, buffer = ev.buf }
      map('n', 'gd',         vim.lsp.buf.definition,      opts)
      map('n', 'K',          vim.lsp.buf.hover,            opts)
      map('n', 'gi',         vim.lsp.buf.implementation,   opts)
      map('n', 'gr',         vim.lsp.buf.references,       opts)
      map('n', '<Leader>rn', vim.lsp.buf.rename,           opts)
      map('n', '<Leader>ca', vim.lsp.buf.code_action,      opts)
      map('n', ']d',         vim.diagnostic.goto_next,     opts)
      map('n', '[d',         vim.diagnostic.goto_prev,     opts)
      map('n', '<C-9>',      vim.diagnostic.goto_next,     opts)
      map('n', '<C-0>',      vim.diagnostic.goto_prev,     opts)
      map('n', '<Leader>d',  vim.diagnostic.open_float,    opts)
      map('n', '<Leader>lS', '<Cmd>LspSymbols<CR>',          opts)
      map('n', '<Leader>ls', '<Cmd>LspSymbolsCursor<CR>',    opts)
      map('n', '<Leader>lo', '<Cmd>LspDocumentSymbols<CR>',  opts)
    end,
  })

  vim.lsp.enable({ 'pyright', 'ruff', 'ts_ls' })
end

-- nvim-treesitter
if is_installed('nvim-treesitter') then
  local ok, configs = pcall(require, 'nvim-treesitter.configs')
  if ok then
    configs.setup({
      ensure_installed = { 'python', 'javascript', 'typescript', 'tsx' },
      auto_install = true,
      highlight = { enable = false },
      indent = { enable = false },
    })
  else
    local ok_ts, treesitter = pcall(require, 'nvim-treesitter')
    if ok_ts then
      treesitter.setup({})
    end
  end
end

-- neotest
if is_installed('neotest') then
  local neotest = require('neotest')
  local adapters = {
    require('neotest-python')({
      runner = 'pytest',
    }),
  }

  if is_installed('neotest-vitest') then
    table.insert(adapters, require('neotest-vitest')({
      filter_dir = function(name)
        return name ~= 'node_modules'
      end,
    }))
  end

  neotest.setup({
    adapters = adapters,
  })

  vim.api.nvim_create_user_command('NeotestNearest', function()
    neotest.run.run()
  end, {})

  vim.api.nvim_create_user_command('NeotestFile', function()
    neotest.run.run(vim.fn.expand('%'))
  end, {})

  vim.api.nvim_create_user_command('NeotestSummary', function()
    neotest.summary.toggle()
  end, {})

  vim.api.nvim_create_user_command('NeotestOutput', function()
    neotest.output.open({ enter = true, auto_close = true })
  end, {})
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
