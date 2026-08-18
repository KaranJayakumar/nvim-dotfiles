-- nvim-treesitter's `main` branch is a full rewrite for Neovim 0.11+/0.12:
-- the old `nvim-treesitter.configs` / `nvim-treesitter.install` module API
-- (ensure_installed, highlight.enable, auto_install, ...) is gone. Parser
-- install and highlighting are now driven separately, with highlighting
-- handled by Neovim core (`vim.treesitter.start()`).
return {
	{
		'nvim-treesitter/nvim-treesitter',
		branch = 'main',
		lazy = false,
		build = ':TSUpdate',
		dependencies = {
			'windwp/nvim-ts-autotag',
		},
		config = function()
			local ts = require('nvim-treesitter')
			local ts_config = require('nvim-treesitter.config')

			-- Old `ensure_installed`. Already-installed parsers are skipped, so
			-- this is a cheap no-op on every start after the first.
			ts.install({ 'vimdoc', 'html', 'css', 'vue', 'lua' })

			local installed = {}
			for _, lang in ipairs(ts_config.get_installed('parsers')) do
				installed[lang] = true
			end

			local available -- built lazily; get_available() is not cheap
			local pending = {}

			local function start(buf, lang)
				if vim.api.nvim_buf_is_valid(buf) then
					pcall(vim.treesitter.start, buf, lang)
				end
			end

			-- Old `auto_install = true` + `highlight.enable = true`: highlight every
			-- filetype we have a parser for, fetching the parser on first use. If no
			-- parser exists for the language we do nothing, which leaves Neovim's
			-- regex `:syntax` highlighting in place as the fallback.
			vim.api.nvim_create_autocmd('FileType', {
				callback = function(args)
					local lang = vim.treesitter.language.get_lang(args.match)
					if not lang then return end

					if installed[lang] then
						start(args.buf, lang)
						return
					end

					if pending[lang] then return end
					available = available or ts_config.get_available()
					if not vim.tbl_contains(available, lang) then return end

					pending[lang] = true
					ts.install({ lang }):await(function(err)
						pending[lang] = nil
						if err then return end
						installed[lang] = true
						vim.schedule(function()
							-- The buffer that triggered this may not be the only one waiting.
							for _, buf in ipairs(vim.api.nvim_list_bufs()) do
								if vim.api.nvim_buf_is_loaded(buf)
									and vim.treesitter.language.get_lang(vim.bo[buf].filetype) == lang then
									start(buf, lang)
								end
							end
						end)
					end)
				end,
			})

			require('nvim-ts-autotag').setup()
		end
	},

}
