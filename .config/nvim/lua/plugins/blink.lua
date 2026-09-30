-- ~/.config/nvim/lua/plugins/blink.lua
-- Motor de autocompletado moderno y rapido (fuzzy matcher en Rust)
-- Reemplaza a nvim-cmp. V1 estable.
return {
  {
    "saghen/blink.cmp",
    version = "1.*", -- V1 estable (V2 tiene breaking changes)
    dependencies = {
      "rafamadriz/friendly-snippets", -- snippets estilo VS Code
    },
    event = "InsertEnter",
    opts = {
      -- Keymaps preset: enter para confirmar, tab/shift-tab para navegar
      keymap = {
        preset = "enter",
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
        ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },
      },

      appearance = {
        -- Iconos por tipo (usa Nerd Font, que ya tienes)
        nerd_font_variant = "mono",
        use_nvim_cmp_as_default = true,
      },

      completion = {
        -- Documentacion automatica al seleccionar
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
          window = { border = "rounded" },
        },
        menu = {
          border = "rounded",
          draw = {
            treesitter = { "lsp" },
          },
        },
        -- Ghost text: muestra la sugerencia inline (estilo Copilot)
        ghost_text = { enabled = true },
      },

      -- Fuentes de completado
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },

      -- Signature help (ayuda de firma de funciones) - experimental
      signature = { enabled = true },

      -- Fuzzy matcher en Rust (rapido, resistente a typos)
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
  },
}
