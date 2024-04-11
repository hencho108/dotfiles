require 'core.options'  -- Load general options
require 'core.keymaps'  -- Load general keymaps
require 'core.snippets' -- Custom code snippets

-- Install package manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Import color theme based on environment variable NVIM_THEME
local default_color_scheme = 'onedark'
local env_var_nvim_theme = os.getenv 'NVIM_THEME' or default_color_scheme

-- Define a table of theme modules
local themes = {
  onedark = 'plugins.themes.onedark',
  nord = 'plugins.themes.nord',
}

-- Setup plugins
require('lazy').setup({
  require(themes[env_var_nvim_theme]),
  require 'plugins.alpha',
  require 'plugins.fugitive',
  require 'plugins.rhubarb',
  require 'plugins.ts-autotag',
  require 'plugins.vim-tmux-navigator',
  require 'plugins.lsp',
  require 'plugins.autocompletion',
  require 'plugins.none-ls',
  require 'plugins.todo-comments',
  require 'plugins.sleuth',
  require 'plugins.gitsigns',
  require 'plugins.which-key',
  require 'plugins.lualine',
  require 'plugins.indent-blankline',
  require 'plugins.comment',
  require 'plugins.telescope',
  require 'plugins.treesitter',
  require 'plugins.debug',
  require 'plugins.neo-tree',
  require 'plugins.autopairs',
  require 'plugins.bufferline',
  require 'plugins.colorizer',
  require 'plugins.database',
}, {
  ui = {
    -- If you have a Nerd Font, set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
