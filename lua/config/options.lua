return {
  -- Configure core features of AstroNvim
  features = {
    large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
    autopairs = true, -- enable autopairs at start
    cmp = true, -- enable completion at start
    diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
    highlighturl = true, -- highlight URLs at start
    notifications = true, -- enable notifications at start
  },
  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },
  -- vim options can be configured here
  options = {
    opt = { -- vim.opt.<key>
      relativenumber = true, -- sets vim.opt.relativenumber
      number = true, -- sets vim.opt.number
      scrolloff = 8,
      spell = false, -- sets vim.opt.spell
      spelloptions = { "camel" },
      spelllang = "en,cjk,programming",
      signcolumn = "auto", -- sets vim.opt.signcolumn to auto
      wrap = false, -- sets vim.opt.wrap
      autoread = true,
      guifont = { GuiFontName, ":h" .. GuiFontSize },
      swapfile = false,
    },
    g = { -- vim.g.<key>
      -- configure global vim variables (vim.g)
      -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
      -- This can be found in the `lua/lazy_setup.lua` file
    },
  },
  -- Mappings can be configured through AstroCore as well.
  -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
  mappings = require "config.mappings",
  sessions = {
    autosave = {
      last = false, -- auto save last session
      cwd = true, -- auto save session for each working directory
    },
  },
}
