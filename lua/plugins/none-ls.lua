---@type LazySpec
return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "davidmh/cspell.nvim",
    },
    opts = function(_, config)
      local null_ls = require "null-ls"
      local cspell = require "cspell"
      -- config variable is the default configuration table for the setup function call
      -- local null_ls = require "null-ls"

      -- Check supported formatters and linters
      -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      config.sources = {
        -- Set a formatter
        -- null_ls.builtins.formatting.stylua,
        cspell.diagnostics.with {
          diagnostics_postprocess = function(diagnostic) diagnostic.severity = vim.diagnostic.severity["INFO"] end,
          extra_args = { "--config", "~/.config/cspell/cspell.yaml" },
        },
      }

      return config -- return final config table
    end,
  },
}
