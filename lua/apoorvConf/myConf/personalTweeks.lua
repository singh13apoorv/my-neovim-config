local opt = vim.opt --making this consise and reusable fure ref.

--line number and relative line number
opt.relativenumber = true
opt.number = true

--tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

--line wraping
opt.wrap = false

--search settings
opt.ignorecase = true
opt.smartcase = true

--cursor line
opt.cursorline = true

--appearence
opt.termguicolors = true
opt.background = "dark"

--split window
opt.splitright = true
opt.splitbelow = true

--for undotree
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

--making neovim fast
opt.updatetime = 50
