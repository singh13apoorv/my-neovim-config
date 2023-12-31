local config = function()
	local theme = require("lualine.themes.gruvbox")

	require("lualine").setup({
		options = {
			theme = theme,
			globalstatus = true,
		},
		sections = {
			lualine_a = {
				{
					"buffers",
				},
			},
		},
	})
end

return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	config = config,
}
