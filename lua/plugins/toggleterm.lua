return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({
			size = 20,
			open_mapping = [[<c-t>]],
			hide_numbers = true, -- hide the number column in toggleterm buffers
			shade_filetypes = {},
			autochdir = false,
			shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
			shading_factor = "2", -- the percentage by which to lighten terminal background, default: -30 (gets multiplied by -3 if background is light)
			start_in_insert = true,
			insert_mappings = true, -- whether or not the open mapping applies in insert mode
			persist_size = true,
			persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
			direction = "float",
			close_on_exit = true, --
			shell = vim.o.shell,
			auto_scroll = true,
			float_opts = {
				border = "curved",
				winblend = 0,
				highlights = {
					border = "Normal",
					backgrounf = "Normal",
				},
			},
		})
		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], {})
			vim.keymap.set("t", "jk", [[<C-\><C-n>]], {})
			vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], {})
			vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], {})
			vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], {})
			vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], {})
			vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], {})
		end

		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
	end,
}
