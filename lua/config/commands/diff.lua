local M = {}

function M.compare_to_clipboard()
  local filetype = vim.api.nvim_eval "&filetype"
  vim.cmd(string.format(
    [[
      execute "normal! \"xy"
      vsplit
      enew
      normal! P
      setlocal buftype=nowrite
      set filetype=%s
      diffthis
      execute "normal! \<C-w>h"
      enew
      set filetype=%s
      normal! "xP
      diffthis
    ]],
    filetype,
    filetype
  ))

  print(filetype)
end

return M
