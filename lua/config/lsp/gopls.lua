return {
  settings = {
    gopls = {
      staticcheck = true,
      gofumpt = false,
      buildFlags = { "-tags=integration,wireinject" },
    },
  },
}
