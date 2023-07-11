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
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
