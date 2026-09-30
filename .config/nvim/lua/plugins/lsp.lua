-- ~/.config/nvim/lua/plugins/lsp.lua
return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "pyright",
          "clangd",
          "jdtls",
          "texlab",
          "lua_ls",
          "ts_ls",
          "bashls",
          "html",
          "cssls",
          "jsonls",
          "yamlls",
          "dockerls",
          "sqlls",
        },
        automatic_enable = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "saghen/blink.cmp",
    },
    config = function()
      -- 1. Capabilities integration with blink.cmp
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local has_blink, blink = pcall(require, "blink.cmp")
      if has_blink then
        capabilities = blink.get_lsp_capabilities(capabilities)
      end

      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      -- 2. Server-specific configurations
      local server_configs = {
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
              },
              telemetry = {
                enable = false,
              },
            },
          },
        },
        texlab = {
          settings = {
            texlab = {
              build = {
                executable = "latexmk",
                args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
                onSave = true,
              },
              forwardSearch = {
                executable = "/Applications/Skim.app/Contents/SharedSupport/displayline",
                args = { "%l", "%p", "%f" },
              },
            },
          },
        },
      }

      -- 3. Default handler to configure and enable servers
      local default_servers = {
        "pyright",
        "clangd",
        "jdtls",
        "texlab",
        "lua_ls",
        "ts_ls",
        "bashls",
        "html",
        "cssls",
        "jsonls",
        "yamlls",
        "dockerls",
        "sqlls",
      }

      local function configure_server(server_name)
        local custom_config = server_configs[server_name] or {}
        vim.lsp.config(server_name, custom_config)
        vim.lsp.enable(server_name)
      end

      for _, server in ipairs(default_servers) do
        configure_server(server)
      end

      local ok_mlsp, mason_lspconfig = pcall(require, "mason-lspconfig")
      if ok_mlsp then
        for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
          if not vim.tbl_contains(default_servers, server) then
            configure_server(server)
          end
        end
      end

      -- 4. LSP Keymaps attached on LspAttach
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
        callback = function(ev)
          local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, desc = desc })
          end

          map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
          map("n", "gD", vim.lsp.buf.declaration, "Go to Declaration")
          map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
          map("n", "gi", vim.lsp.buf.implementation, "Go to Implementation")
          map("n", "gr", vim.lsp.buf.references, "Go to References")
          map("n", "<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
          map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code Action")
          map("n", "<leader>f", function()
            vim.lsp.buf.format({ async = true })
          end, "Format Document")
          map("n", "<leader>d", vim.diagnostic.open_float, "Show Line Diagnostics")
          map("n", "[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
          map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
          map("n", "<leader>q", vim.diagnostic.setloclist, "Diagnostic Quickfix List")
        end,
      })
    end,
  },
}
