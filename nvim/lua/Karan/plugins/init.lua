return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme "catppuccin-latte"
			vim.cmd([[
				highlight Normal guibg=NONE ctermbg=NONE
				highlight NormalNC guibg=NONE ctermbg=NONE
				highlight SignColumn guibg=NONE ctermbg=NONE
				highlight NormalFloat guibg=NONE ctermbg=NONE
				highlight TelescopeBorder guibg=NONE ctermbg=NONE
			]])
		end,
	},

	{
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	},
	{
		'nvim-lua/plenary.nvim',
	},
	{
		'mbbill/undotree'
	},
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { { 'nvim-lua/plenary.nvim' } },
		config = function()
			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
			vim.keymap.set('n', '<leader>fj', builtin.buffers, {})
			vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
			vim.keymap.set('n', '<leader>ft', function()
				builtin.grep_string({ search = vim.fn.input("Grep > ") });
			end
			)
			local telescope = require('telescope');
			telescope.setup {
				defaults = {
					file_ignore_patterns = {
						"node_modules"
					}
				}
			};
		end,
	},
	{
		'tpope/vim-fugitive',
	},
	{ "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
  {
  "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        ignore_whitespace = false,
        virt_text_priority = 100,
        use_focus = true,
      },
      current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
    },
    keys = {
       { "<leader>jj", "<cmd>:Gitsigns blame<cr>", desc = "Blame" },

    }
  },
  {
      'numToStr/Comment.nvim',
  }
}
