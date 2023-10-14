-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Load general options
require 'core.options'

-- Load general keymaps
require 'core.keymaps'

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
local env_var_nvim_theme = os.getenv('NVIM_THEME') or "onedark"

-- Define a table of theme modules
local themes = {
    onedark = 'plugins.theme.onedark',
    nord = 'plugins.theme.nord',
}

-- Setup plugins
require('lazy').setup({

    ---------------------------------------------
    -- Plugins that don't require configuration
    ---------------------------------------------

    -- git related plugins
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',

    -- detect tabstop and shiftwidth automatically
    -- 'tpope/vim-sleuth',

    -- tmux & split window navigation
    'christoomey/vim-tmux-navigator',

    -- high-performance color highlighter
    'norcalli/nvim-colorizer.lua',

    -- autoclose tags
    'windwp/nvim-ts-autotag',

    'norcalli/nvim-colorizer.lua',

    ---------------------------------------------
    -- Plugins that require configuration
    ---------------------------------------------

    require(themes[env_var_nvim_theme]),
    require 'plugins.lsp.nvim-lspconfig',
    require 'plugins.lsp.null-ls',
    require 'plugins.nvim-cmp',
    require 'plugins.gitsigns',
    require 'plugins.which-key',
    require 'plugins.lualine',
    require 'plugins.indent-blankline',
    require 'plugins.comment',
    require 'plugins.telescope',
    require 'plugins.nvim-treesitter',
    require 'plugins.debug',
    require 'plugins.nvim-tree',
    -- require 'plugins.neo-tree',
    require 'plugins.nvim-autopairs',
    require 'plugins.hop',
    require 'plugins.bufferline',
    -- require 'plugins.vim-dadbod',
}, {})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=4 sts=4 sw=4 et
