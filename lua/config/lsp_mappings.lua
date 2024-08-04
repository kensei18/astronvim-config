local maps = {
  n = {
    gl = { function() vim.diagnostic.open_float() end, desc = "Hover diagnostics" },
    -- a `cond` key can provided as the string of a server capability to be required to attach, or a function with `client` and `bufnr` parameters from the `on_attach` that returns a boolean
    gD = {
      function() vim.lsp.buf.declaration() end,
      desc = "Declaration of current symbol",
      cond = "textDocument/declaration",
    },
    ["<Leader>uY"] = {
      function() require("astrolsp.toggles").buffer_semantic_tokens() end,
      desc = "Toggle LSP semantic highlight (buffer)",
      cond = function(client) return client.server_capabilities.semanticTokensProvider and vim.lsp.semantic_tokens end,
    },
    ["<Leader>lG"] = {
      function()
        vim.ui.select({
          "all",
          "interface",
          "struct",
          "class",
          "function",
          "method",
          "variable",
          "constant",
          "field",
          "other",
        }, { prompt = "Select symbol kinds" }, function(selected)
          if selected == "all" then
            require("telescope.builtin").lsp_dynamic_workspace_symbols()
          elseif selected == "other" then
            vim.ui.input(
              { prompt = "Enter symbol kind" },
              function(input) require("telescope.builtin").lsp_dynamic_workspace_symbols { symbols = input } end
            )
          else
            require("telescope.builtin").lsp_dynamic_workspace_symbols { symbols = selected }
          end
        end)
      end,
      desc = "Search LSP Symbols",
    },
    ["<Leader>lg"] = { name = " Go" },
  },
}

if vim.fn.executable "impl" == 1 then
  maps.n["<Leader>lgi"] = {
    function() require("telescope").extensions.goimpl.goimpl {} end,
    desc = "goimpl",
  }
end

return maps
