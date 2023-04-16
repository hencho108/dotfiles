-- import null-ls plugin safely
local setup, null_ls = pcall(require, "null-ls")
if not setup then
  return
end

-- for conciseness
local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local sources = {
  formatting.prettier.with { filetypes = { "html", "json", "yaml", "markdown" } },
  formatting.stylua,
  formatting.black,
  formatting.isort,
  formatting.prettier,
  formatting.shfmt,
  diagnostics.eslint_d,
  diagnostics.shellcheck,
  diagnostics.flake8,
}

null_ls.setup {
  debug = true,
  sources = sources,
  -- format on save
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}