return {
  {
    "folke/neodev.nvim",
    event = "VeryLazy",
    config = function() require("neodev").setup {} end,
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function() require("nvim-surround").setup {} end,
  },
  {
    "phaazon/hop.nvim",
    branch = "v2",
    event = "VeryLazy",
    config = function() require("hop").setup {} end,
  },
  {
    "iamcco/markdown-preview.nvim",
    event = "VeryLazy",
    config = function() vim.fn["mkdp#util#install"]() end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    config = function() require("todo-comments").setup {} end,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    event = "VeryLazy",
    config = function() require("refactoring").setup {} end,
  },
  {
    "max397574/colortils.nvim",
    cmd = "Colortils",
    event = "VeryLazy",
    config = function() require("colortils").setup {} end,
  },
  -- {
  --   "github/copilot.vim",
  --   event = "VeryLazy",
  --   config = function()
  --     vim.g.copilot_no_tab_map = true
  --     vim.api.nvim_set_keymap("i", "<C-l>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
  --     vim.api.nvim_set_keymap("i", "<C-j>", "<Plug>(copilot-next)", {})
  --     vim.api.nvim_set_keymap("i", "<C-k>", "<Plug>(copilot-previous)", {})
  --     vim.api.nvim_set_keymap("i", "<C-h>", "<Plug>(copilot-dismiss)", {})
  --     vim.api.nvim_set_keymap("i", "<C-i>", "<Plug>(copilot-suggest)", {})
  --   end,
  -- },
  {
    "tyru/open-browser-github.vim",
    dependencies = {
      "tyru/open-browser.vim",
    },
    event = "VeryLazy",
  },
  {
    "psliwka/vim-dirtytalk",
    event = "VeryLazy",
    build = ":DirtytalkUpdate",
  },
}
