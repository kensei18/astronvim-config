local M = {}

function M.append()
  local lnum = vim.fn.getcurpos()[2] - 1
  local col = vim.fn.getcurpos()[3]

  local diagnostics = vim.diagnostic.get(0, { lnum = lnum, severity = vim.diagnostic.severity.INFO })

  local word = ""
  local regex = "^Unknown word %((%w+)%)$"
  for _, v in pairs(diagnostics) do
    if v.source == "cspell" and v.col < col and col <= v.end_col and string.match(v.message, regex) then
      word = string.gsub(v.message, regex, "%1"):lower()
    end
  end

  if word == "" then return end
  print(word)

  local data_dir = ""
  local xdg_data_home = os.getenv "XDG_DATA_HOME"
  if xdg_data_home ~= nil and xdg_data_home ~= "" then
    data_dir = xdg_data_home
  else
    data_dir = "~/.local/share/"
  end
  io.popen("echo " .. word .. " >> " .. data_dir .. "/cspell/user.txt")
  vim.notify('"' .. word .. '" is appended to user dictionary', vim.log.levels.INFO)

  if vim.api.nvim_get_option_value("modifiable", {}) then
    vim.api.nvim_set_current_line(vim.api.nvim_get_current_line())
    vim.api.nvim_command "silent! undo"
  end
end

return M
