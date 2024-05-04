return {
  {
    "stevearc/resession.nvim",
    opts = function()
      local resession = require "resession"
      resession.add_hook("post_load", function() vim.cmd "Neotree dir=./" end)
    end,
  },
}
