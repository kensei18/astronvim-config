return {
  root_dir = function(fname)
    return require("lspconfig.util").root_pattern(".golangci.yml", ".golangci.yaml", ".golangci.toml", ".golangci.json")(
      fname
    )
  end,
}
