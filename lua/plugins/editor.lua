return {
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
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      local highlight = {
        "RainbowBlue",
        "RainbowYellow",
        "RainbowRed",
        "RainbowGreen",
        "RainbowOrange",
        "RainbowCyan",
        "RainbowViolet",
      }
      local hooks = require "ibl.hooks"
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
      end)

      vim.g.rainbow_delimiters = { highlight = highlight }
      require("ibl").setup {
        scope = {
          enabled = true,
          highlight = highlight,
          show_start = false,
          show_end = false,
        },
      }
      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
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
    "hat0uma/csvview.nvim",
    event = "BufEnter",
    ---@module "csvview"
    ---@type CsvView.Options
    opts = {
      parser = { comments = { "#", "//" } },
      keymaps = {
        -- Text objects for selecting fields
        textobject_field_inner = { "if", mode = { "o", "x" } },
        textobject_field_outer = { "af", mode = { "o", "x" } },
        -- Excel-like navigation:
        -- Use <Tab> and <S-Tab> to move horizontally between fields.
        -- Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
        -- Note: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
        jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
        jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
        jump_next_row = { "<Enter>", mode = { "n", "v" } },
        jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
      },
    },
    cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
  },
  {
    "fedepujol/move.nvim",
    event = "VeryLazy",
    config = function() require("move").setup {} end,
  },
  -- {
  --   "rmagatti/goto-preview",
  --   event = "BufEnter",
  --   config = function()
  --     require("goto-preview").setup {
  --       width = 150,
  --       height = 40,
  --       resizing_mappings = true,
  --     }
  --   end, -- necessary as per https://github.com/rmagatti/goto-preview/issues/88
  -- },
  {
    "gorbit99/codewindow.nvim",
    event = "BufEnter",
    config = function() require("codewindow").setup() end,
  },
  {
    "nvimdev/lspsaga.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons", -- optional
    },
    event = "BufEnter",
    config = function()
      require("lspsaga").setup {
        symbol_in_winbar = {
          hide_keyword = true,
        },
        outline = {
          win_width = 40,
          layout = "float",
        },
        definition = {
          width = 0.8,
        },
        finder = {
          max_height = 0.6,
          left_width = 0.2,
        },
        lightbulb = {
          enabled = false,
          sign = false,
          virtual_text = false,
          enable_in_insert = false,
        },
      }
    end,
  },
}
