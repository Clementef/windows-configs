return {
    "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = { },
    event = "VeryLazy",
    config = function()
      require("ibl").setup{
          scope = { enabled = true, char = "▎", show_start = false, show_end = false, highlight = { "Label" },},
          indent = { highlight = { "LineNr" }, char = "▎", smart_indent_cap = true}
      }
    end,
}
