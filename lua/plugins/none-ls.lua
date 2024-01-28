return {
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.formatting.clang_format,
					null_ls.builtins.diagnostics.eslint,
				},
			})
			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
		end,
	},
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					-- Use a sub-list to run only the first available formatter
					cpp = { "clang_format" },
					javascript = { { "prettierd", "prettier" } },
					javascriptreact = { "prettier" },
					typescript = { "prettier" },
					typescriptreact = { "prettier" },
					vue = { "prettier" },
					css = { "prettier" },
					scss = { "prettier" },
					less = { "prettier" },
					html = { "prettier" },
					json = { "prettier" },
					jsonc = { "prettier" },
					yaml = { "prettier" },
				},
			})
		end,
	},
}
