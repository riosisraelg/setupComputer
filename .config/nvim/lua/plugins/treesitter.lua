-- ~/.config/nvim/lua/plugins/treesitter.lua
return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "bash",
        "bibtex",
        "c",
        "comment",
        "cpp",
        "css",
        "diff",
        "dockerfile",
        "gitcommit",
        "gitignore",
        "html",
        "java",
        "javascript",
        "json",
        "latex",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "regex",
        "scss",
        "sql",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    },
    config = function(_, opts)
      local ok_configs, ts_configs = pcall(require, "nvim-treesitter.configs")
      if ok_configs then
        ts_configs.setup(opts)
      else
        local ok_ts, ts = pcall(require, "nvim-treesitter")
        if ok_ts then
          ts.setup(opts)
        end
      end

      if opts.highlight and opts.highlight.enable then
        vim.api.nvim_create_autocmd("FileType", {
          pattern = "*",
          callback = function()
            pcall(vim.treesitter.start)
          end,
        })
      end
    end,
  },
}

