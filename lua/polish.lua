-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

vim.cmd "language en_US.UTF-8"
vim.opt.nrformats:append { "alpha" }

vim.filetype.add {
  filename = {
    [".env"] = "sh",
    ["%.env%.[%w_.-]+"] = "sh",
    [".envrc"] = "sh",
  },
}

if vim.g.neovide then
  vim.g.neovide_input_use_logo = true

  vim.api.nvim_set_keymap("n", "<D-v>", "+p<CR>", { noremap = true, silent = true })
  -- vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })

  vim.api.nvim_set_keymap("i", "<D-v>", '<ESC>"+pa', { noremap = true, silent = true })
  vim.api.nvim_set_keymap("c", "<D-v>", "<C-r>+", { noremap = true })
  vim.api.nvim_set_keymap("v", "<D-v>", '"+P', { noremap = true, silent = true })
  vim.api.nvim_set_keymap("t", "<D-v>", '<C-\\><C-n>"+Pi', { noremap = true, silent = true })

  vim.api.nvim_set_keymap("t", "<S-Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

  vim.api.nvim_set_keymap("n", "<D-n>", ':silent execute "!neovide"<CR>', { noremap = true, silent = true })
end

-- for autoread
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})
