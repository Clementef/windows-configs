vim.cmd.colorscheme('dracula')
-- pure config
vim.g.syntax = "enable"
-- options
local opt = vim.opt
-- line numbers
opt.number = true
opt.relativenumber = true
-- tabs and indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = false
opt.smartindent = false
-- soft breaks and shifting
-- opt.breakindent = true
-- opt.linebreak = true
-- opt.breakindentopt = {'shift:1'}
-- opt.showbreak = ">>"
-- line wrap
opt.wrap = false
-- search settings
opt.ignorecase = true
opt.smartcase = true
-- cursor line
-- opt.cursorline = true
-- opt.signcolumn = "yes"
-- backspace
opt.backspace = "indent,eol,start"
-- clipboard
opt.clipboard:append("unnamedplus")
-- default right split
opt.splitright = true
opt.splitbelow = true

