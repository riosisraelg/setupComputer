-- ~/.config/nvim/lua/config/options.lua

-- Leader key must be set before lazy.nvim loads
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 1. Disable backup and swap files
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- 2. System Clipboard for seamless copy/paste
-- 'unnamedplus' uses the system clipboard (+) for all operations
vim.opt.clipboard = "unnamedplus"

-- 3. Theme / Colors
-- Enable 24-bit RGB colors
vim.opt.termguicolors = true
-- To use the terminal's theme and background, clear Neovim's background
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- 4. Basic Editor settings for C++, Python, Java
vim.opt.number = true         -- Show line numbers
vim.opt.cursorline = true  -- Highlight the current line (requerido por modicator)
vim.opt.tabstop = 4           -- Number of spaces tabs count for
vim.opt.shiftwidth = 4        -- Size of an indent
vim.opt.expandtab = true      -- Use spaces instead of tabs
vim.opt.smartindent = true    -- Insert indents automatically
