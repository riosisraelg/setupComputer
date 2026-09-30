-- ~/.config/nvim/lua/plugins/theme.lua
-- Rose Pine siguiendo el modo del sistema + UI que imita la paleta PINK de Hyper
return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        variant = "auto",
        dark_variant = "main",
        styles = { transparency = true, italic = true },
      })

      -- Detectar modo del sistema macOS
      local function is_dark()
        local h = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
        local r = h and h:read("*a") or ""
        if h then h:close() end
        return r:match("Dark") ~= nil
      end
      local dark = is_dark()
      vim.o.background = dark and "dark" or "light"

      vim.cmd.colorscheme("rose-pine")

      -- Paletas PINK identicas a Hyper (para que la UI de nvim combine)
      local pink = dark and {
        bg = "#2a1a24", fg = "#f5d5e0", border = "#7a4560",
        accent = "#ff6fa3", accent2 = "#ff5fbf", dim = "#c99ab0",
        sel = "#4a2c3a", tabbg = "#201018", cursorline = "#33202c",
      } or {
        bg = "#fbe4ee", fg = "#5a1236", border = "#d16a9c",
        accent = "#d6006e", accent2 = "#a3006b", dim = "#8a3a62",
        sel = "#f0c4da", tabbg = "#f5d0e2", cursorline = "#f7d8e6",
      }

      local function apply_ui()
        local set = function(g, o) vim.api.nvim_set_hl(0, g, o) end

        -- Transparencia en el area de edicion (toma el fondo de Hyper)
        for _, g in ipairs({ "Normal", "NormalNC", "SignColumn", "EndOfBuffer", "FoldColumn" }) do
          set(g, { bg = "NONE" })
        end

        -- Floats / Telescope: fondo sutil con borde rosa (imita Hyper)
        set("NormalFloat", { bg = "NONE" })
        set("FloatBorder", { fg = pink.border, bg = "NONE" })
        set("TelescopeNormal", { bg = "NONE" })
        set("TelescopeBorder", { fg = pink.border, bg = "NONE" })
        set("TelescopePromptBorder", { fg = pink.accent, bg = "NONE" })
        set("TelescopeSelection", { bg = pink.sel, fg = pink.fg })
        set("TelescopeMatching", { fg = pink.accent, bold = true })

        -- Bordes de ventana (splits) visibles, como en Hyper
        set("WinSeparator", { fg = pink.border, bg = "NONE" })
        set("VertSplit", { fg = pink.border, bg = "NONE" })

        -- CursorLine: sutil, no tapa el texto
        set("CursorLine", { bg = pink.cursorline })
        set("CursorLineNr", { fg = pink.accent, bold = true })

        -- Popup de completado (blink) con acentos rosa
        set("Pmenu", { bg = pink.tabbg, fg = pink.fg })
        set("PmenuSel", { bg = pink.accent, fg = pink.bg, bold = true })
        set("PmenuSbar", { bg = pink.sel })
        set("PmenuThumb", { bg = pink.accent })

        -- Seleccion visual
        set("Visual", { bg = pink.sel })

        -- Bufferline / Tabline: imitar los tabs de Hyper
        set("TabLineSel", { fg = pink.fg, bg = pink.bg, bold = true })
        set("TabLine", { fg = pink.dim, bg = pink.tabbg })
        set("TabLineFill", { bg = pink.tabbg })
      end

      apply_ui()
      vim.api.nvim_create_autocmd("ColorScheme", { pattern = "*", callback = apply_ui })
    end,
  },
}
