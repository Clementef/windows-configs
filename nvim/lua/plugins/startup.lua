return {

    "startup-nvim/startup.nvim",
    requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
    lazy = false,
    priority = 1000,

    config = function()
      require("startup").setup(require("themes.spleenify"))
    end

}
