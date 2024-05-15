local M = {}

function M.is_home_directory(path) return path == vim.fn.expand "$HOME" end

function M.has_files_in(filenames, path)
  for _, filename in ipairs(filenames) do
    if vim.fn.filereadable(vim.fn.expand(path .. "/" .. filename)) == 1 then return true end
  end
  return false
end

function M.has_files(filenames, path)
  local root = vim.fn.expand(path)
  while not M.is_home_directory(root) do
    if M.has_files_in(filenames, root) then return true end
    root = vim.fn.fnamemodify(root, ":h")
  end
  return false
end

function M.get_current_buf_directory()
  local bufname = vim.api.nvim_buf_get_name(0)
  return vim.fn.fnamemodify(bufname, ":h")
end

return M
