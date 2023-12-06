-- bootstrap lazy.nvim
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

-- setup plugins, leader necessary
vim.g.mapleader = ","
require("lazy").setup({
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  'Mofiqul/dracula.nvim',
  'preservim/nerdtree',
  {'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true }}
})

-- set color scheme
vim.cmd.colorscheme('dracula')
local dracula = require("dracula")
dracula.setup({
  -- customize dracula color palette
  colors = {
    bg = "#282A36",
    fg = "#F8F8F2",
    selection = "#44475A",
    comment = "#6272A4",
    red = "#FF5555",
    orange = "#FFB86C",
    yellow = "#F1FA8C",
    green = "#50fa7b",
    purple = "#BD93F9",
    cyan = "#8BE9FD",
    pink = "#FF79C6",
    bright_red = "#FF6E6E",
    bright_green = "#69FF94",
    bright_yellow = "#FFFFA5",
    bright_blue = "#D6ACFF",
    bright_magenta = "#FF92DF",
    bright_cyan = "#A4FFFF",
    bright_white = "#FFFFFF",
    menu = "#21222C",
    visual = "#3E4452",
    gutter_fg = "#4B5263",
    nontext = "#3B4048",
    white = "#ABB2BF",
    black = "#191A21",
  },
  -- show the '~' characters after the end of buffers
  show_end_of_buffer = true, -- default false
  -- use transparent background
  transparent_bg = true, -- default false
  -- set custom lualine background color
  lualine_bg_color = "#44475a", -- default nil
  -- set italic comment
  italic_comment = true, -- default false
  -- overrides the default highlights with table see `:h synIDattr`
  overrides = {},
  -- You can use overrides as table like this
    -- overrides = {
    --   NonText = { fg = "white" }, -- set NonText fg to white
    --   NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
    --   Nothing = {} -- clear highlight of Nothing
    -- },
    -- Or you can also use it like a function to get color from theme
    -- overrides = function (colors)
    --   return {
    --     NonText = { fg = colors.white }, -- set NonText fg to white of theme
    --   }
    -- end,
})

-- lualine
require('lualine').setup()

function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end
function nmap(shortcut, command)
  map('n', shortcut, command)
end
function imap(shortcut, command)
  map('i', shortcut, command)
end

-- pure config
vim.g.syntax = "enable"
-- options
local opt = vim.opt
-- line numbers
opt.number = true
opt.relativenumber = true
-- tabs and indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
-- line wrap
opt.wrap = false
-- search settings
opt.ignorecase = true
opt.smartcase = true
-- cursor line
opt.cursorline = true
-- colors
opt.termguicolors = true
opt.signcolumn = "yes"
-- backspace
opt.backspace = "indent,eol,start"
-- clipboard
opt.clipboard:append("unnamedplus")

-- keymap
nmap('<C-n>', ':NERDTreeToggle<CR>')
nmap('<C-f>', ':NERDTreeFind<CR>')
