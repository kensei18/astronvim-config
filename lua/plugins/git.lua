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
    config = function()
      require("blame").setup {
        date_format = "%Y-%m-%d",
      }
    end,
  },
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    event = "User AstroGitFile",
    config = function()
      require("octo").setup {
        enable_builtin = true,
        suppress_missing_scope = {
          projects_v2 = true,
        },
      }
    end,
  },
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    cmd = { "DiffviewOpen" },
    config = function() require("diffview").setup {} end,
  },
}
