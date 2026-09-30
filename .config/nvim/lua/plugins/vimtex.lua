-- ~/.config/nvim/lua/plugins/vimtex.lua
return {
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = "skim"
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_compiler_latexmk = {
        options = {
          "-pdf",
          "-synctex=1",
          "-interaction=nonstopmode",
        },
      }
      vim.g.vimtex_quickfix_mode = 0
    end,
  },
}
