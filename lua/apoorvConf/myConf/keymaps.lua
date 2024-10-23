local builtin_setup, builtin = pcall(require, "telescope.builtin")
if not builtin_setup then
    print "builtin in not working"
    return
end

local remap = vim.keymap.set

--setting up remap for nvim-tree
remap("n", "<leader>ee", ":NvimTreeToggle<CR>", { desc = "Toggles file tree." })
remap("n", "<leader>ef", ":NvimTreeFindFileToggle<CR>", { desc = "Toggle to the file you are working on." })
remap("n", "<leader>er", ":NvimTreeRefresh<CR>", { desc = "refreshes the tree." })

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
remap("n", "<leader>se", "<C-w>=") --makes split window equal
remap("n", "<leader>sx", ":close<CR>") --close current split window

--tab and tab group
remap("n", "<leader>to", ":tabnew<CR>") --creates new tab
remap("n", "<leader>tc", ":tabclose<CR>") --close current tab
remap("n", "<leader>tn", ":tabn<CR>") --to next tab
remap("n", "<leader>tp", ":tabp<CR>") --previous tab

--window maximizer tool
remap("n", "<leader>m", ":MaximizerToggle<CR>")

--telescope remap files
remap("n", "<leader>ff", builtin.find_files, { desc = "fuzzy find a file." })
remap("n", "<leader>fs", builtin.live_grep, { desc = "searches the whole repo for the word you type." })
remap("n", "<leader>gf", builtin.git_files, { desc = "searches git for the file you type." })
remap("n", "<leader>ss", builtin.grep_string, { desc = "finds anything which is open in the buffer." })
remap("n", "<leader>ntd", "<cmd>TodoTelescope<CR>", { desc = "find next to-do." })

--telescope remap git
-- remap("n", "<leader>gc", builtin.git_commits, {})
-- remap("n", "<leader>gbc", builtin.git_bcommits, {})
-- remap("n", "<leader>gb", builtin.git_branches, {})
-- remap("n", "<leader>gs", builtin.git_status, {})

--undotree remap
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

--clearing search history
remap("n", "<C-d>", ":nohlsearch<CR>")

-- set keybinds
remap("n", "gR", "<cmd>Telescope lsp_references<CR>", { desc = "Show LSP references" }) -- show definition, references

remap("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" }) -- go to declaration

remap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "Show LSP definitions" }) -- show lsp definitions

remap("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { desc = "Show LSP implementations" }) -- show lsp implementations

remap("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "Show LSP type definitions" }) -- show lsp type definitions

remap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "See available code actions" }) -- see available code actions, in visual mode will apply to selection

remap("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart rename" }) -- smart rename

remap("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = "Show buffer diagnostics" }) -- show  diagnostics for file

remap("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show line diagnostics" }) -- show diagnostics for line

remap("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" }) -- jump to previous diagnostic in buffer

remap("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" }) -- jump to next diagnostic in buffer

remap("n", "K", vim.lsp.buf.hover, { desc = "Show documentation for what is under cursor" }) -- show documentation for what is under cursor

remap("n", "<leader>rs", ":LspRestart<CR>", { desc = "Restart LSP" }) -- mapping to restart lsp if necessary
