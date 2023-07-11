return {
  {
    "folke/neodev.nvim",
    event = "VeryLazy",
    config = function()
      require("neodev").setup()
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end
  },
  {
    "phaazon/hop.nvim",
    branch = "v2",
    event = "VeryLazy",
    config = function()
      require('hop').setup()
    end
  },
  {
    "iamcco/markdown-preview.nvim",
    event = "VeryLazy",
    config = function()
      vim.fn["mkdp#util#install"]()
    end
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    config = function()
      require('todo-comments').setup()
    end
  },
  {
    "pwntester/octo.nvim",
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    event = "VeryLazy",
    config = function()
      require('octo').setup()
    end
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-go",
    },
    event = "VeryLazy",
    config = function()
      require('neotest').setup({
        adapters = {
          require("neotest-go")({
            -- run test without cache every time
            args = { "-count=1" }
          }),
        }
      })
    end
  }
}
