return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
    priority = 1000,
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			renderer = {
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "󰁖",
							arrow_open = "󰁇",
							default = "",
							open = "󱧨",
							empty = "󰉖",
							empty_open = "󱧩",
						},
						git = {
							untracked = "",
						},
					},
					padding = " ",
				},
			},
			actions = {
				open_file = {
					quit_on_open = true,
					window_picker = {
						enable = false,
					},
				},
			},
		})
	end,
}
