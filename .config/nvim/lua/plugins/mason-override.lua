if true then
  return {}
end

return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = {
        "lua_ls",
        "tsserver",
        "jsonls",
        "yamlls",
        "bashls",
        "tailwindcss",
        "vtsls",
        "docker_compose_language_service",
        "dockerls",
        "eslint",
        "yamlls",
        "jsonls",
        "bashls",
        "ansiblels",
        "vtsls",
      }
      return opts
    end,
  },
}
