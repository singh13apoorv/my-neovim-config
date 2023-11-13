return {
	"nvimdev/lspsaga.nvim",
	lazy = false,
	config = function()
		require("lspsaga").setup({
			--keybindings to navigate in saga
			move_in_saga = {
				prev = "<S-Tab>",
				next = "<Tab>",
			},
			--use enter to open file with finder.
			finder_action_keys = {
				open = "<CR>",
			},
			--use enter to open file with definition preview
			definition_action_keys = {
				edit = "<CR>",
			},
		})
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- optional
		"nvim-tree/nvim-web-devicons", -- optional
	},
}
