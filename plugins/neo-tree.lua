return {
  "nvim-neo-tree/neo-tree.nvim",
  config = function(_, opts)
    local neotree = require "neo-tree"
    local component_configs = opts["default_component_configs"]

    component_configs["file_size"] = { enabled = false }
    component_configs["type"] = { enabled = false }
    component_configs["last_modified"] = { enabled = false }
    component_configs["created"] = { enabled = false }

    neotree.setup(opts)
  end,
}
