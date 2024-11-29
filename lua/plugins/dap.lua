---@type LazySpec
return {
  {
    "leoluz/nvim-dap-go",
    event = "User AstroFile",
    config = function()
      require("dap-go").setup {
        delve = {
          path = "dlv",
          initialize_timeout_sec = 20,
          port = 2345,
          args = {},
          build_flags = "",
        },
        dap_configurations = {
          {
            type = "go",
            name = "Remote Attach",
            request = "attach",
            mode = "remote",
            port = 2345,
            host = "0.0.0.0",
            substitutepath = {
              {
                from = "${workspaceFolder}",
                to = "${env:REMOTE_DEBUG_PATH}",
              },
            },
          },
        },
      }
    end,
  },
  -- {
  --   "mxsdev/nvim-dap-vscode-js",
  --   dependencies = {
  --     {
  --       "microsoft/vscode-js-debug",
  --       build = "rm -rf out; git restore .; npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
  --       tag = "v1.82.0",
  --     },
  --   },
  --   event = "User AstroFile",
  --   config = function()
  --     require("dap-vscode-js").setup {
  --       -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  --       debugger_path = vim.fn.stdpath "data" .. "/lazy/vscode-js-debug", -- Path to vscode-js-debug installation.
  --       -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
  --       adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
  --     }
  --
  --     for _, language in ipairs { "typescript", "javascript" } do
  --       require("dap").configurations[language] = {
  --         {
  --           type = "pwa-node",
  --           request = "launch",
  --           name = "Launch file",
  --           program = "${file}",
  --           cwd = "${workspaceFolder}",
  --         },
  --         {
  --           type = "pwa-node",
  --           request = "attach",
  --           name = "Attach",
  --           processId = require("dap.utils").pick_process,
  --           cwd = "${workspaceFolder}",
  --         },
  --         {
  --           type = "pwa-node",
  --           request = "launch",
  --           name = "Debug Jest Tests",
  --           -- trace = true, -- include debugger info
  --           runtimeExecutable = "node",
  --           runtimeArgs = {
  --             "./node_modules/jest/bin/jest.js",
  --             "--runInBand",
  --             "${relativeFile}",
  --           },
  --           rootPath = "${workspaceFolder}",
  --           cwd = "${workspaceFolder}",
  --           console = "integratedTerminal",
  --           internalConsoleOptions = "neverOpen",
  --         },
  --       }
  --     end
  --   end,
  -- },
}
