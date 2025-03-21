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

    -- oil
    ["<Leader>o"] = { ":Oil<cr>", desc = "Oil file explorer" },

    -- buffer
    ["<Leader>bt"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    -- ["<Leader>bb"] = { ":Telescope buffers<cr>", desc = "Find buffers" },
    ["<Leader>s"] = { ":Telescope buffers<cr>", desc = "Find buffers" },
    ["<Leader><Leader>f"] = {
      function() require("buffer_manager.ui").toggle_quick_menu() end,
      desc = "Manage buffers",
    },

    -- sessions
    ["<Leader>r"] = { function() require("resession").load(nil, { dir = "dirsession" }) end, desc = "Load a session" },

    -- GUI font size
    ["<Leader>+"] = {
      function()
        GuiFontSize = GuiFontSize + 1
        vim.opt.guifont = { GuiFontName, ":h" .. GuiFontSize }
      end,
      desc = "Increment Font Size",
    },
    ["<Leader>="] = {
      function()
        GuiFontSize = GuiFontSize + 1
        vim.opt.guifont = { GuiFontName, ":h" .. GuiFontSize }
      end,
      desc = "Increment Font Size",
    },
    ["<Leader>-"] = {
      function()
        GuiFontSize = GuiFontSize - 1
        vim.opt.guifont = { GuiFontName, ":h" .. GuiFontSize }
      end,
      desc = "Decrement Font Size",
    },

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
    ["<C-S-j>"] = { ":MoveLine(1)<CR>" },
    ["<C-S-k>"] = { ":MoveLine(-1)<CR>" },
    ["<C-S-h>"] = { ":MoveHChar(-1)<CR>" },
    ["<C-S-l>"] = { ":MoveHChar(1)<CR>" },

    -- goto-preview / lspsaga
    -- ["gp"] = { name = "Goto Preview" },
    ["gd"] = { ":Lspsaga goto_definition<CR>", desc = "Goto Definition" },
    ["gD"] = { ":Lspsaga peek_definition<CR>", desc = "Definition Preview" },
    ["gR"] = { ":Lspsaga finder ref<CR>", desc = "References Preview" },
    ["<Leader>lS"] = { ":Lspsaga outline<CR>", desc = "Symbols outline" },
    -- ["gpt"] = { ":Lspsaga peek_type_definition<CR>", desc = "Goto Preview Type Definition" },
    -- ["gpD"] = {
    --   function() require("goto-preview").goto_preview_declaration {} end,
    --   desc = "Goto Preview Declaration",
    -- },
    -- ["gP"] = { function() require("goto-preview").close_all_win() end, desc = "Close all Goto Previews" },

    -- minimap
    ["<Leader>um"] = { function() require("codewindow").toggle_minimap() end, desc = "Toggle minimap" },

    -- no neck pain
    ["<Leader>n"] = { desc = "No neck pain" },
    ["<Leader>nn"] = { ":NoNeckPain<cr>", desc = "Toggle" },
    ["<Leader>nr"] = { ":NoNeckPainToggleRightSide<cr>", desc = "Toggle Right Side" },
    ["<Leader>nl"] = { ":NoNeckPainToggleLeftSide<cr>", desc = "Toggle Left Side" },
    ["<Leader>nu"] = { ":NoNeckPainWidthUp<cr>", desc = "Increase the width" },
    ["<Leader>nd"] = { ":NoNeckPainWidthDown<cr>", desc = "Decrease the width" },
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
    ["<C-S-j>"] = { ":MoveBlock(1)<CR>" },
    ["<C-S-k>"] = { ":MoveBlock(-1)<CR>" },
    ["<C-S-h>"] = { ":MoveHBlock(-1)<CR>" },
    ["<C-S-l>"] = { ":MoveHBlock(1)<CR>" },

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
