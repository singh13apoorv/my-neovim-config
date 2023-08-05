local mark_status, mark = pcall(require, "harpoon.mark")
if not mark_status then
    return
end

local ui_status, ui = pcall(require, "harpoon.ui")
if not ui_status then
    return
end

local remap = vim.keymap.set
vim.g.mapleader = " "

remap("n", "<leader>a", mark.add_file)
remap("n", "<C-x>", ui.toggle_quick_menu)

remap("n", "<Tab>n", ui.nav_next)
remap("n", "<Tab>p", ui.nav_prev)
