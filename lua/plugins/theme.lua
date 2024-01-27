return {
	-- "catppuccin/nvim",
	-- name = "catppuccin",
	-- priority = 1000,
	-- config = function()
	-- 	vim.cmd.colorscheme("catppuccin-frappe")
	-- end,
	"AlexvZyl/nordic.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("nordic").setup({
			bright_border = true,
		})
		require("nordic").load()
	end,
	-- "shaunsingh/nord.nvim",
	-- config = function()
	-- 	vim.cmd([[colorscheme nord]])
	-- end,
}
