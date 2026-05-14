# Neovim Keymaps Reference

Leader key: `<Space>`

---

## Navigation

| Key                | Action                           |
|--------------------|----------------------------------|
| `<leader>fd`       | Open file explorer (netrw)       |
| `<leader>wh/j/k/l` | Move to left/down/up/right split |
| `<leader>nb`       | New buffer                       |
| `]b`               | Next buffer                      |
| `[b`               | Previous buffer                  |
| `<leader>bd`       | Delete (close) buffer            |

---

## Telescope (Fuzzy Finder)

| Key          | Action                             |
|--------------|------------------------------------|
| `<leader>ff` | Find files                         |
| `<leader>fg` | Find git-tracked files             |
| `<leader>fs` | Live grep (search text in project) |
| `<leader>fS` | Grep string under cursor           |
| `<leader>fb` | Browse open buffers                |

---

## LSP

These activate when a language server attaches to a buffer.

| Key          | Action                           |
|--------------|----------------------------------|
| `gd`         | Go to definition                 |
| `gr`         | Find references                  |
| `gi`         | Go to implementation             |
| `K`          | Hover documentation              |
| `<leader>rn` | Rename symbol                    |
| `<leader>ca` | Code action                      |
| `<leader>e`  | Show diagnostic for current line |
| `[d`         | Go to previous diagnostic        |
| `]d`         | Go to next diagnostic            |
| `<leader>cf` | Format buffer (via conform.nvim) |

### Language servers configured

| Language            | Server                                         | Notes                                                  |
|---------------------|------------------------------------------------|--------------------------------------------------------|
| JS / TS / JSX / TSX | `ts_ls` (via typescript-tools.nvim) + `eslint` | ESLint auto-fixes on save                              |
| C / C++             | `clangd`                                       | Wants `compile_commands.json` for cross-file go-to-def |
| Go                  | `gopls`                                        |                                                        |
| Rust                | `rust_analyzer`                                | Cargo projects work OOTB                               |
| Scala / sbt         | `metals` (via nvim-metals)                     | Auto-attaches on file open                             |

### Format-on-save (via conform.nvim)

| Filetype                   | Formatter                         |
|----------------------------|-----------------------------------|
| JS / TS / JSX / TSX / JSON | `prettierd` → `prettier` fallback |
| Scala                      | `scalafmt`                        |
| C / C++                    | `clang-format`                    |
| Go                         | `goimports` → `gofumpt`           |
| Rust                       | `rustfmt`                         |

---

## TypeScript Tools (`typescript-tools.nvim`)

These work in both JS and TS files (JS, JSX, TS, TSX).

| Key          | Action                             |
|--------------|------------------------------------|
| `<leader>ti` | Add all missing imports            |
| `<leader>to` | Organize imports                   |
| `<leader>tu` | Remove unused imports              |
| `<leader>tr` | Rename file and update all imports |
| `<leader>tf` | Fix all auto-fixable errors        |

---

## Debugger (nvim-dap)

Same keybinds across every supported language — the launch picker (`<leader>dc`)
shows the configurations registered for the current filetype.

| Key          | Action                                                           |
|--------------|------------------------------------------------------------------|
| `<leader>dc` | Continue / Start debug session (shows config picker if multiple) |
| `<leader>dt` | Toggle breakpoint                                                |
| `<leader>do` | Step over                                                        |
| `<leader>di` | Step into                                                        |
| `<leader>dO` | Step out                                                         |
| `<leader>dq` | Terminate session                                                |
| `<leader>du` | Toggle DAP UI                                                    |
| `<leader>dT` | Go only — debug nearest test (via `nvim-dap-go`)                 |

### Adapters per language

| Language            | Adapter                                 | Mason package      | Notes                                                           |
|---------------------|-----------------------------------------|--------------------|-----------------------------------------------------------------|
| JS / TS / JSX / TSX | `pwa-node` (vscode-js-debug)            | `js-debug-adapter` | Launch current file, ts-node, attach :9229, attach by PID       |
| C / C++             | `codelldb` (LLDB / LLVM)                | `codelldb`         | Compile with `-g`; picker asks for executable path              |
| Rust                | `codelldb` (LLDB / LLVM)                | `codelldb`         | Run `cargo build` first; debug `target/debug/<binary>`          |
| Go                  | `delve` (via `nvim-dap-go`)             | `delve`            | `<leader>dc` debugs current file; `<leader>dT` for nearest test |
| Scala / sbt         | metals built-in DAP (via `nvim-metals`) | —                  | Picker lists runnable mains/tests Metals detects                |

### How to attach to a running Node process

1. Start your app with the inspect flag:
   ```
   node --inspect server.js
   node --inspect-brk server.js   # pauses at start, waits for debugger
   ```
   Or with ts-node: `node --inspect -r ts-node/register src/server.ts`

2. In nvim, press `<leader>dc` and pick **"Attach to process (port 9229)"**.

3. The DAP UI opens automatically. Use the step/continue keys above.

> For Express/Fastify: just attach to whatever port your `node --inspect` is on.
> The source maps config in `dap-js.lua` handles `.ts` → `.js` mapping.

---

## Git — Gitsigns (gutters, blame, per-hunk ops)

Active whenever you're in a file tracked by git.

