-- bootstrap lazy.nvim (boilerplate)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- load bookmarks
require('config.bookmarks')

-- install plugins, leader necessary
vim.g.mapleader = ","
require("lazy").setup({
  { import = "plugins" },
})

-- load options
require('config.options')

-- load keymap
require('config.keymap')
