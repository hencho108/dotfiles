return {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    opts = {
        char = '▏',
        indentLine_enabled = 1,
        show_trailing_blankline_indent = false,
        indent_blankline_show_first_indent_level = true,
        indent_blankline_use_treesitter = true,
        indent_blankline_show_current_context = true,
        indent_blankline_filetype_exclude = {
            "help",
            "startify",
            "dashboard",
            "packer",
            "neogitstatus",
            "NvimTree",
            "Trouble",
        }
    },
}
