-- ~/.config/nvim/lua/plugins/which-key.lua
return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern",
      spec = {
        { "<leader>b", group = "Buffer Management" },
        { "<leader>c", group = "Code Actions / LSP" },
        { "<leader>d", group = "Diagnostics" },
        { "<leader>f", group = "Find / Telescope" },
        { "<leader>g", group = "Git (Telescope)" },
        { "<leader>h", group = "Git Hunks" },
        { "<leader>l", group = "LaTeX / VimTeX" },
        { "<leader>m", group = "Markdown (In-buffer & Terminal)" },
        { "<leader>q", group = "Quit / Diagnostic List" },
        { "<leader>r", group = "Rename / Refactor" },
        { "<leader>s", group = "Split Windows" },
        { "<leader>t", group = "Table Mode / Terminal" },
        { "<leader>w", group = "Save / Windows" },
        { "<leader>x", group = "Trouble / Diagnostics List" },
      },
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (Tips)",
      },
    },
  },
}
