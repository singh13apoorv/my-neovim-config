local mason_status, mason = pcall(require, "mason")
if not mason_status then
    return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
    return
end

mason.setup()

mason_lspconfig.setup({
    ensure_installed = {
        "tsserver",
        "html",
        "cssls",
        "tailwindcss",
        "sumneko_lua",
        "clangd",
        "dockerls",
        "docker_compose_language_service",
        "eslint",
        "golangci_lint_ls",
        "gopls",
        "jsonls",
        "lua_ls",
        "jedi_language_server",
        "pyre",
        "pyright",
        "pylyzer",
        "pylsp",
        "rust_analyzer",
    }
})
