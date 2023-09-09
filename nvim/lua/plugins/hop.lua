-- Lightning fast navigation
return {
  "phaazon/hop.nvim",
  branch = 'v2', -- optional but strongly recommended
  config = function()
    require('hop').setup()
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<leader><leader>b", "<cmd>HopWordBC<CR>", opts)
    vim.keymap.set("n", "<leader><leader>w", "<cmd>HopWordAC<CR>", opts)
    vim.keymap.set("n", "<leader><leader>j", "<cmd>HopLineAC<CR>", opts)
    vim.keymap.set("n", "<leader><leader>k", "<cmd>HopLineBC<CR>", opts)
    vim.keymap.set("n", "s", "<cmd>HopChar2CurrentLine<CR>", opts)
  end
}
