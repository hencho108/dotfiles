-- Set lualine as statusline
return {
    'nvim-lualine/lualine.nvim',
    config = function()
        -- get lualine theme
        local lualine_theme = require 'lualine.themes.onedark'

        -- Adapted from: https://github.com/nvim-lualine/lualine.nvim/blob/master/lua/lualine/themes/onedark.lua
        local colors = {
            blue = '#61afef',
            green = '#98c379',
            purple = '#c678dd',
            cyan = '#56b6c2',
            red1 = '#e06c75',
            red2 = '#be5046',
            yellow = '#e5c07b',
            fg = '#abb2bf',
            bg = '#282c34',
            gray1 = '#828997',
            gray2 = '#2c323c',
            gray3 = '#3e4452',
        }

        local custom_theme = {
            normal = {
                a = { fg = colors.bg, bg = colors.green, gui = 'bold' },
                b = { fg = colors.fg, bg = colors.gray3 },
                c = { fg = colors.fg, bg = colors.gray2 },
            },
            command = { a = { fg = colors.bg, bg = colors.yellow, gui = 'bold' } },
            insert = { a = { fg = colors.bg, bg = colors.blue, gui = 'bold' } },
            visual = { a = { fg = colors.bg, bg = colors.purple, gui = 'bold' } },
            terminal = { a = { fg = colors.bg, bg = colors.cyan, gui = 'bold' } },
            replace = { a = { fg = colors.bg, bg = colors.red1, gui = 'bold' } },
            inactive = {
                a = { fg = colors.gray1, bg = colors.bg, gui = 'bold' },
                b = { fg = colors.gray1, bg = colors.bg },
                c = { fg = colors.gray1, bg = colors.gray2 },
            },
        }

        local hide_in_width = function()
            return vim.fn.winwidth(0) > 80
        end

        local diagnostics = {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            sections = { 'error', 'warn' },
            symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
            colored = false,
            update_in_insert = false,
            always_visible = true,
        }

        local diff = {
            'diff',
            colored = false,
            symbols = { added = ' ', modified = ' ', removed = ' ' }, -- changes diff symbols
            cond = hide_in_width,
        }
        require('lualine').setup {
            options = {
                icons_enabled = true,
                -- theme = lualine_theme, -- can be set to "auto"
                theme = custom_theme,
                section_separators = { left = '', right = '' },
                component_separators = { left = '', right = '' },
                disabled_filetypes = { 'alpha', 'dashboard', 'NvimTree', 'Outline' },
                always_divide_middle = true,
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch' },
                lualine_c = {
                    {
                        'filename',
                        file_status = true, -- displays file status (readonly status, modified status)
                        path = 0,           -- 0 = just filename, 1 = relative path, 2 = absolute path
                    },
                },
                lualine_x = { diagnostics, 'encoding', 'filetype' },
                lualine_y = { 'location' },
                lualine_z = { 'progress' },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {
                    {
                        'filename',
                        file_status = true, -- displays file status (readonly status, modified status)
                        path = 1,           -- 0 = just filename, 1 = relative path, 2 = absolute path
                    },
                },
                lualine_x = { { 'location', padding = 0 } },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            extensions = { 'fugitive' },
        }
    end,
}
