local M = {}

function M.browse_repo() vim.fn.system { "gh", "browse" } end

return M
