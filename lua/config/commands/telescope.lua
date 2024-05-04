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
    end

    f(confirm_opts)
  end

  vim.ui.input({ prompt = "Directories", completion = "file" }, on_confirm)
end

return M
