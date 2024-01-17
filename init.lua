
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("init")
require("keymaps")
require("lazy").setup("plugins")
