local on_attach = function(client, bufnr)
  -- Disable formatting so we can handle it in null-ls
  client.server_capabilities.documentFormattingProvider = false

  local opts = { noremap = true, silent = true }

  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "gD",
    "<cmd>lua vim.lsp.buf.declaration()<CR>",
    opts
  )
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "gd",
    "<cmd>lua vim.lsp.buf.definition()<CR>",
    opts
  )
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "K",
    "<cmd>lua vim.lsp.buf.hover()<CR>",
    opts
  )
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "gi",
    "<cmd>lua vim.lsp.buf.implementation()<CR>",
    opts
  )
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<C-k>",
    "<cmd>lua vim.lsp.buf.signature_help()<CR>",
    opts
  )
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<leader>wa",
    "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",
    opts
  )
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<leader>wr",
    "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",
    opts
  )
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<leader>wl",
    "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
    opts
  )
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<leader>td",
    "<cmd>lua vim.lsp.buf.type_definition()<CR>",
    opts
  )
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<leader>rn",
    "<cmd>lua vim.lsp.buf.rename()<CR>",
    opts
  )
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<leader>ca",
    "<cmd>lua vim.lsp.buf.code_action()<CR>",
    opts
  )
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "gr",
    "<cmd>lua vim.lsp.buf.references()<CR>",
    opts
  )
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<leader>fo",
    "<cmd>lua vim.lsp.buf.format()<CR>",
    opts
  )
end

local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_nvim_lsp.default_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

local opts = {
  on_attach = on_attach,
  capabilities = capabilities,
}

local lspconfig = require("lspconfig")
require("mason-lspconfig").setup_handlers({

  -- the first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name)
    lspconfig[server_name].setup(opts)
  end,

  -- dedicated handler for specific servers.
  ["jsonls"] = function()
    local settings = {
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    }
    lspconfig.jsonls.setup(vim.tbl_deep_extend("force", settings, opts))
  end,
  ["lua_ls"] = function()
    local settings = {
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
    lspconfig.lua_ls.setup(vim.tbl_deep_extend("force", settings, opts))
  end,
})
