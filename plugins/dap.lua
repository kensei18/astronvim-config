return {
  {
    "leoluz/nvim-dap-go",
    event = "User AstroFile",
    config = function() require("dap-go").setup {} end,
  },
}
