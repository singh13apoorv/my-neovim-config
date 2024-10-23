local config = function()
    local telescope = require "telescope"
    local actions = require "telescope.actions"

    telescope.setup {
        defaults = {
            path_display = { "smart" },
            mappings = {
                i = {
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,
                    ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                },
            },
        },
    }
    telescope.load_extension "fzf"
end

return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.x",
    -- or                              , branch = '0.1.x',
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
        "folke/todo-comments.nvim",
    },
    lazy = false,
    config = config,
}
