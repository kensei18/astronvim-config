return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-neotest/neotest-go",
    "nvim-neotest/neotest-jest",
  },
  event = "VeryLazy",
  config = function()
    require("neotest").setup {
      adapters = {
        require "neotest-go" {
          args = { "-count 1" },
        },
        require "neotest-jest" {},
      },
    }
  end,
}