| Key                   | Action                                     |
|-----------------------|--------------------------------------------|
| `]c`                  | Next changed hunk                          |
| `[c`                  | Previous changed hunk                      |
| `<leader>hs`          | Stage hunk under cursor                    |
| `<leader>hr`          | Reset hunk under cursor (discard changes)  |
| `<leader>hs` (visual) | Stage only the selected lines              |
| `<leader>hr` (visual) | Reset only the selected lines              |
| `<leader>hS`          | Stage entire buffer                        |
| `<leader>hR`          | Reset entire buffer                        |
| `<leader>hu`          | Undo last hunk stage                       |
| `<leader>hp`          | Preview hunk (inline diff popup)           |
| `<leader>hb`          | Full git blame for current line            |
| `<leader>hd`          | Diff this file against index               |
| `<leader>hD`          | Diff this file against last commit         |
| `<leader>tb`          | Toggle inline blame on current line        |
| `<leader>td`          | Toggle deleted line ghosts                 |
| `ih` (text obj)       | Select hunk — use with `v`, `d`, `y`, etc. |

---

## Git — Neogit (commit, branch, rebase, merge)

Magit-inspired full git UI. Press `?` inside Neogit for contextual help.

| Key          | Action             |
|--------------|--------------------|
| `<leader>gg` | Open Neogit status |
| `<leader>gc` | Commit             |
| `<leader>gp` | Pull               |
| `<leader>gP` | Push               |
| `<leader>gb` | Branch management  |
| `<leader>gr` | Rebase             |

**Inside Neogit status:**

| Key    | Action                               |
|--------|--------------------------------------|
| `s`    | Stage file / hunk under cursor       |
| `u`    | Unstage file / hunk                  |
| `x`    | Discard file / hunk                  |
| `<CR>` | Expand / open file                   |
| `c`    | Open commit popup                    |
| `b`    | Open branch popup                    |
| `r`    | Open rebase popup                    |
| `m`    | Open merge popup                     |
| `p`    | Open pull popup                      |
| `P`    | Open push popup                      |
| `Z`    | Open stash popup                     |
| `?`    | Show all keymaps for current context |
| `q`    | Close Neogit                         |

---

## Git — Diffview (diffs, file history, merge conflicts)

| Key          | Action                           |
|--------------|----------------------------------|
| `<leader>gd` | Diff view: working tree vs index |
| `<leader>gD` | Diff view: vs last commit        |
| `<leader>gh` | File history for current file    |
| `<leader>gH` | File history for entire repo     |
| `<leader>gx` | Close diff view                  |

**Inside Diffview:**

| Key          | Action                                |
|--------------|---------------------------------------|
| `<Tab>`      | Next file                             |
| `<S-Tab>`    | Previous file                         |
| `[x` / `]x`  | Previous / next conflict (merge mode) |
| `<leader>co` | Choose OURS in conflict               |
| `<leader>ct` | Choose THEIRS in conflict             |
| `<leader>cb` | Choose BASE in conflict               |
| `<leader>ca` | Choose ALL (both sides)               |
| `q`          | Close                                 |

### Merge conflict workflow

```
git rebase main     # or git merge feature-branch
```
If conflicts arise, open nvim and run `<leader>gd`. Diffview shows a 3-panel
view: LOCAL | BASE | REMOTE with the result buffer below. Navigate conflicts
with `[x` / `]x`, resolve with the `<leader>c*` keys, save, then back in
the terminal: `git rebase --continue`.

---

## Colors

| Key          | Action                                 |
|--------------|----------------------------------------|
| `<leader>cl` | Switch to light theme (tokyonight-day) |
| `<leader>cd` | Switch to dark theme (tokyonight-moon) |

---

## Lazy (Plugin Manager)

Run `:Lazy` to open the plugin manager UI.

| Key (inside :Lazy) | Action                  |
|--------------------|-------------------------|
| `U`                | Update all plugins      |
| `I`                | Install missing plugins |
| `X`                | Clean unused plugins    |
| `q`                | Close                   |

---

## Mason (LSP/Tool Installer)

Run `:Mason` to open the installer UI. Installed automatically:

**Language servers** (via `mason-lspconfig`):

- `ts_ls` — TypeScript / JavaScript language server
- `eslint` — ESLint LSP
- `clangd` — C / C++ language server
- `gopls` — Go language server
- `rust_analyzer` — Rust language server

> `metals` (Scala) is managed by `nvim-metals`, not mason-lspconfig.

**Formatters / debuggers** (via `mason-tool-installer`):

- `prettierd` — Fast Prettier daemon (JS / TS / JSON)
- `scalafmt` — Scala formatter
- `clang-format` — C / C++ formatter
- `gofumpt`, `goimports` — Go formatter + import organizer
- `rustfmt` — Rust formatter
- `js-debug-adapter` — VS Code JS / TS debug adapter
- `codelldb` — LLDB-based debug adapter (C / C++ / Rust)
- `delve` — Go debugger

---

## Claude Code Integration

**Best approach: terminal alongside nvim.**

Options ranked by usefulness:

1. **Split terminal inside nvim** — `:term` opens a terminal buffer, or use a terminal multiplexer.
   - `:vsplit | term` — side-by-side terminal with Claude Code
   - `<C-w>N` — enter normal mode in terminal buffer to scroll

2. **`avante.nvim`** — Cursor-style AI sidebar for nvim, supports Claude API directly.
   GitHub: `yetone/avante.nvim` — requires `ANTHROPIC_API_KEY`.

3. **`codecompanion.nvim`** — Chat + inline edits, also supports Claude.
   GitHub: `olimorris/codecompanion.nvim`

4. **tmux** — Run nvim in one pane, `claude` CLI in another. Most people do this.
   Keybind to switch panes: `<C-b>` + arrow (default tmux prefix).

Most Claude Code power users stick with **option 4 (tmux)** since Claude Code already
understands file paths, git context, and runs commands — you get the full CLI experience
without any plugin overhead.
