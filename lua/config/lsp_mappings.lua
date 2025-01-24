local maps = {
  n = {
    gl = { function() vim.diagnostic.open_float() end, desc = "Hover diagnostics" },
    -- a `cond` key can provided as the string of a server capability to be required to attach, or a function with `client` and `bufnr` parameters from the `on_attach` that returns a boolean
    gD = { ":Lspsaga peek_definition<CR>", desc = "Definition Preview" },
    gI = { ":Lspsaga finder imp<CR>", desc = "Implementation Preview" },
    ["<Leader>uY"] = {
      function() require("astrolsp.toggles").buffer_semantic_tokens() end,
      desc = "Toggle LSP semantic highlight (buffer)",
      cond = function(client) return client.server_capabilities.semanticTokensProvider and vim.lsp.semantic_tokens end,
    },
    ["<Leader>lG"] = { require("config.commands.telescope").search_lsp_symbols, desc = "Search LSP Symbols" },
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
