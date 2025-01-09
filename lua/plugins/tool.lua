---@type LazySpec
return {
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      opts.defaults.mappings.i["<D-v>"] = { "<C-r>+", type = "command" }
      return opts
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    opts = {
      direction = "float",
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    event = "VeryLazy",
    config = function() vim.fn["mkdp#util#install"]() end,
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
  -- {
  --   "mikesmithgh/kitty-scrollback.nvim",
  --   enabled = true,
  --   lazy = true,
  --   cmd = { "KittyScrollbackGenerateKittens", "KittyScrollbackCheckHealth" },
  --   event = { "User KittyScrollbackLaunch" },
  --   -- version = '*', -- latest stable version, may have breaking changes if major version changed
  --   -- version = '^5.0.0', -- pin major version, include fixes and features that do not have breaking changes
  --   config = function() require("kitty-scrollback").setup() end,
  -- },
  {
    "rest-nvim/rest.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    event = "VeryLazy",
    config = function()
      require("telescope").load_extension "rest"

      vim.g.rest_nvim = {}
    end,
  },
}
