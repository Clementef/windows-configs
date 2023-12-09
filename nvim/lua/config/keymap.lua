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

-- nvim-tree (modern, lua-based nerdtree)
nmap('<leader>nn', '<CMD>NvimTreeToggle %:p:h<CR>')
nmap('<leader>nf', '<CMD>NvimTreeFindFile<CR>')
nmap('<leader>nc', '<CMD>NvimTreeCollapse<CR>')
nmap('<leader>nt', '<CMD>NvimTreeToggle<CR>')

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
-- nmap('<C-a>','GVgg')

-- split navigation
nmap('<C-h>','<C-w>h')
nmap('<C-j>','<C-w>j')
nmap('<C-k>','<C-w>k')
nmap('<C-l>','<C-w>l')

-- create splits
nmap('<leader>s', '<C-w>v')
nmap('<leader>S', '<C-w>s')

-- resize splits
nmap('<C-Left>', '<C-w><')
nmap('<C-Down>', '<C-w>+')
nmap('<C-Up>', '<C-w>-')
nmap('<C-Right>', '<C-w>>')

-- telescope
local telescope = require('telescope.builtin')
vim.keymap.set("n", "<leader>ff", "<CMD>Telescope find_files theme=dropdown<CR>", {})
vim.keymap.set("n", "<leader>fg", "<CMD>Telescope live_grep theme=dropdown<CR>", {})
vim.keymap.set("n", "<leader>fb", "<CMD>Telescope buffers theme=dropdown<CR>", {})
vim.keymap.set("n", "<leader>fh", "<CMD>Telescope help_tags theme=dropdown<CR>", {})
vim.keymap.set("n", "<leader>fl", "<CMD>Telescope current_buffer_fuzzy_find theme=dropdown<CR>", {})
vim.keymap.set("n", "<leader>fj", "<CMD>Telescope file_browser path=%:p:h select_buffer=true<CR>", {})
vim.keymap.set("n", "<leader>fk", "<CMD>Telescope file_browser select_buffer=true<CR>", {})

-- Lazy
nmap('<leader>l',':Lazy<CR>')

-- Zen Mode
nmap('<leader>z',':ZenMode<CR>')

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
nmap('<C-g>', 'o<ESC>')
nmap('<C-b>', 'O<ESC>')

-- check health
nmap('<leader>h', ':checkhealth<CR>')

-- neorg
nmap('<leader>oc', ':Neorg toggle-concealer<CR>')
nmap('<leader>on', ':Neorg workspace notes<CR>')

-- display startup
nmap('<leader>d', ':Startup display<CR>')

-- D deletes line contents
nmap('D', '0d$')

-- move lines up and down in visual mode
vmap('J', ":m '>+1<CR>gv=gv")
vmap('K', ":m '<-2<CR>gv=gv")

-- undo tree
nmap('<leader>u', ':UndotreeToggle<CR>')

-- set working directory
vim.keymap.set('n', '<leader>p', ':cd %:p:h<CR>', {noremap = true})
vim.keymap.set('n', '<leader>q', ':q<CR>', {noremap = true})

