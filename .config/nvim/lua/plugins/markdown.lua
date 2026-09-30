-- ~/.config/nvim/lua/plugins/markdown.lua
return {
  -- 1. In-Buffer Obsidian-like Live Rendering (Headers, Checkboxes, Callouts, Table borders)
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    ft = { "markdown", "markdown.mdx" },
    opts = {
      heading = {
        enabled = true,
        sign = true,
        icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
      },
      bullet = {
        enabled = true,
        icons = { "●", "○", "◆", "◇" },
      },
      checkbox = {
        enabled = true,
        unchecked = { icon = "󰄱 " },
        checked = { icon = "󰱒 " },
      },
      pipe_table = {
        enabled = true,
        preset = "round", -- 'round' | 'double' | 'heavy' | 'thin'
        style = "full",   -- Box-drawn table borders: ┌─┬─┐ │ │ └─┴─┘
        cell = "padded",  -- Aligned padded cells
      },
      callout = {
        note = { raw = "[!NOTE]", rendered = "󰋽 Note", highlight = "RenderMarkdownInfo" },
        tip = { raw = "[!TIP]", rendered = "󰌶 Tip", highlight = "RenderMarkdownSuccess" },
        important = { raw = "[!IMPORTANT]", rendered = "󰅾 Important", highlight = "RenderMarkdownHint" },
        warning = { raw = "[!WARNING]", rendered = "󰀪 Warning", highlight = "RenderMarkdownWarn" },
        caution = { raw = "[!CAUTION]", rendered = "󰳦 Caution", highlight = "RenderMarkdownError" },
      },
    },
    keys = {
      { "<leader>mr", "<cmd>RenderMarkdown toggle<cr>", desc = "Toggle In-Buffer Markdown Render" },
    },
  },

  -- 2. Markdown Table Creator & Auto-Formatter
  {
    "dhruvasagar/vim-table-mode",
    ft = { "markdown" },
    init = function()
      vim.g.table_mode_corner = "|"
      vim.g.table_mode_header_fillchar = "-"
    end,
    keys = {
      { "<leader>tm", "<cmd>TableModeToggle<cr>", desc = "Toggle Table Mode (Auto-Create & Format)" },
      { "<leader>tr", "<cmd>TableModeRealign<cr>", desc = "Realign / Format Existing Table" },
    },
  },

  -- 3. Terminal Floating Window Markdown Reader (Glow)
  {
    "ellisonleao/glow.nvim",
    cmd = "Glow",
    ft = { "markdown" },
    config = true,
    keys = {
      { "<leader>mp", "<cmd>Glow<cr>", desc = "Preview Markdown in Terminal Floating Window" },
    },
  },

  -- 4. Devicons (for beautiful markdown icons)
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
}
