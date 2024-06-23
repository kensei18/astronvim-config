---@type LazySpec
return {
  {
    "jackMort/ChatGPT.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    event = "VeryLazy",
    config = function() require("chatgpt").setup {} end,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup {
        panel = {
          enabled = true,
          auto_refresh = true,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<C-y>",
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 15,
          keymap = {
            accept = "<C-l>",
            next = "<C-j>",
            prev = "<C-k>",
            dismiss = "<C-h>",
          },
        },
        filetypes = { yaml = true },
      }
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    config = function()
      require("CopilotChat").setup {
        window = {
          layout = "float",
        },
      }
    end,
  },
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   event = { "InsertEnter", "LspAttach" },
  --   config = function() require("copilot_cmp").setup() end,
  -- },
  -- {
  --   "hrsh7th/nvim-cmp",
  --   opts = function(_, opts)
  --     local cmp = require "cmp"
  --
  --     opts.sources = vim.tbl_deep_extend(
  --       "force",
  --       opts.sources,
  --       cmp.config.sources {
  --         { name = "copilot" },
  --       }
  --     )
  --   end,
  -- },
  -- {
  --   "onsails/lspkind.nvim",
  --   opts = function(_, opts)
  --     opts.symbol_map = vim.tbl_deep_extend("force", opts.symbol_map, {
  --       Copilot = "",
  --     })
  --   end,
  -- },
}
