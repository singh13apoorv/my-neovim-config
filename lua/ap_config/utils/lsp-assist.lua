local remap = vim.keymap.set
local M = {}
--enable keybinds only when lsp server is available
M.on_attach = function(client, bufnr)
	-- keybind options
	local opts = {
		noremap = true,
		silent = true,
		buffer = bufnr,
	}

	-- set bindings
	remap("n", "<leader>gd", "<cmd>Lspsaga goto_definition<CR>", opts)
	remap("n", "<leader>gD", "<cmd>Lspsaga peek_definition<CR>", opts)
	remap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
	remap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
	remap("n", "<leader>dl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
	remap("n", "<leader>dc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
	remap("n", "<leader>pd", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
	remap("n", "<leader>nd", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
	remap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)

	if client.name == "pyright" then
		remap("n", "<leader>oi", "<cmd>PyrightOrganizeImports<CR>", opts)
	end
end

return M
