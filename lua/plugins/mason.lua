-- Customize Mason plugins

---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "lua_ls",
        "ts_ls",
        "biome",
        "gopls",
        -- "golangci_lint_ls",
        "pyright",
        "jsonls",
        "yamlls",
        "dockerls",
        "docker_compose_language_service",
        "graphql",
        "terraformls",
        "tflint",
        "bashls",
        "sqls",
      })
    end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      local null_ls = require "null-ls"
      local path_utils = require "utils.path"

      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "prettierd",
        "stylua",
        "goimports",
        "cspell",
      })

      opts.handlers = {
        prettierd = function(source_name, methods)
          null_ls.register(null_ls.builtins.formatting.prettierd.with {
            condition = function(utils)
              return path_utils.has_files({
                ".prettierrc",
                ".prettierrc.json",
                ".prettierrc.yaml",
                ".prettierrc.yml",
                ".prettierrc.js",
                ".prettierrc.cjs",
                "prettier.config.js",
              }, vim.fn.getcwd())
            end,
          })
        end,
        biome = function(source_name, methods)
          null_ls.register(null_ls.builtins.formatting.biome.with {
            condition = function(utils)
              return path_utils.has_files({
                "biome.json",
                "biome.jsonc",
              }, vim.fn.getcwd())
            end,
          })
        end,
      }
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        -- "python",
      })
    end,
  },
}
