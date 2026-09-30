-- ~/.config/nvim/lua/plugins/autopairs.lua
return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        fast_wrap = {},
      })
      -- Nota: blink.cmp maneja auto-brackets de forma nativa,
      -- por eso ya no integramos autopairs con el motor de completado.
    end,
  },
}
