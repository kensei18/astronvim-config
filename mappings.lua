-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)

local function incrementFontSize()
  FontSize = FontSize + 1
  vim.opt.guifont = { FontName, ":h" .. FontSize }
end

local function decrementFontSize()
  FontSize = FontSize - 1
  vim.opt.guifont = { FontName, ":h" .. FontSize }
end

return {
  -- first key is the mode
  n = {
    -- Leader * 2
    ["<leader><leader>"] = { name = "Next Menu" },

    -- save
    ["<leader>W"] = { ":wa<cr>", desc = "Save all" },

    -- quit
    ["<leader>Q"] = { ":qa<cr>", desc = "Quit all" },

    -- buffer
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    ["<leader>b"] = { name = "Buffers" },

    -- sessions
    ["<leader>r"] = { ":SessionManager load_session<cr>", desc = "Load a session" },

    -- font size
    ["<leader>+"] = { incrementFontSize, desc = "Increment Font Size" },
    ["<leader>-"] = { decrementFontSize, desc = "Decrement Font Size" },

    -- easy motion
    ["<leader>s"] = { ":HopPattern<cr>", desc = "Go to word" },

    -- LSP
    ["<leader>lL"] = { ":LspRestart<cr>", desc = "Restart LSP" },

    -- todo-comments
    ["<leader>fT"] = { ":TodoTelescope<cr>", desc = "Find TODO" },
    ["]o"] = { require("todo-comments").jump_next, desc = "Next TODO" },
    ["[o"] = { require("todo-comments").jump_prev, desc = "Previous TODO" },

    -- neotest
    ["<leader><leader>t"] = { name = "Test" },
    ["<leader><leader>ts"] = { require("neotest").summary.toggle, desc = "Test summary" },
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

    -- Github
    -- ["<leader>G"] = { name = " Github" },
    -- ["<leader>Gh"] = { name = "HELP" },
    -- ["<leader>Ghi"] = { ":help octo-commands-issue<cr>", desc = "Issue" },
    -- ["<leader>Ghp"] = { ":help octo-commands-pr<cr>", desc = "Pull Request" },
    -- ["<leader>Gi"] = { ":Octo issue ", desc = " Issue" },
    -- ["<leader>Gib"] = { ":Octo issue browser<cr>", desc = "Open in browser" },
    -- ["<leader>Gic"] = { ":Octo issue create<cr>", desc = "Create" },
    -- ["<leader>Gie"] = { ":Octo issue edit<cr>", desc = "Create" },
    -- ["<leader>Gil"] = { ":Octo issue list<cr>", desc = "List" },
    -- ["<leader>Gir"] = { ":Octo issue reload<cr>", desc = "Reload" },
    -- ["<leader>Gp"] = { ":Octo pr ", desc = " Pull Request" },
    -- ["<leader>Gpb"] = { ":Octo pr browser<cr>", desc = "Open in browser" },
    -- ["<leader>Gpc"] = { ":Octo pr create<cr>", desc = "Create" },
    -- ["<leader>GpC"] = { ":Octo pr close<cr>", desc = "Close" },
    -- ["<leader>Gpl"] = { ":Octo pr list<cr>", desc = "List" },
  },
  x = {
    ["<leader><leader>"] = { name = "Next Menu" },

    -- refactoring
    ["<leader><leader>r"] = { name = "Refactoring" },
    ["<leader><leader>ri"] = { ":Refactor inline_var<cr>", desc = "Inline var" },
    ["<leader><leader>re"] = { ":Refactor extract ", desc = "Extract" },
    ["<leader><leader>rv"] = { ":Refactor extract_var ", desc = "Extract var" },
    ["<leader><leader>rf"] = { ":Refactor extract_to_file ", desc = "Extract to file" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  i = {
    ["<C-p>"] = { function() vim.lsp.buf.signature_help() end, desc = "Signature Help" },
  },
}
