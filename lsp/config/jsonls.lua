return {
  settings = {
    json = {
      schemas = {
        { fileMatch = { ".graphqlrc.json" }, url = "https://unpkg.com/graphql-config/config-schema.json" },
        { fileMatch = { "package.json" }, url = "https://json.schemastore.org/package.json" },
      },
    },
  },
}
