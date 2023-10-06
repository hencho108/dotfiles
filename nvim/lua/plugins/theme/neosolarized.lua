return {
    'svrana/neosolarized.nvim',
    dependencies = {
        'tjdevries/colorbuddy.nvim'
    },
    lazy = false,
    priority = 1000,
    config = function()
        local theme = require 'neosolarized'

        local config = {
            comment_italics = true,
            background_set = false
        }
        theme.setup(config)

        -- local cb = require('colorbuddy.init')
        -- local Color = cb.Color
        -- local colors = cb.colors
        -- local Group = cb.Group
        -- local groups = cb.groups
        -- local styles = cb.styles

        -- Color.new('white', '#ffffff')
        -- Color.new('black', '#000000')
        -- Group.new('Normal', colors.base1, colors.NONE, styles.NONE)
        -- Group.new('CursorLine', colors.none, colors.base03, styles.NONE, colors.base1)
        -- Group.new('CursorLineNr', colors.yellow, colors.black, styles.NONE, colors.base1)
        -- Group.new('Visual', colors.none, colors.base03, styles.reverse)
        -- Group.new('NormalFloat', colors.base1, colors.NONE, styles.NONE)

        -- local cError = groups.Error.fg
        -- local cInfo = groups.Information.fg
        -- local cWarn = groups.Warning.fg
        -- local cHint = groups.Hint.fg
        --
        -- Group.new("DiagnosticVirtualTextError", cError, cError:dark():dark():dark():dark(), styles.NONE)
        -- Group.new("DiagnosticVirtualTextInfo", cInfo, cInfo:dark():dark():dark(), styles.NONE)
        -- Group.new("DiagnosticVirtualTextWarn", cWarn, cWarn:dark():dark():dark(), styles.NONE)
        -- Group.new("DiagnosticVirtualTextHint", cHint, cHint:dark():dark():dark(), styles.NONE)
        -- Group.new("DiagnosticUnderlineError", colors.none, colors.none, styles.undercurl, cError)
        -- Group.new("DiagnosticUnderlineWarn", colors.none, colors.none, styles.undercurl, cWarn)
        -- Group.new("DiagnosticUnderlineInfo", colors.none, colors.none, styles.undercurl, cInfo)
        -- Group.new("DiagnosticUnderlineHint", colors.none, colors.none, styles.undercurl, cHint)
        --
        -- Group.new("HoverBorder", colors.yellow, colors.none, styles.NONE)
        --

        -- Make the background of diagnostics messages transparent
        local set_diagnostics_bg_transparency = function()
            vim.cmd [[highlight DiagnosticVirtualTextError guibg=none]]
            vim.cmd [[highlight DiagnosticVirtualTextWarn guibg=none]]
            vim.cmd [[highlight DiagnosticVirtualTextInfo guibg=none]]
            vim.cmd [[highlight DiagnosticVirtualTextHint guibg=none]]
        end
        set_diagnostics_bg_transparency()

        -- Toggle background transparency
        local toggle_transparency = function()
            config.background_set = not config.background_set
            theme.setup(config)
            set_diagnostics_bg_transparency()
        end
        vim.keymap.set('n', '<leader>tb', toggle_transparency, { noremap = true, silent = true })
    end
}
