return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
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
      require 'hop'.setup()
    end
  },
  {
    "TimUntersberger/neogit",
    dependencies = "nvim-lua/plenary.nvim",
    event = "VeryLazy",
    config = function()
      require('neogit').setup({
        kind = "split"
      })
    end
  }
}
