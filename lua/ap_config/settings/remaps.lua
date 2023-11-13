local builtin_setup, builtin = pcall(require, "telescope.builtin")
if not builtin_setup then
	print("builtin in not working")
	return
end

local remap = vim.keymap.set

--setting up remap for nvim-tree
remap("n", "<leader>tt", ":NvimTreeToggle<CR>")

--setting up J and K in visual mode to move the whole selected file up
--and down with foramtting in the if, for, while loops
remap("v", "J", ":m '>+1<CR>gv=gv")
remap("v", "K", ":m '<-2<CR>gv=gv")

--indentation
remap("v", "<", "<gv")
remap("v", ">", ">gv")

--using the clipboard to save the copied texts
remap("n", "<leader>y", '"+y')
remap("v", "<leader>y", '"+y')
remap("n", "<leader>Y", '"+Y')

--delete but don't copy in register
remap("n", "x", '"_x')

--window spliting
remap("n", "<leader>sv", "<C-w>v") --split window vertically
remap("n", "<leader>sh", "<C-w>s") --split window horizontally
remap("n", "<leader>ew", "<C-w>=") --makes split window equal
remap("n", "<leader>qw", ":close<CR>") --close current split window

--tab and tab group
remap("n", "<leader>to", ":tabnew<CR>") --creates new tab
remap("n", "<leader>tc", ":tabclose<CR>") --close current tab
remap("n", "<leader>nt", ":tabn<CR>") --to next tab
remap("n", "<leader>pt", ":tabp<CR>") --previous tab

--window maximizer tool
remap("n", "<leader>m", ":MaximizerToggle<CR>")

--telescope remap files
remap("n", "<leader>ff", builtin.find_files, {})
remap("n", "<leader>lg", builtin.live_grep, {})
remap("n", "<C-g>", builtin.git_files, {})
remap("n", "<leader>gs", builtin.grep_string, {})

--telescope remap git
remap("n", "<leader>lgc", builtin.git_commits, {})
remap("n", "<leader>lbc", builtin.git_bcommits, {})
remap("n", "<leader>lgb", builtin.git_branches, {})
remap("n", "<leader>lgs", builtin.git_status, {})

--telescope remap lsp
remap("n", "<leader>gd", builtin.lsp_definitions, {})

--telescoe buffer remap
remap("n", "<leader>fb", builtin.buffers, {})

--undotree remap
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

--clearing search history
remap("n", "<C-d>", ":nohlsearch<CR>")
