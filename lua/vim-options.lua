vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set relativenumber")
vim.g.mapleader = " "
vim.g.skip_ts_context_commentstring_module = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.cmdheight = 1
vim.opt.scrolloff = 10
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.wrap = false -- No Wrap lines
vim.keymap.set("n","<C-a>","gg<S-v>G")


-- New tab
-- vim.keymap.set("n", "te", ":tabedit<Return>")
-- vim.keymap.set("n", "<tab>", ":tabnext<Return>", opts)
-- vim.keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
