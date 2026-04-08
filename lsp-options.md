# LSP Plugin Options for Neovim

## 1. nvim-lspconfig + mason *(currently in use)*
- Official config collection for nvim's built-in LSP client
- Low-level, minimal abstraction
- Paired with Mason to install/manage server binaries inside Neovim
- Best for users who want full control

## 2. mason.nvim + mason-lspconfig.nvim
- Installs/manages LSP servers automatically inside nvim
- Pairs well with nvim-lspconfig
- Great if you want `:MasonInstall ruff` instead of manual installs

## 3. AstroNvim / LazyVim / NvChad
- Full distros that bundle LSP + everything else
- Opinionated, fast to set up, harder to customize deeply

## 4. none-ls (null-ls fork)
- Bridges non-LSP tools (formatters, linters) into the LSP interface
- Often used alongside nvim-lspconfig

---

## Recommendation

For a hand-crafted config, this repo now uses **mason.nvim** to auto-manage server binaries:

```
nvim-lspconfig   ← server configs (already have)
mason.nvim       ← installs server binaries
mason-lspconfig  ← bridges the two
```
