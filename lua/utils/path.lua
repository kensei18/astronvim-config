local M = {}

--- Checks if a given path is the home directory.
-- @param path The path to check.
-- @return True if the path is the home directory, false otherwise.
function M.is_home_directory(path) return path == vim.fn.expand "$HOME" end

--- Checks if any of a list of filenames exist in a given directory.
-- @param filenames The list of filenames to check for.
-- @param path The directory to check in.
-- @return True if any of the files exist in the directory, false otherwise.
function M.has_files_in(filenames, path)
  for _, filename in ipairs(filenames) do
    if vim.fn.filereadable(vim.fn.expand(path .. "/" .. filename)) == 1 then return true end
  end
  return false
end

--- Checks if any of a list of filenames exist in a given directory or any of its parent directories.
-- @param filenames The list of filenames to check for.
-- @param path The directory to start checking in.
-- @return True if any of the files exist in the directory or any of its parent directories, false otherwise.
function M.has_files(filenames, path)
  local root = vim.fn.expand(path)
  while not M.is_home_directory(root) do
    if M.has_files_in(filenames, root) then return true end
    root = vim.fn.fnamemodify(root, ":h")
  end
  return false
end

--- Returns the directory of the buffer.
-- @return The directory of the buffer.
function M.get_buf_directory(bufnr)
  local bufname = vim.api.nvim_buf_get_name(bufnr)
  return vim.fn.fnamemodify(bufname, ":h")
end

return M
