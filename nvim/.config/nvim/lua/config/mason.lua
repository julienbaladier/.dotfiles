require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "pyright",
    "bashls",
    "ltex",
    "dockerls",
    "lua_ls",
    "jsonls",
    "yamlls",
    "marksman",
  },
})
