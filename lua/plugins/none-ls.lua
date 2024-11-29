-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize None-ls sources

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
      local sources = require "null-ls.sources"
      local pathutils = require "utils.path"
      -- config variable is the default configuration table for the setup function call
      -- local null_ls = require "null-ls"

      -- Check supported formatters and linters
      -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      config.sources = {
        -- Set a formatter
        -- null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettierd,
        cspell.diagnostics.with {
          diagnostics_postprocess = function(diagnostic) diagnostic.severity = vim.diagnostic.severity["INFO"] end,
          extra_args = { "--config", "~/.config/cspell/cspell.yaml" },
        },
      }

      config.should_attach = function(bufnr)
        local ft = vim.api.nvim_get_option_value("filetype", { buf = bufnr })
        for _, source in ipairs(sources.get_all()) do
          if sources.is_available(source, ft) then
            if source.name == "prettierd" then
              return pathutils.has_files({
                ".prettierrc",
                ".prettierrc.json",
                ".prettierrc.yaml",
                ".prettierrc.yml",
                ".prettierrc.js",
                ".prettierrc.cjs",
                "prettier.config.js",
              }, pathutils.get_buf_directory(bufnr))
            end

            return true
          end
        end
      end

      return config -- return final config table
    end,
  },
}
