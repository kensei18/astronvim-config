local M = {}

function M.with_search_dirs(f, opts)
  opts = opts == nil and {} or opts

  local on_confirm = function(input)
    local confirm_opts = {}

    if input ~= nil and input ~= "" then
      local dirs = {}
      for _, dir in ipairs(vim.split(input, " ", { trimempty = true })) do
        table.insert(dirs, dir)
      end
      confirm_opts = vim.tbl_extend("force", opts, { search_dirs = dirs })
    else
      local dir = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":h")
      confirm_opts = vim.tbl_extend("force", opts, { search_dirs = { dir } })
    end

    f(confirm_opts)
  end

  vim.ui.input({ prompt = "Directories", completion = "file" }, on_confirm)
end

function M.search_lsp_symbols()
  local builtin = require "telescope.builtin"
  local symbol_kinds = {
    ["all"] = "all",
    ["interface"] = "interface",
    ["struct"] = "struct",
    ["class/type"] = "class",
    ["function"] = "function",
    ["method"] = "method",
    ["variable"] = "variable",
    ["constant"] = "constant",
    ["field"] = "field",
    ["other"] = "other",
  }
  local symbol_keys =
    { "all", "interface", "struct", "class/type", "function", "method", "variable", "constant", "field", "other" }

  vim.ui.select(symbol_keys, { prompt = "Select symbol kinds" }, function(selected)
    if selected == "all" then
      builtin.lsp_dynamic_workspace_symbols()
    elseif selected == "other" then
      vim.ui.input(
        { prompt = "Enter symbol kind" },
        function(input) builtin.lsp_dynamic_workspace_symbols { symbols = input } end
      )
    elseif selected == "" or selected == nil then
      return
    else
      builtin.lsp_dynamic_workspace_symbols { symbols = symbol_kinds[selected] }
    end
  end)
end

return M
