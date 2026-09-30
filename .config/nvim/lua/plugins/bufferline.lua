-- ~/.config/nvim/lua/plugins/bufferline.lua
-- Pestañas visuales de buffers (usa los keymaps <S-h>/<S-l> ya definidos)
return {
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        separator_style = "slant",
        show_buffer_close_icons = true,
        show_close_icon = false,
      },
    },
  },
}
