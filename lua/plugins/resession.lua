return {
  {
    "stevearc/resession.nvim",
    opts = function()
      local resession = require "resession"
      resession.add_hook("post_load", function() vim.cmd "Neotree dir=./" end)
      resession.add_hook("pre_load", function()
        if vim.bo.filetype ~= "alpha" then resession.save(vim.fn.getcwd(), { dir = "dirsession" }) end
      end)
    end,
  },
}
