-- ~/.config/nvim/lua/plugins/cmdline.lua
-- Cmdline flotante centrada (estilo VS Code) usando el sistema ui2 nativo de nvim 0.12
-- NOTA: ui2 es API experimental de Neovim 0.12. Si una futura version la rompe, quitar este archivo.
return {
  {
    "rachartier/tiny-cmdline.nvim",
    event = "VeryLazy",
    init = function()
      -- Requerido: cmdheight=0 para mejor experiencia con ui2
      vim.o.cmdheight = 0
    end,
    config = function()
      -- Habilitar ui2 explicitamente (requerido por el plugin)
      pcall(function()
        require("vim._core.ui2").enable({})
      end)

      require("tiny-cmdline").setup({
        width = {
          value = "60%",
          min = 40,
          max = 80,
        },
        position = {
          x = "50%", -- centrado horizontal
          y = "50%", -- centrado vertical
        },
        border = "rounded",
        title = {
          enabled = true,
          pos = "center",
        },
      })

      -- Colores para que combine con Rose Pine (rosa)
      vim.api.nvim_set_hl(0, "TinyCmdlineBorder", { link = "FloatBorder" })
      vim.api.nvim_set_hl(0, "TinyCmdlineNormal", { link = "NormalFloat" })
    end,
  },
}
