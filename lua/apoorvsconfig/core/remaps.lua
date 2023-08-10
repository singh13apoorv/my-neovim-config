--telescope remap
local builtin_setup, builtin = pcall(require, "telescope.builtin")
if not builtin_setup then
    print("builtin in not working")
    return
end

vim.g.mapleader = " "
local remap = vim.keymap.set

--setting the directory view command(:Ex to leaderdv)
remap("n", "<leader>dv", vim.cmd.Ex)

--clearing search history
remap("n", "<C-d>", ":nohlsearch<CR>")

--setting up J and K in visual mode to move the whole selected file up and down with foramtting in the if, for, while loops
remap("v", "J", ":m '>+1<CR>gv=gv")
remap("v", "K", ":m '<-2<CR>gv=gv")

--using the clipboard to save the copied texts
remap("n", "<leader>y", "\"+y")
remap("v", "<leader>y", "\"+y")
remap("n", "<leader>Y", "\"+Y")

--delete but don't copy in register
remap("n", "x", '"_x')

--window spliting
remap("n", "<leader>sv", "<C-w>v") --split window vertically
remap("n", "<leader>sh", "<C-w>s") --split window horizontally
remap("n", "<leader>ew", "<C-w>=") --makes split window equal
remap("n", "<leader>qw", ":close<CR>") --close current split window

--tab and tab group
remap("n", "<leader>to", ":tabnew<CR>") --creates new tab
remap("n", "<leader>te", ":tabclose<CR>") --close current tab
remap("n", "<leader>nt", ":tabn<CR>") --to next tab
remap("n", "<leader>pt", ":tabp<CR>") --previous tab

--telescope remap
remap("n", "<leader>ff", builtin.find_files, {})
remap("n", "<leader>gs", builtin.live_grep, {}) 
remap("n", "<C-g>", builtin.git_files, {})
remap("n", "<leader>fs", builtin.grep_string, {})

--window maximizer tool
remap("n", "<F5>", ":MaximizerToggle<CR>")

--nvimtreetoggle remap
remap("n", "<leader>tt", ":NvimTreeToggle<CR>")

--Treesitter playgroundtoggle
remap("n", "<leader>tsp", ":TSPlaygroundToggle<CR>")

--floating terminal
-- remap("n", "<C-x>", ":FloatermToggle<CR>")
