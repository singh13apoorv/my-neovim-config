local status, _ = pcall(vim.cmd, "colorscheme gruvbox")
if not status then
    print("Colorscheme not found!")
    return
end

-- setup must be called before loading the colorscheme
-- Default options:
require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "hard", -- can be "hard", "soft" or empty string
  palette_overrides = {
        cursor = "#79aa7d",
        -- neutral_green = "#78834b", 5e875e
        bright_green = "#78834b",
        bright_blue = "#567b58",
        dard_hard = "#232323",
        bright_purple = "#d7c383",
        bright_orange = "#b26c42",
        bright_red = "#c8a554"
  },
  overrides = {},
  dim_inactive = false,
  transparent_mode = true,
})
