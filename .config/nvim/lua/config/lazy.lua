-- ~/.config/nvim/lua/config/lazy.lua

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim to automatically load all plugins in lua/plugins/*.lua
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  install = { missing = true, colorscheme = { "habamax" } },
  checker = { enabled = false },
})
