return{
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd('colorscheme catppuccin')
		end
	},
	{
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	},
	{
		'lukas-reineke/indent-blankline.nvim',
        event = "VeryLazy",
        config = function()
            require("ibl").setup({
                scope = {
                    show_start = false,
                    show_end = false,
                }
            })
        end
	},
	{
		'nvim-lua/plenary.nvim' ,
	}, 
	{
		'mbbill/undotree'
	},
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.4',
		dependencies = { { 'nvim-lua/plenary.nvim' } },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
            vim.keymap.set('n','<leader>ft', function()
                builtin.grep_string({ search = vim.fn.input("Grep > ")});
                end
            )
            local telescope = require('telescope');
            telescope.setup();
        end,
	},
    {
	'tpope/vim-fugitive',
}
}

