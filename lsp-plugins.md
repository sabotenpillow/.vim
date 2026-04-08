# Neovim LSP Plugin Options

## Current Setup (this repo)

- **`mason-org/mason.nvim`** — package manager for LSP servers, linters, formatters
- **`mason-org/mason-lspconfig.nvim`** — bridge between Mason and Neovim LSP
- **`neovim/nvim-lspconfig`** — LSP server configuration helper
- **`mfussenegger/nvim-lint`** — external linter integration (mypy, etc.)
- **`ddc.vim`** + **`ddc-source-nvim-lsp`** — completion engine with LSP source

---

## All-in-one Alternatives

| Plugin | Description |
|--------|-------------|
| **`mason.nvim`** + **`mason-lspconfig`** | Auto-install & manage LSP servers. Often paired with `nvim-lspconfig` |
| **`nvim-cmp`** | Most popular completion engine, replaces `ddc.vim` |
| **`blink.cmp`** | Newer, Rust-based completion, very fast |
| **`LazyVim`** / **`AstroNvim`** | Full distros with LSP pre-configured |

---

## Enhancement Plugins (addons to nvim-lspconfig)

| Plugin | Description |
|--------|-------------|
| **`none-ls.nvim`** | Bridge linters/formatters as LSP sources |
| **`conform.nvim`** | Formatter plugin (pairs well with `nvim-lint`) |
| **`fidget.nvim`** | LSP progress indicator |
| **`lspsaga.nvim`** | Richer LSP UI (hover docs, code actions, etc.) |
| **`trouble.nvim`** | Better diagnostics list UI |

---

## Vim-first LSP Clients (not Neovim-specific)

