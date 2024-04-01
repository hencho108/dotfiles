-- Fuzzy Finder (files, lsp, etc)
return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    'nvim-telescope/telescope-ui-select.nvim',

    -- Useful for getting pretty icons, but requires a Nerd Font.
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ['<C-k>'] = require('telescope.actions').move_selection_previous, -- move to prev result
            ['<C-j>'] = require('telescope.actions').move_selection_next, -- move to next result
            ['<C-l>'] = require('telescope.actions').select_default, -- open file
          },
        },
      },
      pickers = {
        find_files = {
          file_ignore_patterns = { 'node_modules', '.git', '.venv' },
          hidden = true,
        },
      },
      live_grep = {
        file_ignore_patterns = { 'node_modules', '.git', '.venv' },
        additional_args = function(_)
          return { '--hidden' }
        end,
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    -- Enable telescope fzf native, if installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
    vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[S]earch existing [B]uffers' })
    vim.keymap.set('n', '<leader>sm', builtin.marks, { desc = '[S]earch [M]arks' })
    vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
    vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'Search [G]it [C]ommits' })
    vim.keymap.set('n', '<leader>gcf', builtin.git_bcommits, { desc = 'Search [G]it [C]ommits for current [F]ile' })
    vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = 'Search [G]it [B]ranches' })
    vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = 'Search [G]it [S]tatus (diff view)' })
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]resume' })
    vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[S]earch [/] in Open Files' })
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })
  end,
}
