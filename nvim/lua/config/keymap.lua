-- mapping functions
function nmap(shortcut, command)
  vim.api.nvim_set_keymap("n", shortcut, command, { noremap = true, silent = true })
end

function vmap(shortcut, command)
  vim.api.nvim_set_keymap("v", shortcut, command, { noremap = true, silent = true })
end

function mapcmd(mode, shortcut, command, opts)
    vim.api.nvim_set_keymap(mode, shortcut, "<CMD>" .. command .. "<CR>", opts)
end

function nmapcmd(shortcut, command)
    mapcmd("n", shortcut, command, { noremap = true, silent = true })
end

function vmapcmd(shortcut, command)
    mapcmd("v", shortcut, command, { noremap = true, silent = true })
end

-- remove highlights
nmapcmd(' ', 'nohl')
nmapcmd('<ESC>', 'nohl')

-- compile and run in C
nmapcmd('<leader>r', '!gcc % -o out.exe & out.exe')

-- change pwd to file's parent and open windows software.
nmapcmd('<leader>e', 'cd %:p:h | !explorer .')
nmapcmd('<leader>c', 'cd %:p:h | !start cmd.exe')

-- save
nmapcmd('<C-s>', 'w')

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
mapcmd("n", "<leader>ff", "Telescope find_files theme=dropdown", {})
mapcmd("n", "<leader>fg", "Telescope live_grep theme=dropdown", {})
mapcmd("n", "<leader>fb", "Telescope buffers theme=dropdown", {})
mapcmd("n", "<leader>fh", "Telescope help_tags theme=dropdown", {})
mapcmd("n", "<leader>fl", "Telescope current_buffer_fuzzy_find theme=dropdown", {})
mapcmd("n", "<leader>fo", "Telescope oldfiles theme=dropdown", {})

-- telescope file browser
mapcmd("n", "<leader>fj", "Telescope file_browser path=%:p:h select_buffer=true", {})
mapcmd("n", "<leader>fk", "Telescope file_browser select_buffer=true", {})

-- Lazy
nmapcmd('<leader>l','Lazy')

-- Zen Mode
nmapcmd('<leader>z','ZenMode')

-- Lorem
nmapcmd('<leader>ii', 'LoremIpsum')
nmapcmd('<leader>i1', 'LoremIpsum 100')
nmapcmd('<leader>i2', 'LoremIpsum 200')
nmapcmd('<leader>i3', 'LoremIpsum 300')
nmapcmd('<leader>i4', 'LoremIpsum 400')
nmapcmd('<leader>i5', 'LoremIpsum 500')
nmapcmd('<leader>i6', 'LoremIpsum 600')
nmapcmd('<leader>i7', 'LoremIpsum 700')
nmapcmd('<leader>i7', 'LoremIpsum 700')
nmapcmd('<leader>i7', 'LoremIpsum 700')
nmapcmd('<leader>i8', 'LoremIpsum 800')
nmapcmd('<leader>i9', 'LoremIpsum 900')

-- insert line in normal mode
nmap('<C-m>', 'o<ESC>')
nmap('<C-n>', 'O<ESC>')

-- check health
nmapcmd('<leader>h', 'checkhealth')

-- neorg
nmapcmd('<leader>oc', 'Neorg toggle-concealer')
nmapcmd('<leader>on', 'Neorg workspace notes')

-- display startup
nmapcmd('<leader>d', 'Startup display')

-- D deletes line contents
nmap('D', '0d$')

-- move lines up and down in visual mode
vmap('J', ":m '>+1<CR>gv=gv")
vmap('K', ":m '<-2<CR>gv=gv")

-- indent and unindent in visual mode
vmap("H", "<gv")
vmap("L", ">gv")

-- undo tree
nmapcmd('<leader>u', 'UndotreeToggle')

-- set working directory
mapcmd('n', '<leader>p', 'cd %:p:h', {noremap = true})
mapcmd('n', '<leader>q', 'q', {noremap = true})

-- delete current buffer
nmapcmd('<leader>bq', 'bd')
