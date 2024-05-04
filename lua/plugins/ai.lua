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
}
