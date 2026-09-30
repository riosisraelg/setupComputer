-- ~/.config/nvim/lua/plugins/telescope.lua
-- Fuzzy finder: buscar archivos, grep en proyecto, buffers, etc.
return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      -- Ordenador nativo en C para busqueda mas rapida
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    cmd = "Telescope",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep (buscar texto)" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
      { "<leader>fw", "<cmd>Telescope grep_string<cr>", desc = "Find Word Under Cursor" },
      { "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Find Diagnostics" },
      { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Find Keymaps" },
      { "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Find Commands" },
      { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Git Commits" },
      { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git Status" },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          prompt_prefix = "   ",
          selection_caret = " ",
          path_display = { "truncate" },
          layout_config = {
            horizontal = { prompt_position = "top", preview_width = 0.55 },
          },
          sorting_strategy = "ascending",
          mappings = {
            i = {
              ["<C-j>"] = require("telescope.actions").move_selection_next,
              ["<C-k>"] = require("telescope.actions").move_selection_previous,
              ["<Esc>"] = require("telescope.actions").close,
            },
          },
        },
        pickers = {
          find_files = { hidden = true },
        },
      })
      pcall(telescope.load_extension, "fzf")
    end,
  },
}
