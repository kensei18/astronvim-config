return {
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
    "FabijanZulj/blame.nvim",
    event = "VeryLazy",
    config = function() require("blame").setup {} end,
  },
}
