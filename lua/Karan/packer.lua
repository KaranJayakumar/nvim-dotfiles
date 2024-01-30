--> This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
    -- Packer can manage itself
use 'wbthomason/packer.nvim'

use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
}
use{
    'dstein64/vim-startuptime',
}
use {"lukas-reineke/indent-blankline.nvim"}
use { "catppuccin/nvim", as = "catppuccin",
    config = function()
        vim.cmd('colorscheme catppuccin')
    end
}

use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
    end
}

use ('tpope/vim-fugitive')

use ('mbbill/undotree')
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
}
use {
    'nvim-tree/nvim-tree.lua',
    requires = {
        'nvim-tree/nvim-web-devicons', -- optional
    },
}

use{
    'hrsh7th/cmp-path',
}

use{
    'saadparwaiz1/cmp_luasnip',
}
--Collection of Snippets for luasnip
use "rafamadriz/friendly-snippets"

use{
    'windwp/nvim-ts-autotag'
}
use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
        --- Uncomment these if you want to manage LSP servers from neovim
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},
        -- LSP Support
        {'neovim/nvim-lspconfig'},
        -- Autocompletion
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'L3MON4D3/LuaSnip'},
    }
}
end)
