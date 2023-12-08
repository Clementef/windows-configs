local user_bookmarks = vim.g.startup_bookmarks

local bookmark_texts = { "Bookmarks", "" }
local user_bookmark_mappings = {}

if not user_bookmarks then
    user_bookmarks = {}
    bookmark_texts = {}
end

for key, file in pairs(user_bookmarks) do
    bookmark_texts[#bookmark_texts + 1] = key .. " " .. file
end

for key, file in pairs(user_bookmarks) do
    user_bookmark_mappings[key] = "<cmd>e " .. file .. "<CR>"
end

local settings = {

    header = {
        type = "text",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "Header",
        margin = 5,
        content = {
            "Neovim"
        },
        highlight = "",
        default_color = "#50fa7b",
        oldfiles_amount = 0,
    },

    body = {
        type = "oldfiles",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "Oldfiles",
        margin = 5,
        content = "",
        highlight = "",
        default_color = "#bd93f9",
        oldfiles_amount = 10,
    },

    body_2 = {
        type = "oldfiles",
        oldfiles_directory = true,
        align = "center",
        fold_section = false,
        title = "",
        margin = 5,
        content = "",
        highlight = "",
        default_color = "#6272a4",
        oldfiles_amount = 5,
    },

    bookmarks = {
        type = "text",
        align = "center",
        margin = 5,
        content = bookmark_texts,
        highlight = "",
        default_color = "#f1fa8c",
    },

    options = {
        after = function()
            require("startup").create_mappings(user_bookmark_mappings)
            require("startup.utils").oldfiles_mappings()
        end,
        mapping_keys = true,
        cursor_column = 0.25,
        empty_line_between_mappings = false,
        disable_statuslines = true,
        paddings = { 1, 1, 1, 1 },
    },

    mappings = {
        execute_command = "<CR>",
        open_file = "o",
        open_file_split = "<c-o>",
        open_section = "<TAB>",
        open_help = "?",
    },

    parts = {"header", "bookmarks" , "body", "body_2"},

    colors = {
        background = "#282a36",
        folded_section = "#bd93f9",
    }

}

return settings
