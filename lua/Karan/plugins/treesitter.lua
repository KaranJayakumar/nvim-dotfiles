return {
	{
		'nvim-treesitter/nvim-treesitter',
		dependencies = {
			'windwp/nvim-ts-autotag',
		},
		build = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
		config = function()
			require('nvim-ts-autotag').setup()
			require 'nvim-treesitter.install'.prefer_git = false
			require 'nvim-treesitter.install'.compilers = { "gcc" }
			require 'nvim-treesitter.configs'.setup {
				-- A list of parser names, or "all" (the five listed parsers should always be installed)
				ensure_installed = { 'vimdoc', 'html', 'css', 'vue', 'lua' },

				-- Install parsers synchronously (only applied to `ensure_installed`)
				sync_install = false,

				-- Automatically install missing parsers when entering buffer
				-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
				auto_install = true,
				highlight = {
					enable = true,
					-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
					-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
					-- Using this option may slow down your editor, and you may see some duplicate highlights.
					-- Instead of true it can also be a list of languages
					additional_vim_regex_highlighting = false,
				},
			}

			--Setting up autotag
		end
	},

}
