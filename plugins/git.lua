return {
  {
    "tyru/open-browser-github.vim",
    dependencies = {
      "tyru/open-browser.vim",
    },
    event = "VeryLazy",
  },
  {
    "FabijanZulj/blame.nvim",
    event = "VeryLazy",
    config = function() require("blame").setup {} end,
  },
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    event = "VeryLazy",
    config = function()
      require("octo").setup {
        enable_builtin = true,
      }
    end,
  },
}
