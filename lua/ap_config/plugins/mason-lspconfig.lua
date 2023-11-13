local opts = {
	ensure_installed = {
		"efm",
		"lua_ls",
		"clangd",
		"bashls",
		"cssls",
		"dockerls",
		"docker_compose_language_service",
		"eslint",
		"emmet_language_server",
		"html",
		"jsonls",
		"tsserver",
		"marksman",
		"pyright",
		"pylsp",
		"rust_analyzer",
		"yamlls",
	},
	automatic_installation = true,
}

return {
	"williamboman/mason-lspconfig.nvim",
	opts = opts,
	event = "BufReadPre",
	dependencies = "williamboman/mason.nvim",
}
