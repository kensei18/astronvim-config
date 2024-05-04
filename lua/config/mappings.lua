local astrocore = require "astrocore"
local astroui = require "astroui"
local todo_comment = require "todo-comments"
local telescope_builtin = require "telescope.builtin"

local cspell_command = require "config.commands.cspell"
local docker_command = require "config.commands.docker"
local github_command = require "config.commands.github"
local telescope_command = require "config.commands.telescope"

local function incrementFontSize()
  GuiFontName = GuiFontName + 1
  vim.opt.guifont = { GuiFontName, ":h" .. GuiFontSize }
end

local function decrementFontSize()
  GuiFontSize = GuiFontSize - 1
  vim.opt.guifont = { GuiFontName, ":h" .. GuiFontSize }
end

local maps = {
  -- first key is the mode
  n = {
    L = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
    H = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

    ["zg"] = { function() cspell_command.append() end },
    -- Leader * 2
    ["<leader><leader>"] = { name = "Next Menu" },

    -- save
    ["<leader>W"] = { ":wa<cr>", desc = "Save all" },

    -- quit
    ["<leader>Q"] = { ":qa<cr>", desc = "Quit all" },

    -- buffer
    ["<leader>bt"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bb"] = { ":Telescope buffers<cr>", desc = "Find buffers" },

    -- sessions
    ["<leader>r"] = { function() require("resession").load(nil, { dir = "dirsession" }) end, desc = "Load a session" },

    -- font size
    ["<leader>+"] = { incrementFontSize, desc = "Increment Font Size" },
    ["<leader>-"] = { decrementFontSize, desc = "Decrement Font Size" },

    -- easy motion
    ["<leader>s"] = { ":HopPatternMW<cr>", desc = "Go to word" },

    -- LSP
    ["<leader>lt"] = { ":LspRestart<cr>", desc = "Restart LSP" },

    -- todo-comments
    ["<leader>fT"] = { ":TodoTelescope<cr>", desc = "Find TODO" },
    ["]T"] = { todo_comment.jump_next, desc = "Next TODO" },
    ["[T"] = { todo_comment.jump_prev, desc = "Previous TODO" },

    -- neotest
    ["<leader><leader>t"] = { name = "Test" },
    ["<leader>T"] = { function() require("neotest").summary.toggle() end, desc = "Test summary" },
    ["<leader><leader>ts"] = { function() require("neotest").summary.toggle() end, desc = "Test summary" },
    ["<leader><leader>tt"] = {
      function()
        require("neotest").run.run()
        require("neotest").summary.open()
      end,
      desc = "Run nearest test",
    },
    ["<leader><leader>td"] = {
      function()
        require("neotest").run.run { strategy = "dap" }
        require("neotest").summary.open()
      end,
      desc = "Debug nearest test",
    },

    -- refactoring
    ["<leader><leader>r"] = { name = "Refactoring" },
    ["<leader><leader>ri"] = { ":Refactor inline_var<cr>", desc = "Inline var" },
    ["<leader><leader>rb"] = { ":Refactor extract_block ", desc = "Extract block" },
    ["<leader><leader>rf"] = { ":Refactor extract_block_to_file ", desc = "Extract block to file" },

    -- Markdown
    ["<leader><leader>m"] = { desc = "Markdown" },
    ["<leader><leader>mp"] = { ":MarkdownPreview<cr>", desc = "Markdown Preview" },
    ["<leader><leader>ms"] = { ":MarkdownPreviewStop<cr>", desc = "Stop Markdown Preview" },

    -- Octo
    ["<leader>gG"] = { ":Octo<cr>", desc = "Octo" },
    ["<leader>gR"] = { github_command.browse_repo, desc = "Open repo in browser" },

    -- open-browser-github
    ["<leader>go"] = { ":OpenGithubFile<cr><cr>", desc = "Open in Github" },
    ["<leader>gP"] = { ":OpenGithubPullReq<cr><cr>", desc = "Open Pull Request" },

    -- blame
    ["<leader>gb"] = { ":ToggleBlame virtual<cr>", desc = "Toggle virtual blame" },
    ["<leader>gB"] = { ":ToggleBlame window<cr>", desc = "Toggle window blame" },

    -- Telescope with search_dirs
    ["<leader>fd"] = { name = "With directories" },
    ["<leader>fdf"] = {
      function() telescope_command.with_search_dirs(telescope_builtin.find_files) end,
      desc = "Find files",
    },
    ["<leader>fdF"] = {
      function() telescope_command.with_search_dirs(telescope_builtin.find_files, { hidden = true, no_ignore = true }) end,
      desc = "Find all files",
    },
    ["<leader>fdw"] = {
      function() telescope_command.with_search_dirs(telescope_builtin.live_grep) end,
      desc = "Find words",
    },
    ["<leader>fdW"] = {
      function()
        telescope_command.with_search_dirs(telescope_builtin.live_grep, {
          additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
        })
      end,
      desc = "Find words in all files",
    },
  },
  x = {
    ["<leader>g"] = { desc = astroui.get_icon("Git", 1, true) .. "Git" },
    ["<leader><leader>"] = { name = "Next Menu" },

    -- refactoring
    ["<leader><leader>r"] = { name = "Refactoring" },
    ["<leader><leader>ri"] = { ":Refactor inline_var<cr>", desc = "Inline var" },
    ["<leader><leader>re"] = { ":Refactor extract ", desc = "Extract" },
    ["<leader><leader>rv"] = { ":Refactor extract_var ", desc = "Extract var" },
    ["<leader><leader>rf"] = { ":Refactor extract_to_file ", desc = "Extract to file" },

    -- open-browser-github
    ["<leader>go"] = { ":OpenGithubFile<cr><cr>", desc = "Open in Github" },
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
  maps.n["<leader>D"] = { docker_command.open_lazydocker, desc = "ToggleTerm lazydocker" }
end

if vim.fn.executable "lazygit" == 1 then
  maps.n["<leader>gg"] = {
    function() astrocore.toggle_term_cmd "lazygit" end,
    desc = "ToggleTerm lazygit",
  }
end

if vim.env.OPENAI_API_KEY ~= "" then
  local chatgptMaps = {
    ["<leader>a"] = { name = "ChatGPT" },
    ["<leader>aa"] = { ":ChatGPT<cr>", desc = "Chat" },
    ["<leader>ac"] = { ":ChatGPTCompleteCode<cr>", desc = "Complete Code" },
    ["<leader>ae"] = { ":ChatGPTEditWithInstructions<cr>", desc = "Edit with Instructions" },
    ["<leader>at"] = { ":ChatGPTActAs<cr>", desc = "Act as" },

    ["<leader>ar"] = { name = "Run" },
    ["<leader>ara"] = { ":ChatGPTRun add_tests<CR>", desc = "Add Tests" },
    ["<leader>ard"] = { ":ChatGPTRun docstring<CR>", desc = "Docstring" },
    ["<leader>are"] = { ":ChatGPTRun explain_code<CR>", desc = "Explain Code" },
    ["<leader>arf"] = { ":ChatGPTRun fix_bugs<CR>", desc = "Fix Bugs" },
    ["<leader>arg"] = { ":ChatGPTRun grammar_correction<CR>", desc = "Grammar Correction" },
    ["<leader>ark"] = { ":ChatGPTRun keywords<CR>", desc = "Keywords" },
    ["<leader>arl"] = { ":ChatGPTRun code_readability_analysis<CR>", desc = "Code Readability Analysis" },
    ["<leader>aro"] = { ":ChatGPTRun optimize_code<CR>", desc = "Optimize Code" },
    ["<leader>arr"] = { ":ChatGPTRun roxygen_edit<CR>", desc = "Roxygen Edit" },
    ["<leader>ars"] = { ":ChatGPTRun summarize<CR>", desc = "Summarize" },
    ["<leader>art"] = { ":ChatGPTRun translate<CR>", desc = "Translate" },
  }

  for k, v in pairs(chatgptMaps) do
    maps.n[k] = v
    maps.x[k] = v
  end
end

return maps
