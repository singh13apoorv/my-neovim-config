local config = function()
    require("nvim-treesitter.configs").setup({
        indent = {
            enable = true,
        },
        autotag = {
            enable = true,
        },
        ensure_installed = {
            "bash",
            "c",
            "cpp",
            "css",
            "dockerfile",
            "dot",
            "gitignore",
            "go",
            "html",
            "json",
            "json5",
            "javascript",
            "lua",
            "python",
            "rust",
            "markdown",
            "markdown_inline",
            "tsx",
            "typescript",
            "yaml",
        },
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = true,
        },
    })
end


return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    config = config
}
