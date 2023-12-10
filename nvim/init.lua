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

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- enable highlight groups
vim.opt.termguicolors = true

-- load bookmarks
require('config.bookmarks')

-- install plugins, leader necessary
vim.g.mapleader = ","
require("lazy").setup(
  { import = "plugins" },
  {
      defaults = { lazy = true },
      checker = { enabled = false, notify = false },
      debug = false,
      ui = { border = "rounded" },
  })

-- load options
require('config.options')

-- load lsp config
-- require('config.lsp-zero')

-- load keymap
require('config.keymap')
