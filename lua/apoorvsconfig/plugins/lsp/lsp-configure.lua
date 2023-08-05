local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
    return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
    return
end

local remap = vim.keymap.set
vim.g.mapleader = " "

--enables keybinds for available lsp server
local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr}

    --setting keybinds
    remap("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
    remap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    remap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
    remap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    remap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
    remap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
    remap("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
    remap("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
    remap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
    remap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
    remap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
    remap("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)
end


--used to enable autocompletion for each lsp severs we have
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig["html"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})

lspconfig["clangd"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})

lspconfig["pyright"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})

lspconfig["dockerls"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})

lspconfig["jsonls"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})

lspconfig["cssls"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})

lspconfig["pylsp"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})

lspconfig["rust_analyzer"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})

lspconfig["tailwindcss"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})

lspconfig["tsserver"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})

lspconfig["eslint"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})

lspconfig["yamlls"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})

-- lspconfig["lua_ls"].setup({
--     capabilities = capabilities,
--     on_attach = on_attach,
--     settings = {
--         Lua = {
--             --make language server recognise vim global
--             diagnostics = {
--                 globals = { "vim" },
--             },
--             workspace = {
--                 --make language server aware of runtime files
--                 [vim.fn.expand("$VIMRUNTIME/lua")] = true,
--                 [vim.fn.stdpath("config") .. "/lua"] = true,
--             },
--         },
--     }
-- })


