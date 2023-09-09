return {
  "ishan9299/nvim-solarized-lua",
  lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "solarized",
      callback = function()
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.api.nvim_set_hl(0, "LineNr", { fg = "#586e75", bg = "none" })
        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#b58900", bg = "none" })
        vim.api.nvim_set_hl(0, "CursorLine", { fg = "none", bg = "#002b36" })
        vim.api.nvim_set_hl(0, "Visual", { fg = "#002b36", bg = "#586e75" })
        vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#dc322f", bg = "#360909" })
        vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = "#b58900", bg = "#1c1500" })
        vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = "#268bd2", bg = "#0e3550" })
        vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = "#2aa198", bg = "#0a2725" })
        vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#268bd2", bg = "none" })
        vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#2aa198", bg = "none" })
        vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#586e75" })
        vim.api.nvim_set_hl(0, "LazyButton", { link = "Visual" })
        vim.api.nvim_set_hl(0, "LazyButtonActive", { link = "IncSearch" })
        vim.cmd("highlight GitSignsAdd guibg=none")
        vim.cmd("highlight GitSignsChange guibg=none")
        vim.cmd("highlight GitSignsDelete guibg=none")
      end,
      group = vim.api.nvim_create_augroup("FixSolarized", { clear = true }),
      desc = "Fix some highlight for solarized colorscheme",
    })

    -- temporory disable semantic tokens highlight,
    -- since ishan9299/nvim-solarized-lua not support it yet
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        client.server_capabilities.semanticTokensProvider = nil
      end,
    })

    vim.g.solarized_termtrans = 1
    vim.cmd.colorscheme 'solarized'

    -- Toggle background transparency
    local toggle_transparency = function()
      if vim.g.solarized_termtrans == 0 then
        vim.g.solarized_termtrans = 1
      else
        vim.g.solarized_termtrans = 0
      end
      vim.cmd.colorscheme 'solarized'
    end

    vim.keymap.set("n", "<leader>tb", toggle_transparency, { noremap = true, silent = true })
  end,
}
