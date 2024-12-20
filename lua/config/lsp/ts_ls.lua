local commonSettings = {
  preferences = {
    importModuleSpecifier = "non-relative",
  },
  inlayHints = {
    includeInlayEnumMemberValueHints = true,
    includeInlayFunctionLikeReturnTypeHints = true,
    includeInlayFunctionParameterTypeHints = true,
    includeInlayParameterNameHints = "all",
    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
    includeInlayPropertyDeclarationTypeHints = true,
    includeInlayVariableTypeHints = true,
    includeInlayVariableTypeHintsWhenTypeMatchesName = false,
  },
  format = {
    insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = false,
  },
}

return {
  settings = {
    javascript = commonSettings,
    typescript = commonSettings,
  },
}
