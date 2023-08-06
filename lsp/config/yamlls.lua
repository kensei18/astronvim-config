return {
  settings = {
    yaml = {
      schemas = {
        ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
        ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
        ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose.*{yml,yaml}",
        ["https://unpkg.com/graphql-config/config-schema.json"] = ".graphqlrc.{yml,yaml}",
      },
    },
  },
}
