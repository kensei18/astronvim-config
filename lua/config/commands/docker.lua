local utils = require "astrocore"

local M = {}

function M.open_lazydocker()
  vim.ui.input({ prompt = "docker compose files", completion = "file" }, function(input)
    if input ~= nil and input ~= "" then
      local file_flag = ""
      for _, file in ipairs(vim.split(input, " ", { trimempty = true })) do
        file_flag = file_flag .. " -f " .. file
        utils.toggle_term_cmd("lazydocker " .. file_flag)
      end
    else
      utils.toggle_term_cmd "lazydocker"
    end
  end)
end

return M
