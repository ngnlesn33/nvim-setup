
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
-- Enable clipboard support
require("vim-options")
require("keymaps")
require("lazy").setup("plugins")
