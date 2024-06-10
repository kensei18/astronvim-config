-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Treesitter

---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "lua",
        "vim",
        "go",
        "gomod",
        "gosum",
        "gotmpl",
        "python",
        "typescript",
        "json",
        "yaml",
        "toml",
        "html",
        "css",
        "make",
        "graphql",
        "terraform",
        "markdown",
        -- add more arguments for adding more treesitter parsers
      })
      -- opts.autotag = {
      --   enable = true,
      --   enable_rename = true,
      --   enable_close = true,
      --   enable_close_on_slash = false,
      -- }
      opts.incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          scope_incremental = "<CR>",
          node_incremental = "<TAB>",
          node_decremental = "<S-TAB>",
        },
      }
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup {
        opts = {
          enable_rename = true,
          enable_close = true,
          enable_close_on_slash = true,
        },
      }
    end,
  },
}
