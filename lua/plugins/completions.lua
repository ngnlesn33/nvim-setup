return {
  {
    "onsails/lspkind.nvim",
  },
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      local lspkind = require("lspkind")
      require("luasnip.loaders.from_vscode").lazy_load()
      local has_words_before = function()
        if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
          return false
        end
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0
            and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
      end
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = vim.schedule_wrap(function(fallback)
            if cmp.visible() and has_words_before() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            else
              fallback()
            end
          end),
        }),
        sources = cmp.config.sources({
          { name = "copilot",  group_index = 2 },
          { name = "nvim_lsp", group_index = 2 },
          { name = "luasnip",  group_index = 2 }, -- For luasnip users.
        }, {
          { name = "buffer" },
        }),
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol_text", -- show only symbol annotations
            maxwidth = 50,      -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            symbol_map = { Copilot = "" },
            ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
            show_labelDetails = true, -- show labelDetails in menu. Disabled by default
            before = function(entry, vim_item)
              vim_item = require("tailwindcss-colorizer-cmp").formatter(entry, vim_item)
              return vim_item
            end,
          }),
        },
        sorting = {
          priority_weight = 2,
          comparators = {
            require("copilot_cmp.comparators").prioritize,
          },
        },
      })
    end,
  },
}
