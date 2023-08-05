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
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {
    cursor = "#79aa7d",
  },
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})
