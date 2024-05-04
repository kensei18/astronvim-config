local M = {}

local dir = vim.fn.stdpath "config" .. "/lua/config/lsp"
for _, file in ipairs(vim.fn.readdir(dir)) do
  if file:match "%.lua$" and file ~= "init.lua" then
    local basename = file:gsub("%.lua$", "")
    M[basename] = require("config.lsp." .. basename)
  end
end

return M
