return {
    "mistricky/codesnap.nvim",
    lazy = "true",
    build = "make",
    cmd = "CodeSnapPreviewOn",
    config = function()
        require("codesnap").setup()
    end
}
