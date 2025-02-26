---@type LazySpec
return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "fredrikaverpil/neotest-golang",
      "nvim-neotest/neotest-jest",
      "thenbe/neotest-playwright",
    },
    event = "VeryLazy",
    config = function()
      local neotest_ns = vim.api.nvim_create_namespace "neotest"
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
            return message
          end,
        },
      }, neotest_ns)
      require("neotest").setup {
        adapters = {
          require "neotest-golang" {
            go_test_args = { "-count=1", "-tags=integration,e2e" },
            go_list_args = { "-tags=integration,e2e" },
            dap_go_opts = {
              delve = {
                build_flags = { "-tags=integration,e2e" },
              },
            },
          },
          require "neotest-jest" {},
          require("neotest-playwright").adapter {
            options = {
              persist_project_selection = true,
              enable_dynamic_test_discovery = true,
            },
          },
        },
      }
    end,
  },
}
