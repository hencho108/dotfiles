-- Format on save and linters
return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'nvimtools/none-ls-extras.nvim',
  },
  config = function()
    local null_ls = require 'null-ls'
    local formatting = null_ls.builtins.formatting   -- to setup formatters
    local diagnostics = null_ls.builtins.diagnostics -- to setup linters

    local sources = {
      formatting.prettier.with { filetypes = { 'html', 'json', 'yaml', 'markdown' } },
      formatting.stylua,
      formatting.black,
      formatting.isort.with { extra_args = { '--profile', 'black', '--multi-line', '3' } },
      formatting.shfmt.with { args = { '-i', '4' } },
      diagnostics.checkmake,
      -- R - Refactoring-related checks: Enforces the use of snake_case naming convention.
      -- C - Convention-related checks: Ensures adherence to established coding standards.
      -- W0511: Disables the TODO warning.
      -- W1201, W1202: Disables log format warnings, which may be false positives.
      -- W0231: Disables the super-init-not-called warning as pylint may not comprehend six.with_metaclass(ABCMeta).
      -- W0707: Disables the raise-missing-from warning, which is incompatible with Python 2 backward compatibility.
      -- C0301: Disables the "line too long" warning, as the Black formatter automatically handles long lines.
      require('none-ls.diagnostics.flake8').with {
        extra_args = {
          '--max-line-length=88',
          '--ignore=R,duplicate-code,W0231,W0511,W1201,W1202,W0707,C0301,no-init',
        },
      },
    }

    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
    null_ls.setup {
      debug = true,
      sources = sources,
      -- you can reuse a shared lspconfig on_attach callback here
      on_attach = function(client, bufnr)
        if client.supports_method 'textDocument/formatting' then
          vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = augroup,
            buffer = bufnr,
            callback = function()
              -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
              -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
              vim.lsp.buf.format { async = false }
            end,
          })
        end
      end,
    }
  end,
}
