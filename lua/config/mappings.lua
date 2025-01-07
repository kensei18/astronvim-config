local maps = {
  -- first key is the mode
  n = {
    L = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
    H = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

    ["<Leader>pr"] = { ":Lazy restore<cr>", desc = "Plugins Restore" },

    ["zg"] = { function() require("config.commands.cspell").append() end },
    -- Leader * 2
    ["<Leader><Leader>"] = { name = "Next Menu" },

    -- save
    ["<Leader>w"] = { ":wa<cr>", desc = "Save all" },

    -- quit
    ["<Leader>Q"] = { ":qa<cr>", desc = "Quit all" },

    -- telescope
    ["gr"] = { function() require("telescope.builtin").lsp_references() end, desc = "LSP References" },
    ["<Leader>lD"] = {
      function() require("telescope.builtin").diagnostics { severity_limit = vim.diagnostic.severity.WARN } end,
      desc = "Search Diagnostics",
    },

    -- buffer
    ["<Leader>bt"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<Leader>bb"] = { ":Telescope buffers<cr>", desc = "Find buffers" },

    -- sessions
    ["<Leader>r"] = { function() require("resession").load(nil, { dir = "dirsession" }) end, desc = "Load a session" },

    -- GUI font size
    ["<Leader>+"] = {
      function()
        GuiFontSize = GuiFontSize + 0.5
        vim.opt.guifont = { GuiFontName, ":h" .. GuiFontSize }
      end,
      desc = "Increment Font Size",
    },
    ["<Leader>="] = {
      function()
        GuiFontSize = GuiFontSize + 0.5
        vim.opt.guifont = { GuiFontName, ":h" .. GuiFontSize }
      end,
      desc = "Increment Font Size",
    },
    ["<Leader>-"] = {
      function()
        GuiFontSize = GuiFontSize - 0.5
        vim.opt.guifont = { GuiFontName, ":h" .. GuiFontSize }
      end,
      desc = "Decrement Font Size",
    },

    -- easy motion
    ["<Leader>s"] = { ":HopPatternMW<cr>", desc = "Go to word" },

    -- LSP
    ["<Leader>lt"] = { ":LspRestart<cr>", desc = "Restart LSP" },

    -- todo-comments
    ["<Leader>fT"] = { ":TodoTelescope<cr>", desc = "Find TODO" },
    ["]T"] = { function() require("todo-comments").jump_next() end, desc = "Next TODO" },
    ["[T"] = { function() require("todo-comments").jump_prev() end, desc = "Previous TODO" },

    -- neotest
    ["<Leader><Leader>t"] = { name = "Test" },
    ["<Leader>T"] = { function() require("neotest").summary.toggle() end, desc = "Test summary" },
    ["<Leader><Leader>ts"] = { function() require("neotest").summary.toggle() end, desc = "Test summary" },
    ["<Leader><Leader>tt"] = {
      function()
        require("neotest").run.run()
        require("neotest").summary.open()
      end,
      desc = "Run nearest test",
    },
    ["<Leader><Leader>td"] = {
      function()
        require("neotest").run.run { strategy = "dap" }
        require("neotest").summary.open()
      end,
      desc = "Debug nearest test",
    },

    -- refactoring
    ["<Leader><Leader>r"] = { name = "Refactoring" },
    ["<Leader><Leader>ri"] = { ":Refactor inline_var<cr>", desc = "Inline var" },
    ["<Leader><Leader>rb"] = { ":Refactor extract_block ", desc = "Extract block" },
    ["<Leader><Leader>rf"] = { ":Refactor extract_block_to_file ", desc = "Extract block to file" },

    -- diffview
    ["<Leader><Leader>v"] = {
      function()
        if next(require("diffview.lib").views) == nil then
          vim.ui.input({ prompt = "git-rev" }, function(input)
            if input ~= nil and input ~= "" then
              vim.cmd("DiffviewOpen " .. input)
            else
              vim.cmd "DiffviewOpen"
            end
          end)
        else
          vim.cmd "DiffviewClose"
        end
      end,
      desc = "Diffview",
    },

    -- Octo
    ["<Leader><Leader>g"] = { ":Octo<cr>", desc = "Octo" },
    ["<Leader>gR"] = { require("config.commands.github").browse_repo, desc = "Open repo in browser" },

    -- open-browser-github
    ["<Leader>go"] = { ":OpenGithubFile<cr><cr>", desc = "Open in Github" },
    ["<Leader>gP"] = { ":OpenGithubPullReq<cr><cr>", desc = "Open Pull Request" },
    ["<Leader>gB"] = { ":!gh browse<cr><cr>", desc = "Browse Github" },

    -- blame
    -- ["<Leader>gb"] = { ":BlameToggle virtual<cr>", desc = "Toggle virtual blame" },
    ["<Leader>gb"] = { ":BlameToggle window<cr>", desc = "Toggle blame" },

    -- Telescope with search_dirs
    ["<Leader>fd"] = { name = "With directories" },
    ["<Leader>fdf"] = {
      function() require("config.commands.telescope").with_search_dirs(require("telescope.builtin").find_files) end,
      desc = "Find files",
    },
    ["<Leader>fdF"] = {
      function()
        require("config.commands.telescope").with_search_dirs(
          require("telescope.builtin").find_files,
          { hidden = true, no_ignore = true }
        )
      end,
      desc = "Find all files",
    },
    ["<Leader>fdw"] = {
      function() require("config.commands.telescope").with_search_dirs(require("telescope.builtin").live_grep) end,
      desc = "Find words",
    },
    ["<Leader>fdW"] = {
      function()
        require("config.commands.telescope").with_search_dirs(require("telescope.builtin").live_grep, {
          additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
        })
      end,
      desc = "Find words in all files",
    },

    -- move
    ["<A-j>"] = { ":MoveLine(1)<CR>" },
    ["<A-k>"] = { ":MoveLine(-1)<CR>" },
    ["<A-h>"] = { ":MoveHChar(-1)<CR>" },
    ["<A-l>"] = { ":MoveHChar(1)<CR>" },

    -- goto-preview
    ["gp"] = { name = "Goto Preview" },
    ["gpd"] = { function() require("goto-preview").goto_preview_definition {} end, desc = "Goto Preview Definition" },
    ["gpI"] = {
      function() require("goto-preview").goto_preview_implementation {} end,
      desc = "Goto Preview Implementation",
    },
    ["gpt"] = {
      function() require("goto-preview").goto_preview_type_definition {} end,
      desc = "Goto Preview Type Definition",
    },
    ["gpr"] = { function() require("goto-preview").goto_preview_references() end, desc = "Goto Preview References" },
    ["gpD"] = {
      function() require("goto-preview").goto_preview_declaration {} end,
      desc = "Goto Preview Declaration",
    },
    ["gP"] = { function() require("goto-preview").close_all_win() end, desc = "Close all Goto Previews" },

    -- minimap
    ["<Leader>um"] = { function() require("codewindow").toggle_minimap() end, desc = "Toggle minimap" },
  },
  x = {
    ["<Leader>g"] = { desc = require("astroui").get_icon("Git", 1, true) .. "Git" },
    ["<Leader><Leader>"] = { name = "Next Menu" },

    -- refactoring
    ["<Leader><Leader>r"] = { name = "Refactoring" },
    ["<Leader><Leader>ri"] = { ":Refactor inline_var<cr>", desc = "Inline var" },
    ["<Leader><Leader>re"] = { ":Refactor extract ", desc = "Extract" },
    ["<Leader><Leader>rv"] = { ":Refactor extract_var ", desc = "Extract var" },
    ["<Leader><Leader>rf"] = { ":Refactor extract_to_file ", desc = "Extract to file" },

    -- open-browser-github
    ["<Leader>go"] = { ":OpenGithubFile<cr><cr>", desc = "Open in Github" },

    -- move
    ["<A-j>"] = { ":MoveBlock(1)<CR>" },
    ["<A-k>"] = { ":MoveBlock(-1)<CR>" },
    ["<A-h>"] = { ":MoveHBlock(-1)<CR>" },
    ["<A-l>"] = { ":MoveHBlock(1)<CR>" },

    -- diff with clipboard
    ["<Leader>c"] = {
      function() require("config.commands.diff").compare_to_clipboard() end,
      desc = "Diff from clipboard",
    },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  i = {
    ["<C-p>"] = { function() vim.lsp.buf.signature_help() end, desc = "Signature Help" },
    ["<C-o>"] = { "<ESC>o" },
    ["<C-i>"] = { "<ESC>O" },
  },
}

maps.n["<C-p>"] = { '"0p' }
maps.x["<C-p>"] = { '"0p' }

if vim.fn.executable "lazydocker" == 1 then
  maps.n["<Leader>D"] = { require("config.commands.docker").open_lazydocker, desc = "ToggleTerm lazydocker" }
end

if vim.fn.executable "lazygit" == 1 then
  maps.n["<Leader>gg"] = {
    function()
      require("astrocore").toggle_term_cmd {
        cmd = "lazygit",
        direction = "float",
        -- on_close = function() vim.api.nvim_command "bufdo edit" end,
      }
    end,
    desc = "ToggleTerm lazygit",
  }
end

local aiMaps = {
  ["<Leader>a"] = { name = "AI" },
}

for k, v in pairs(aiMaps) do
  maps.n[k] = v
  maps.x[k] = v
end

return maps
