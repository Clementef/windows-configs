-- mapping functions
function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

function vmap(shortcut, command)
  map('v', shortcut, command)
end

-- nerdtree
nmap('<C-n>', ':NERDTreeToggle<CR>')
nmap('<C-f>', ':NERDTreeFind<CR>')

-- remove highlights
nmap(' ', ':nohl<CR>')
nmap('<ESC>', ':nohl<CR>')

-- compile and run in C
nmap('<leader>r', ':!gcc % -o out.exe & out.exe <CR>')

-- change pwd to file's parent and open windows software.
nmap('<leader>e', ':cd %:p:h | !explorer .<CR>')
nmap('<leader>c', ':cd %:p:h | !start cmd.exe<CR>')

-- save
nmap('<C-s>', ':w<CR>')

-- rebind command
nmap(';',':')

-- select all
nmap('<C-a>','GVgg')

-- split navigation
nmap('<C-h>','<C-w>h')
nmap('<C-j>','<C-w>j')
nmap('<C-k>','<C-w>k')
nmap('<C-l>','<C-w>l')

-- create splits
nmap('<leader>s', '<C-w>v')
nmap('<leader>S', '<C-w>s')

-- resize splits
nmap('<C-u>', '<C-w><')
nmap('<C-i>', '<C-w>+')
nmap('<C-o>', '<C-w>-')
nmap('<C-p>', '<C-w>>')

-- telescope
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope.help_tags, {})

-- Lazy
nmap('<leader>l',':Lazy<CR>')

-- Zen Mode
nmap('<C-z>',':ZenMode<CR>')

-- Lorem
nmap('<leader>ii', ':LoremIpsum<CR>')
nmap('<leader>i1', ':LoremIpsum 100<CR>')
nmap('<leader>i2', ':LoremIpsum 200<CR>')
nmap('<leader>i3', ':LoremIpsum 300<CR>')
nmap('<leader>i4', ':LoremIpsum 400<CR>')
nmap('<leader>i5', ':LoremIpsum 500<CR>')
nmap('<leader>i6', ':LoremIpsum 600<CR>')
nmap('<leader>i7', ':LoremIpsum 700<CR>')
nmap('<leader>i7', ':LoremIpsum 700<CR>')
nmap('<leader>i7', ':LoremIpsum 700<CR>')
nmap('<leader>i8', ':LoremIpsum 800<CR>')
nmap('<leader>i9', ':LoremIpsum 900<CR>')

-- insert line in normal mode
nmap('<C-b>', 'o<ESC>')
nmap('<C-g>', 'O<ESC>')

-- check health
nmap('<leader>h', ':checkhealth<CR>')

-- neorg
nmap('<C-c>', ':Neorg toggle-concealer<CR>')
