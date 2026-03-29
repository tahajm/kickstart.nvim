# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal Neovim configuration based on kickstart.nvim. It uses **Lazy.nvim** as the plugin manager and is structured around a single entry point (`init.lua`) with modular custom plugins in `lua/custom/plugins/`.

## Formatting

Lua code is formatted with **StyLua**. Configuration is in `.stylua.toml`:
- Column width: 160
- Indent: 2 spaces
- Single quotes preferred
- No parentheses on function calls when optional

Check formatting (same as CI): run `stylua --check .` from repo root.

## Architecture

### Plugin Loading

Plugins are loaded in three layers via Lazy.nvim:

1. **Core plugins** — defined inline in `init.lua` (LSP, completion, treesitter, telescope, formatters, etc.)
2. **Optional kickstart plugins** — in `lua/kickstart/plugins/`, opt-in by uncommenting `require` lines near the bottom of `init.lua`
3. **Custom plugins** — all `.lua` files in `lua/custom/plugins/` are auto-discovered via `{ import = 'custom.plugins' }`

### Key Files

- `init.lua` — single entry point; contains options, keymaps, and all core plugin specs
- `lua/custom/plugins/` — one file per plugin; add new plugins here
- `lua/custom/keymaps.lua` — custom keybindings (sourced from init.lua)
- `lua/custom/options.lua` — custom editor options (tabstop=4, shiftwidth=4)
- `lua/kickstart/health.lua` — `:checkhealth kickstart` verifies deps (git, make, unzip, rg)

### Adding a New Plugin

Create `lua/custom/plugins/<name>.lua` returning a Lazy.nvim spec table. It will be auto-loaded. Use `opts = {}` for simple setup or `config = function() end` for full control.

### LSP

LSP servers are managed by **Mason**. To enable additional servers, add them to the `servers` table in `init.lua` (around line 600). Lua LSP (`lua_ls`) is the only one enabled by default; commented examples exist for clangd, gopls, pyright, rust_analyzer, ts_ls.

### Completion

**blink.cmp** handles completion with **copilot.lua** + **blink-cmp-copilot** for AI suggestions. Snippets use LuaSnip.

### Colorscheme

**material.nvim** with `darker` style, loaded eagerly (`lazy = false, priority = 1000`).

## CI

GitHub Actions runs a StyLua format check on all pull requests (`.github/workflows/stylua.yml`).
