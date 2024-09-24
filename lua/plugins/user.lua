return {
  {
    "akinsho/toggleterm.nvim",
    opts = {
      direction = "float",
    },
  },
  {
    "folke/neodev.nvim",
    event = "VeryLazy",
    config = function()
      require("neodev").setup {
        library = { plugins = { "neotest" }, types = true },
      }
    end,
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
    "HiPhish/rainbow-delimiters.nvim",
    event = "VeryLazy",
    config = function()
      require("rainbow-delimiters.setup").setup {
        highlight = {
          "RainbowDelimiterViolet",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterRed",
          "RainbowDelimiterCyan",
        },
      }
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    event = "VeryLazy",
    config = function() vim.fn["mkdp#util#install"]() end,
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
  {
    "psliwka/vim-dirtytalk",
    event = "VeryLazy",
    build = ":DirtytalkUpdate",
  },
  {
    "cameron-wags/rainbow_csv.nvim",
    event = "VeryLazy",
    config = true,
    ft = {
      "csv",
      "tsv",
      "csv_semicolon",
      "csv_whitespace",
      "csv_pipe",
      "rfc_csv",
      "rfc_semicolon",
    },
    cmd = {
      "RainbowDelim",
      "RainbowDelimSimple",
      "RainbowDelimQuoted",
      "RainbowMultiDelim",
    },
  },
  {
    "klen/nvim-config-local",
    event = "VeryLazy",
    config = function()
      require("config-local").setup {
        -- Default options (optional)

        -- Config file patterns to load (lua supported)
        config_files = { ".nvim.lua", ".nvimrc", ".exrc" },

        -- Where the plugin keeps files data
        hashfile = vim.fn.stdpath "data" .. "/config-local",
        autocommands_create = true, -- Create autocommands (VimEnter, DirectoryChanged)
        commands_create = true, -- Create commands (ConfigLocalSource, ConfigLocalEdit, ConfigLocalTrust, ConfigLocalIgnore)
        silent = false, -- Disable plugin messages (Config loaded/ignored)
        lookup_parents = true, -- Lookup config files in parent directories
      }
    end,
  },
  {
    "fedepujol/move.nvim",
    event = "VeryLazy",
    config = function() require("move").setup {} end,
  },
  {
    "NoahTheDuke/vim-just",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    ft = { "just" },
    config = function()
      require("nvim-treesitter.configs").setup {
        highlight = {
          enable = true,
          disable = { "just" },
        },
      }
    end,
  },
  {
    "vinnymeller/swagger-preview.nvim",
    event = "VeryLazy",
    build = "npm install -g swagger-ui-watcher",
    config = function()
      require("swagger-preview").setup {
        port = 8003,
        host = "localhost",
      }
    end,
  },
  {
    "mikesmithgh/kitty-scrollback.nvim",
    enabled = true,
    lazy = true,
    cmd = { "KittyScrollbackGenerateKittens", "KittyScrollbackCheckHealth" },
    event = { "User KittyScrollbackLaunch" },
    -- version = '*', -- latest stable version, may have breaking changes if major version changed
    -- version = '^5.0.0', -- pin major version, include fixes and features that do not have breaking changes
    config = function() require("kitty-scrollback").setup() end,
  },
  {
    "rmagatti/goto-preview",
    event = "BufEnter",
    config = function()
      require("goto-preview").setup {
        width = 150,
        height = 40,
        resizing_mappings = true,
      }
    end, -- necessary as per https://github.com/rmagatti/goto-preview/issues/88
  },
}
