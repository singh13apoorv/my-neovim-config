local status, lualine = pcall(require, "lualine")
if not status then
    return
end

local lualine_gruvbox = require("lualine.themes.gruvbox")

local new_colors = {
    blue = "#549699",
    green = "#a8a521",
    yellow = "#dfa82a",
    red = "#d73925",
    black = "#000000",
}

lualine_gruvbox.normal.a.bg = new_colors.blue
lualine_gruvbox.insert.a.bg = new_colors.green
lualine_gruvbox.visual.a.bg = new_colors.yellow
lualine_gruvbox.command = {
    a = {
        gui = "bold",
        bg = new_colors.red,
        fg = new_colors.black,
    },
}

lualine.setup({
    options = {
        theme = lualine_gruvbox
    }
})
