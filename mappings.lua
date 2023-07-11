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
    -- buffer
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr)
            require("astronvim.utils.buffer").close(bufnr)
          end
        )
      end,
      desc = "Pick to close",
    },
    ["<leader>b"] = { name = "Buffers" },
    -- font size
    ["<leader>+"] = { incrementFontSize, desc = "Increment Font Size" },
    ["<leader>-"] = { decrementFontSize, desc = "Decrement Font Size" },
    -- easy motion
    ["<leader>s"] = { ":HopPattern<cr>", desc = "Go to word" },
    -- LSP
    ["<leader>lL"] = { ":LspRestart", desc = "Restart LSP" },
    ["<leader>lM"] = { desc = "Markdown" },
    ["<leader>lMp"] = { ":MarkdownPreview<cr>", desc = "Markdown Preview" },
    ["<leader>lMs"] = { ":MarkdownPreviewStop<cr>", desc = "Stop Markdown Preview" },
    -- todo-comments
    ["<leader>fT"] = { ":TodoTelescope<cr>", desc = "Find TODO" },
    ["]T"] = { require('todo-comments').jump_next, desc = "Next TODO" },
    ["[T"] = { require('todo-comments').jump_prev, desc = "Previous TODO" },
    -- Github
    ["<leader>G"] = { name = " Github" },
    ["<leader>Gh"] = { name = "HELP" },
    ["<leader>Ghi"] = { ":help octo-commands-issue<cr>", desc = "Issue" },
    ["<leader>Ghp"] = { ":help octo-commands-pr<cr>", desc = "Pull Request" },
    ["<leader>Gi"] = { ":Octo issue ", desc = " Issue" },
    -- ["<leader>Gib"] = { ":Octo issue browser<cr>", desc = "Open in browser" },
    -- ["<leader>Gic"] = { ":Octo issue create<cr>", desc = "Create" },
    -- ["<leader>Gie"] = { ":Octo issue edit<cr>", desc = "Create" },
    -- ["<leader>Gil"] = { ":Octo issue list<cr>", desc = "List" },
    -- ["<leader>Gir"] = { ":Octo issue reload<cr>", desc = "Reload" },
    ["<leader>Gp"] = { ":Octo pr ", desc = " Pull Request" },
    -- ["<leader>Gpb"] = { ":Octo pr browser<cr>", desc = "Open in browser" },
    -- ["<leader>Gpc"] = { ":Octo pr create<cr>", desc = "Create" },
    -- ["<leader>GpC"] = { ":Octo pr close<cr>", desc = "Close" },
    -- ["<leader>Gpl"] = { ":Octo pr list<cr>", desc = "List" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
