local M = {}

--- Checks if a given path is the root directory.
--- @param path string The path to check.
--- @return boolean
function M.is_root_directory(path) return path == "/" end

--- Checks if a given path is the home directory.
--- @param path string The path to check.
--- @return boolean
function M.is_home_directory(path) return path == vim.fn.expand "$HOME" end

--- Checks if any of a list of filenames exist in a given directory.
--- @param filenames table The list of filenames to check for.
--- @param path string The directory to check in.
--- @return boolean
function M.has_files_in(filenames, path)
  for _, filename in ipairs(filenames) do
    if vim.fn.filereadable(vim.fn.expand(path .. "/" .. filename)) == 1 then return true end
  end
  return false
end

--- Checks if any of a list of filenames exist in a given directory or any of its parent directories.
--- @param filenames table The list of filenames to check for.
--- @param path string The directory to start checking in.
--- @return boolean
function M.has_files(filenames, path)
  local dir = vim.fn.expand(path)

  while not M.is_root_directory(dir) do
    if M.has_files_in(filenames, dir) then return true end

    tmp = vim.fn.fnamemodify(dir, ":h")
    if tmp == dir then break end
    dir = tmp
  end

  return false
end

--- Returns the directory of the buffer.
--- @return string
function M.get_buf_directory(bufnr)
  local bufname = vim.api.nvim_buf_get_name(bufnr)
  return vim.fn.fnamemodify(bufname, ":h")
end

return M