### `yegappan/lsp`
- Written in **Vim9 script** — requires Vim 9.0+
- Self-contained: built-in completion, diagnostics, outline, inlay hints, semantic highlighting
- No external dependencies
- Manually register servers via `LspAddServer()`
- Uses Vim's popup menus, location lists, etc.
- ⚠️ **Not for Neovim** (Vim9 script doesn't run in Neovim)

### `prabirshrestha/vim-lsp`
- Works on both **Vim 8** and **Neovim** (older, mature plugin)
- VimL-based, async via job/channel API
- Self-contained LSP client
- Pairs with **`mattn/vim-lsp-settings`** for auto server setup
- Pairs with **`asyncomplete.vim`** for completion
- Snippet integrations: vim-vsnip, UltiSnips, neosnippet

## All Approaches Compared

| Approach | Neovim | Vim8 | Vim9 | Language | Server install | Completion | Notes |
|---|---|---|---|---|---|---|---|
| **Built-in LSP** (no plugin) | ✅ | ❌ | ❌ | Lua | Manual | needs plugin | Verbose config |
| **`nvim-lspconfig`** ⭐ | ✅ | ❌ | ❌ | Lua | Manual | needs plugin | Recommended for Neovim |
| **`nvim-lspconfig` + `mason`** | ✅ | ❌ | ❌ | Lua | Auto (`:MasonInstall`) | needs plugin | Best for portability |
| **`coc.nvim`** | ✅ | ✅ | ✅ | Node.js | Auto (`:CocInstall`) | built-in | Heavy, requires Node |
| **`prabirshrestha/vim-lsp`** | ✅ | ✅ | ✅ | VimL | via vim-lsp-settings | omnifunc | Mature, Vim-compatible |
| **`yegappan/lsp`** | ❌ | ❌ | ✅ | Vim9 | Manual | built-in | Vim9 only, not Neovim |

**Recommendation: `nvim-lspconfig` (+ `mason` optionally) for Neovim.**

---

## Comparison

| | `nvim-lspconfig` | `yegappan/lsp` | `prabirshrestha/vim-lsp` |
|---|---|---|---|
| Neovim support | ✅ only | ❌ (Vim9 only) | ✅ both Vim8/Neovim |
| Written in | Lua | Vim9 script | VimL |
| Built-in completion | ❌ (needs ddc/cmp) | ✅ | ✅ (omnifunc) |
| Ecosystem | Very large | Small | Medium |
| Server auto-install | via mason.nvim | manual | via vim-lsp-settings |

**For a Neovim setup, `nvim-lspconfig` is the recommended choice.**  
`yegappan/lsp` and `vim-lsp` are better suited for pure Vim users.

---

## Using nvim-lspconfig: What to Install

`nvim-lspconfig` is a config helper only — it does **not** install language servers.
You must install each server externally, then enable it in your config:

```lua
vim.lsp.enable({ 'pylsp', 'ruff', 'ts_ls' })  -- add server names as needed
```

### Currently used (this repo)

| Language | Server | Install |
|----------|--------|---------|
| Python | `pylsp` | `:LspInstall pylsp` |
| Python | `ruff` | `:LspInstall ruff` |
| TypeScript/JS | `ts_ls` | `:LspInstall ts_ls` |

### Other common servers

| Language | Server | Install |
|----------|--------|---------|
| Python (types) | `pyright` | `npm i -g pyright` |
| Lua | `lua_ls` | brew / mason |
| Ruby | `ruby-lsp` | `gem install ruby-lsp` |
| Go | `gopls` | `go install golang.org/x/tools/gopls@latest` |
| Rust | `rust-analyzer` | `rustup component add rust-analyzer` |
| C/C++ | `clangd` | `brew install llvm` |
| JSON | `jsonls` | `npm i -g vscode-langservers-extracted` |
| YAML | `yamlls` | `npm i -g yaml-language-server` |

Full list of server names: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md

---

## Is Configuration Required?

Both installing and configuring are required, but config can be **minimal**.

### Required

1. **Install** the `nvim-lspconfig` plugin
2. **Install** the language server executable (e.g. `pip install ruff`)
3. **Enable** the server — minimum 1 line of config:

```lua
vim.lsp.enable({ 'pylsp', 'ruff', 'ts_ls' })
```

Without this, servers never start. `nvim-lspconfig` provides defaults
(command, filetypes, root detection) for 200+ servers,
but you must tell Neovim which servers to activate.

### Optional (but recommended)

```lua
-- Keymaps on LspAttach
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buf })
    vim.keymap.set('n', 'K',  vim.lsp.buf.hover,      { buffer = ev.buf })
    -- etc.
  end
})
```

Without keymaps, LSP still works — you'd just call `:lua vim.lsp.buf.definition()` manually.

### Summary

| | Required? |
|---|---|
| Install plugin | ✅ |
| Install server executable | ✅ |
| `vim.lsp.enable(...)` | ✅ minimal config needed |
| Keymaps / diagnostics config | ❌ optional but useful |

### Optional addons

| Plugin | Purpose |
|--------|---------|
| `mason.nvim` + `mason-lspconfig` | Auto-install servers inside Neovim |
| `conform.nvim` | Formatting on save |
| `fidget.nvim` | LSP progress spinner |
| `lspsaga.nvim` | Richer hover/code-action UI |
| `trouble.nvim` | Better diagnostics list |
| `none-ls.nvim` | Use linters/formatters as LSP sources |

---

## Troubleshooting Notes

### `[ddc] Not found source: nvim-lsp`

`ddc-source-nvim-lsp` was renamed to **`ddc-source-lsp`**, and the source name changed.

**Fix in `plugins.lua`:**
```lua
-- before
Plug 'Shougo/ddc-source-nvim-lsp'
patch_global('sources', { 'nvim-lsp', 'around' })
['nvim-lsp'] = { ... }

-- after
Plug 'Shougo/ddc-source-lsp'
patch_global('sources', { 'lsp', 'around' })
['lsp'] = { isVolatile = true, ... }
```
Then run `:PlugInstall` and restart Neovim.

---

### `gd` / `gi` / `gr` not working: "method not supported by any server"

**`ruff` does not support go-to-definition, implementation, or references.**
Ruff is a linter/formatter only. You need **`pyright`** for code navigation.

| Feature | `ruff` | `pyright` |
|---------|--------|-----------|
| Diagnostics / linting | ✅ | ✅ |
| Formatting | ✅ | ❌ |
| Go to definition (`gd`) | ❌ | ✅ |
| Go to implementation (`gi`) | ❌ | ✅ |
| Find references (`gr`) | ❌ | ✅ |
| Hover docs (`K`) | ❌ | ✅ |
| Type checking | ❌ | ✅ |

**Run both together** — they don't conflict.

```sh
npm i -g pyright
```

```lua
vim.lsp.enable({ 'ruff', 'pyright', 'ts_ls' })
```

---

### ruff not found by Neovim (installed via `uv` in a project)

`uv add ruff` installs into the project virtualenv only. Neovim needs a global executable.

```sh
uv tool install ruff   # installs to ~/.local/bin/ruff
```

---

### `:LspInfo` — "Not an editor command"

Means `nvim-lspconfig` is not installed. Run `:PlugInstall`.

In newer versions, `:LspInfo` is an alias for:
```
:checkhealth vim.lsp
```

---

### Minimum Neovim version

`nvim-lspconfig` requires **Neovim 0.11.3+**. Support for 0.10 is removed.
Use `vim.lsp.enable()` (not `require('lspconfig').X.setup{}` which is deprecated).
