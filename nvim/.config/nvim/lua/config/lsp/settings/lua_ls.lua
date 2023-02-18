return {
  settings = {
    Lua = {
      diagnostics = {
        -- get the server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
        },
      },
    },
  },
}
