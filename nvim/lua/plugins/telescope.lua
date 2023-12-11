return {
    'nvim-telescope/telescope.nvim',
    event = "VeryLazy",
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local telescope = require('telescope')
        telescope.setup{
            extensions = {
                file_browser = {
                  theme = "dropdown",
                  -- disables netrw and use telescope-file-browser in its place
                  hijack_netrw = true,
                  -- mappings = {
                  --   ["i"] = {
                  --     -- your custom insert mode mappings
                  --   },
                  --   ["n"] = {
                  --     -- your custom normal mode mappings
                  --   },
                  -- },
                },
            },
        }
        telescope.load_extension("file_browser")
    end,
}
