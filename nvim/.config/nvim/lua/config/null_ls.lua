local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  debug = true,
  temp_dir = "/tmp",
  sources = {
    formatting.black.with({ prefer_local = ".venv/bin" }),
    formatting.isort.with({ prefer_local = ".venv/bin" }),
    diagnostics.pyproject_flake8.with({ prefer_local = ".venv/bin" }),
    diagnostics.yamllint,
    diagnostics.pylint.with({ prefer_local = ".venv/bin" }),
    diagnostics.vulture.with({
      prefer_local = ".venv/bin",
      method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
    }),
    diagnostics.pydocstyle.with({
      prefer_local = ".venv/bin",
      method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
    }),
    diagnostics.mypy.with({ prefer_local = ".venv/bin" }),
    diagnostics.shellcheck.with({}),
    formatting.shfmt.with({ extra_args = { "-i", "2", "-ci" } }),
    formatting.stylua,
    formatting.prettier.with({
      filetypes = { "html", "json", "markdown", "toml" },
    }),
    formatting.yamlfmt.with({ filetypes = { "yaml" } }),
    code_actions.gitsigns,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})
