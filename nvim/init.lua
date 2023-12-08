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

-- install plugins, leader necessary
vim.g.mapleader = ","
require("lazy").setup({
  'preservim/nerdtree',

  'Mofiqul/dracula.nvim',

  {
    'nvim-lualine/lualine.nvim',
    -- requires = { 'nvim-tree/nvim-web-devicons', 
    --               opt = true }
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  },

  {
    'numToStr/Comment.nvim',
    opts = {
        -- add any options here
    },
    lazy = false,
  },

  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = { } },

  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  {
    "folke/zen-mode.nvim",
    opts = {
      window = {
        backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
        -- height and width can be:
        -- * an absolute number of cells when > 1
        -- * a percentage of the width / height of the editor when <= 1
        -- * a function that returns the width or the height
        width = .5, -- width of the Zen window
        height = 1, -- height of the Zen window
        -- by default, no options are changed for the Zen window
        -- uncomment any of the options below, or add other vim.wo options you want to apply
        options = {
          -- signcolumn = "no", -- disable signcolumn
          -- number = false, -- disable number column
          -- relativenumber = false, -- disable relative numbers
          -- cursorline = false, -- disable cursorline
          -- cursorcolumn = false, -- disable cursor column
          -- foldcolumn = "0", -- disable fold column
          -- list = false, -- disable whitespace characters
        },
      }
    },

    plugins = {
      -- disable some global vim options (vim.o...)
      -- comment the lines to not apply the options
      options = {
        -- enabled = true,
        -- ruler = false, -- disables the ruler text in the cmd line area
        -- showcmd = false, -- disables the command in the last line of the screen
        -- you may turn on/off statusline in zen mode by setting 'laststatus' 
        -- statusline will be shown only if 'laststatus' == 3
        -- laststatus = 0, -- turn off the statusline in zen mode
      },
    },

  },

  { 'tpope/vim-repeat' },

  { 'derektata/lorem.nvim' },

  {
      "startup-nvim/startup.nvim",
      requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
      -- config = function()
      --     require"startup".setup()
      -- end
  },

  {
    'ggandor/leap.nvim', 
    dependencies = { 'tpope/vim-repeat' }
  },

	{
	  "folke/which-key.nvim",
	  event = "VeryLazy",
	  init = function()
	    vim.o.timeout = true
	    vim.o.timeoutlen = 300
	  end,
	  opts = {
	    -- your configuration comes here
	    -- or leave it empty to use the default settings
	    -- refer to the configuration section below
	  }
	},

  {'dstein64/vim-startuptime'},
  -- {'dkarter/bullets.vim'},

  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/notes",
              },
            },
          },
        },
      }
    end,
  },

})

-- plugin setup

vim.g.startup_bookmarks = {
  ["I"] = '~/Appdata/Local/nvim/init.lua',
  ["D"] = '~/Documents',
  ["N"] = '~/Documents/notes',
  ["H"] = '~/Documents/hugo',
  ["C"] = '~/Documents/C',
}

require("startup").setup({theme = "spleenify"})
require('which-key').setup()
require('Comment').setup()

-- lualine
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    section_separators = { left = '', right = '' },
    component_separators = { left = '|', right = '|' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },

    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    -- refresh = {
    --   statusline = 1000,
    --   tabline = 1000,
    --   winbar = 1000,
    -- }
  },

  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },

  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },

  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

-- nvim surround
require("nvim-surround").setup()

-- indent blanklines
require("ibl").setup{
    scope = { enabled = true, char = "▎", show_start = false, show_end = false, highlight = { "Label" },},
    indent = { highlight = { "LineNr" }, char = "▎", smart_indent_cap = true}
}

  -- leap
require('leap').add_default_mappings()

--treesitter
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "python", "html", "css"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")
  -- ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

-- set color scheme
vim.cmd.colorscheme('dracula')
local dracula = require("dracula")
dracula.setup({
  -- customize dracula color palette
  -- colors = {
  --   bg = "#282A36",
  --   fg = "#F8F8F2",
  --   selection = "#44475A",
  --   comment = "#6272A4",
  --   red = "#FF5555",
  --   orange = "#FFB86C",
  --   yellow = "#F1FA8C",
  --   green = "#50fa7b",
  --   purple = "#BD93F9",
  --   cyan = "#8BE9FD",
  --   pink = "#FF79C6",
  --   bright_red = "#FF6E6E",
  --   bright_green = "#69FF94",
  --   bright_yellow = "#FFFFA5",
  --   bright_blue = "#D6ACFF",
  --   bright_magenta = "#FF92DF",
  --   bright_cyan = "#A4FFFF",
  --   bright_white = "#FFFFFF",
  --   menu = "#21222C",
  --   visual = "#3E4452",
  --   gutter_fg = "#4B5263",
  --   nontext = "#3B4048",
  --   white = "#ABB2BF",
  --   black = "#191A21",
  -- },
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

-- keymap
nmap('<C-n>', ':NERDTreeToggle<CR>')
nmap('<C-f>', ':NERDTreeFind<CR>')
  -- nerdtree

nmap(' ', ':nohl<CR>')
nmap('<ESC>', ':nohl<CR>')
  -- remove highlights

nmap('<leader>r', ':!gcc % -o out.exe & out.exe <CR>')
  -- compile and run in C

nmap('<leader>e', ':cd %:p:h | !explorer .<CR>')
nmap('<leader>c', ':cd %:p:h | !start cmd.exe<CR>')
  -- change pwd to file's parent and open windows software.

nmap('<C-s>', ':w<CR>')
  -- save

nmap(';',':')
  -- rebind command

nmap('<C-a>','GVgg')
  -- select all

nmap('<C-h>','<C-w>h')
nmap('<C-j>','<C-w>j')
nmap('<C-k>','<C-w>k')
nmap('<C-l>','<C-w>l')
  -- split navigation

nmap('<leader>s', '<C-w>v')
nmap('<leader>S', '<C-w>s')
  -- create splits

nmap('<C-u>', '<C-w><')
nmap('<C-i>', '<C-w>+')
nmap('<C-o>', '<C-w>-')
nmap('<C-p>', '<C-w>>')
  -- resize splits

local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope.help_tags, {})
  -- telescope

nmap('<leader>l',':Lazy<CR>')
  -- Lazy

nmap('<C-z>',':ZenMode<CR>')
  -- Zen Mode

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
  -- Lorem

nmap('<C-b>', 'o<ESC>')
nmap('<C-g>', 'O<ESC>')
  -- insert line in normal mode

nmap('<leader>h', ':checkhealth<CR>')
  -- check health

nmap('<C-Up>', ':m -2<CR>')
nmap('<C-Down>', ':m +1<CR>')
  -- move lineskk

-- nmap('<C-z>', 'u')
  -- undo

-- vim.api.nvim_set_keymap('n','<C-m>', 'gcc', {})
-- vim.api.nvim_set_keymap('v','<C-m>', 'gc', {})
nmap('<C-]>', ':s/^/\t<CR>:nohl<CR>')
nmap('<C-[>', ':s/^\t/<CR>:nohl<CR>')
nmap('<C-c>', ':Neorg toggle-concealer<CR>')
