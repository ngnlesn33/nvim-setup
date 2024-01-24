return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		require("dapui").setup()
		require("nvim-dap-virtual-text").setup({
			-- commented = true,
      highlight_changed_variables = true,
      show_stop_reason = true,
		})

		local dap, dapui = require("dap"), require("dapui")

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				-- CHANGE THIS to your path!
				command = "/home/ngnlesn33/downloads/codelldb/extension/adapter/codelldb",
				args = { "--port", "${port}" },

				-- On windows you may have to uncomment this:
				-- detached = false,
			},
		}
		dap.configurations.cpp = {
			{
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}
		vim.keymap.set("n", "<Leader>b", ":DapToggleBreakpoint<CR>")
		vim.keymap.set("n", "<F5>", ":DapContinue<CR>")
		vim.keymap.set("n", "<F12>", ":DapTerminate<CR>")
		vim.keymap.set("n", "<F8>", ":DapStepInto<CR>")
		vim.keymap.set("n", "<F10>", ":DapStepOver<CR>")
	end,
}
