# Neovim Config Features

Custom features in `nvim/config/lua/plugins.lua`.

## File pickers

Floating fzf pickers, scoped to the current repo.

| Key / command | What it does |
| --- | --- |
| `<M-p>` | Repo files, searched from the directory Neovim started in |
| `<M-o>` | Recent files, limited to the current repo |
| `<M-g>` | Files with uncommitted changes |
| `<M-d>` / `:GitBranchDiffFiles [base]` | Files changed against a branch (default `origin/main`) |
| `<M-i>` | Git-ignored files |

In fzf, `ctrl-w` deletes a word, and `ctrl-x`, `ctrl-v` and `ctrl-t` open the selection in a split, vsplit or tab.

## LSP

Servers are installed through Mason; Python uses pyright. These keys are set when an LSP attaches to a buffer.

| Key / command | What it does |
| --- | --- |
| `gd` / `gi` / `gr` | Go to definition / implementation / references |
| `K` | Hover documentation |
| `<Leader>rn` | Rename symbol |
| `<Leader>ca` | Code action |
| `]d` `[d` or `<C-9>` `<C-0>` | Next / previous diagnostic |
| `<Leader>d` | Show diagnostic in a float |
| `<Leader>lS` (`:LspSymbols`) | Workspace symbol picker |
| `<Leader>ls` (`:LspSymbolsCursor`) | Workspace symbols for the word under the cursor |
| `<Leader>lo` (`:LspDocumentSymbols`) | Outline of the current file's symbols, with preview |

## Git

- **gitsigns:** gutter marks, `gh`/`gH` for next/previous hunk, `gs`/`gS` for next/previous staged hunk. In diff mode these fall back to `]c`/`[c`.
- **Fugitive:** in the status buffer, `dt` opens the file's diff in a new tab.
- **Startify:** has a "Git status" entry and does not change the working directory.

## Testing and linting

- **neotest:** pytest and vitest adapters, with `:NeotestNearest`, `:NeotestFile`, `:NeotestSummary` and `:NeotestOutput`.
- **nvim-lint:** runs mypy on Python files each time you save.
- **Treesitter:** parsers for Python, JS, TS and TSX, with highlighting and indent turned off.

## Editing and navigation

- **Search and motion:** easymotion, incsearch with fuzzy matching, anzu, asterisk, quickhl and accelerated-jk.
- **Yank and paste:** yankround cycles through paste history with `<C-p>`/`<C-n>`. Explicit Neovim clipboard copy mappings are also set.
- **Operators and misc:** easy-align, operator-replace, camelize, flashy yank, niceblock, smartchr and jplus.
- **UI:** nvim-tree (`,t`/`,T`, rooted at the startup directory), lightline and indentLine (`<Leader>i`).
- **Completion:** ddc.vim.

## Repo tooling

- The **`commit-as` skill** commits with the saboten.pillow author.
- **`init.sh`** recreates the treesitter query symlinks.
- Vim's state files (such as undo history) live in `state/`.
