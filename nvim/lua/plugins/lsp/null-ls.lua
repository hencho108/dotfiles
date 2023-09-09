-- Format on save
return {
  'jose-elias-alvarez/null-ls.nvim',
  commit = 'f8ffcd7',
  dependencies = {
    'jayp0521/mason-null-ls.nvim', -- bridges gap b/w mason & null-ls
    commit = '834bb5d',
  },
  config = function()
    local mason_null_ls_status, mason_null_ls = pcall(require, 'mason-null-ls')
    if not mason_null_ls_status then
      return
    end

    -- list of formatters & linters for mason to install
    mason_null_ls.setup {
      ensure_installed = {
        'prettier', -- ts/js formatter
        'stylua',   -- lua formatter
        'eslint_d', -- ts/js linter
        'isort',
        'flake8',
        'black',
        'shfmt',
        'shellcheck',
      },
      -- auto-install configured formatters & linters (with null-ls)
      automatic_installation = true,
    }

    local setup, null_ls = pcall(require, 'null-ls')
    if not setup then
      return
    end

    -- for conciseness
    local formatting = null_ls.builtins.formatting   -- to setup formatters
    local diagnostics = null_ls.builtins.diagnostics -- to setup linters

    -- to setup format on save
    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

    local sources = {
      formatting.prettier.with { filetypes = { 'html', 'json', 'yaml', 'markdown' } },
      formatting.stylua,
      formatting.black,
      formatting.isort.with { extra_args = { '--profile', 'black', '--multi-line', '3' } },
      formatting.prettier,
      formatting.shfmt,
      diagnostics.eslint_d,
      diagnostics.shellcheck,
      -- R - Refactoring-related checks: Enforces the use of snake_case naming convention.
      -- C - Convention-related checks: Ensures adherence to established coding standards.
      -- W0511: Disables the TODO warning.
      -- W1201, W1202: Disables log format warnings, which may be false positives.
      -- W0231: Disables the super-init-not-called warning as pylint may not comprehend six.with_metaclass(ABCMeta).
      -- W0707: Disables the raise-missing-from warning, which is incompatible with Python 2 backward compatibility.
      -- C0301: Disables the "line too long" warning, as the Black formatter automatically handles long lines.
      diagnostics.flake8.with {
        extra_args = {
          '--max-line-length=88',
          '--disable=R,duplicate-code,W0231,W0511,W1201,W1202,W0707,C0301,no-init',
        },
      },
      -- diagnostics.mypy.with({ extra_args = { "--ignore-missing-imports" } }),
    }

    null_ls.setup {
      debug = true,
      sources = sources,
      -- format on save
      on_attach = function(client, bufnr)
        if client.supports_method 'textDocument/formatting' then
          vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format { bufnr = bufnr }
            end,
          })
        end
      end,
    }
  end,
}
