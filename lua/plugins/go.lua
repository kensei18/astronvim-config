return {
  -- {
  --   "ray-x/go.nvim",
  --   dependencies = {
  --     "ray-x/guihua.lua",
  --     "neovim/nvim-lspconfig",
  --     "nvim-treesitter/nvim-treesitter",
  --     "nvimtools/none-ls.nvim",
  --   },
  --   event = { "CmdlineEnter" },
  --   ft = { "go", "gomod" },
  --   build = ':lua require("go.install").update_all_sync()',
  -- },
  {
    -- depends on `impl`:
    --  go install github.com/josharian/impl@latest
    "edolphin-ydf/goimpl.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function() require("telescope").load_extension "goimpl" end,
  },
}
