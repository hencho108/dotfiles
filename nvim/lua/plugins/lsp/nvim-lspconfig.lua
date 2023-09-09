local configure_lsp = require('plugins.lsp.config-lsp').configure_lsp
local configure_autoformat = require('plugins.lsp.config-autoformat').configure_autoformat

return {
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',
    { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },
    'folke/neodev.nvim',
  },
  config = function()
    configure_lsp()
    configure_autoformat()
  end,
}
