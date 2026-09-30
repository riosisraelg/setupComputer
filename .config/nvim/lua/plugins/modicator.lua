-- ~/.config/nvim/lua/plugins/modicator.lua
-- Cambia el color del numero de linea del cursor segun el modo de Vim
return {
  {
    "mawkler/modicator.nvim",
    dependencies = { "rose-pine/neovim" }, -- el colorscheme debe cargar antes
    init = function()
      -- Requeridos por modicator (cursorline tambien en options.lua)
      vim.o.cursorline = true
      vim.o.number = true
      vim.o.termguicolors = true
    end,
    opts = {
      show_warnings = false,
      highlights = {
        defaults = { bold = true, italic = false },
      },
      integration = {
        lualine = {
          enabled = true,   -- usa los mismos colores por modo que tu lualine
          highlight = "bg",
        },
      },
    },
  },
}
