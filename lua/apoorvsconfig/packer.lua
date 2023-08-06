local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

--autocommand that reloads neovim whenever there is some change.
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
    return
end

return packer.startup(function(use)
    use("wbthomason/packer.nvim")
    use { "ellisonleao/gruvbox.nvim" } --my prefered colorscheme
    use('christoomey/vim-tmux-navigator') --tmux & split window navigation
    use('szw/vim-maximizer') --maximize and restore current window
    use('numToStr/comment.nvim') --commenting with gc
    use('nvim-tree/nvim-tree.lua') --file explorer
    use('nvim-tree/nvim-web-devicons') --file explorer icon
    use('nvim-lualine/lualine.nvim') --statusline

    --fuzzy finder
    use({ "nvim-telescope/telescope-fzf-native.nvim", run="make" })
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    --autocompletion
    use('hrsh7th/nvim-cmp')
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/cmp-path')

    --snippets
    use('L3MON4D3/LuaSnip')
    use('saadparwaiz1/cmp_luasnip')
    use('rafamadriz/friendly-snippets')

    --managing & installing lsp servers
    use('williamboman/mason.nvim')
    use('williamboman/mason-lspconfig.nvim')

    --configure lsp servers
    use('neovim/nvim-lspconfig')
    use('hrsh7th/cmp-nvim-lsp')
    use('glepnir/lspsaga.nvim')
    use('onsails/lspkind.nvim')

    --git integration
    use("lewis6991/gitsigns.nvim")

    --treesitter integration
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')

    --auto closing and tagging
    use('windwp/nvim-autopairs')
    use('windwp/nvim-ts-autotag')

    --undotree
    use('mbbill/undotree')

    --floating terminal
    use('voldikss/vim-floaterm')

    --tab switcher (harpoon)
    use('ThePrimeagen/harpoon')

    if packer_bootstrap then
        require("packer").sync()
    end
end)







