return {
  settings = {
    gopls = {
      staticcheck = true,
      gofumpt = false,
      buildFlags = { "-tags=integration,e2e,wireinject,tools" },
    },
  },
}
