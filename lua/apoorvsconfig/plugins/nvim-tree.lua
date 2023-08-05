local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
    return
end

--recommended settings from nvim-tree
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#a8a521]])

nvimtree.setup({
    renderer = {
        icons = {
            glyphs = {
                folder = {
                    arrow_closed = "",
                    arrow_open = "",
                },
            },
        },
    },
    
    actions = {
        open_file = {
            window_picker = {
                enable = false,
            },
        },
    },
})
