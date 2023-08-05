local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
    return
end

treesitter.setup({
    highlight = {
        enable = true
    },
    indent = {
        enable = true
    },
    autotag = {
        enable = true
    },
    ensure_installed = {
        "gitignore",
        "yaml",
        "dockerfile",
        "css",
        "html",
        "vim",
        "javascript",
        "python",
        "json5",
        "typescript",
        "cpp",
        "rust",
        "c",
        "lua",
        "vimdoc",
        "query",
        "markdown",
        "bash",
        "tsx"
    },
    auto_install = true,
})
