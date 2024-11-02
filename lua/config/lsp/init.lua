local M = {}

local function deepMerge(t1, t2)
  local merged = {}

  for k, v in pairs(t1) do
    if type(v) == "table" and type(t2[k]) == "table" then
      merged[k] = deepMerge(v, t2[k])
    else
      merged[k] = v
    end
  end

  for k, v in pairs(t2) do
    if type(v) == "table" and type(t1[k]) == "table" then
      merged[k] = deepMerge(t1[k], v)
    else
      merged[k] = v
    end
  end

  return merged
end

local dir = vim.fn.stdpath "config" .. "/lua/config/lsp"
for _, file in ipairs(vim.fn.readdir(dir)) do
  if file:match "%.lua$" and file ~= "init.lua" and file ~= "_local.lua" then
    local basename = file:gsub("%.lua$", "")
    M[basename] = require("config.lsp." .. basename)
  end
end

if vim.fn.filereadable(dir .. "/_local.lua") == 1 then
  local local_config = require "config.lsp._local"
  -- Overwrite the default config with the local config
  for key, value in pairs(local_config) do
    local merged = deepMerge(M[key], value)
    M[key] = merged
  end
end

return M
