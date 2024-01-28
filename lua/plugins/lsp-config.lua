return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "folke/neoconf.nvim",
      "folke/neodev.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "pmizio/typescript-tools.nvim",
    },
    lazy = true,
    config = function()
      require("mason").setup({})
    end,
  },
  -- {
  --   "williamboman/mason-lspconfig.nvim",
  --   lazy = false,
  --   opts = {
  --     ensure_installed = {
  --       "lua_ls",
  --       "clangd",
  --       "tsserver",
  --       "volar",
  --       "tailwindcss",
  --       "emmet_language_server",
  --       "cssls",
  --     },
  --     automatic_installation = true,
  --   },
  -- },
  {
    "simrat39/inlay-hints.nvim",
  },
  {
    "lvimuser/lsp-inlayhints.nvim",
    config = function()
      require("lsp-inlayhints").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf",                                config = true },
      { "folke/neodev.nvim",  opts = { experimental = { pathStrict = true } } },
      "mason.nvim",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      require("neodev").setup({})
      require("neoconf").setup({})

      require("mason-lspconfig").setup({
        ensure_installed = { "volar", "tsserver" },
      })

      require("mason-lspconfig").setup_handlers({
        function(server_name)
          local server_config = {}
          if require("neoconf").get(server_name .. ".disable") then
            return
          end
          if server_name == "volar" then
            server_config.filetypes = { "vue", "typescript", "javascript" }
          end
          lspconfig[server_name].setup(server_config)
        end,
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            hint = {
              enable = true,
            },
          },
        },
        on_attach = function(client, bufnr)
          require("lsp-inlayhints").on_attach(client, bufnr)
        end,
      })
      lspconfig.clangd.setup({
        capabilities = capabilities,
        cmd = {
          "clangd",
          "--offset-encoding=utf-16",
        },
        on_attach = function(client, bufnr)
          require("lsp-inlayhints").on_attach(client, bufnr)
        end,
      })
      lspconfig.html.setup({
        capabilities = capabilities,
        filetypes = {
          "html",
          "htmldjango",
          "javascript",
          "javascriptreact",
          "javascript.jsx",
          "typescript",
          "typescriptreact",
          "typescript.tsx",
          "vue",
        },
      })
      lspconfig.cssls.setup({
        capabilities = capabilities,
        filetypes = {
          "css",
          "scss",
          "less",
          "sass",
          "html",
          "htmldjango",
          "javascript",
          "javascriptreact",
          "javascript.jsx",
          "typescript",
          "typescriptreact",
          "typescript.tsx",
          "vue",
        },
      })
      lspconfig.volar.setup({
        capabilities = capabilities,
      })
      lspconfig.tsserver.setup({
        capabilities = capabilities,
        init_options = {
          preferences = {
            disableSuggestions = false,
          },
        },
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayVariableTypeHintsWhenTypeMatchesName = false,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
          javascript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayVariableTypeHintsWhenTypeMatchesName = false,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
        },
        -- on_attach = setup_tsserver_inlay_hints,
        on_attach = function(client, bufnr)
          require("lsp-inlayhints").on_attach(client, bufnr)
        end,
      })
      lspconfig.eslint.setup({
        capabilities = capabilities,
      })
      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
        filetypes = {
          "html",
          "javascript",
          "javascriptreact",
          "javascript.jsx",
          "typescript",
          "typescriptreact",
          "typescript.tsx",
        },
      })
      lspconfig.emmet_language_server.setup({
        capabilities = capabilities,
        filetypes = {
          "html",
          "htmldjango",
          "javascript",
          "javascriptreact",
          "javascript.jsx",
          "typescript",
          "typescriptreact",
          "typescript.tsx",
        },
        init_options = {
          html = {
            options = {
              -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
              ["bem.enabled"] = true,
            },
          },
        },
      })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, {})
    end,
  },
}
