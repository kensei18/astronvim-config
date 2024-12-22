return {
  settings = {
    gopls = {
      staticcheck = true,
      gofumpt = true,
      buildFlags = { "-tags=integration,e2e,wireinject,tools" },
    },
  },
}
