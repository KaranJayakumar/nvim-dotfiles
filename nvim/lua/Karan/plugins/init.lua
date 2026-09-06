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
			local actions = require('telescope.actions')
			local action_state = require('telescope.actions.state')

			local function glob_args(excludes)
				local args = {}
				for _, glob in ipairs(excludes) do
					table.insert(args, "--glob")
					table.insert(args, "!" .. glob)
				end
				return args
			end

			local function title(base, excludes)
				if #excludes == 0 then return base end
				return base .. "  (excluding " .. table.concat(excludes, ", ") .. ")"
			end

			-- Wraps a picker so its results can be filtered down after the fact:
			--   <leader>fr  (normal mode in the picker)  add globs to exclude
			--   <C-g>       (insert mode, same thing)
			--   <C-y>       drop all exclusions
			-- Excludes accumulate; the picker is reopened with the prompt text kept.
			local function with_excludes(open)
				local function launch(excludes, default_text)
					local function restart(prompt_bufnr, mutate)
						local line = action_state.get_current_line()
						actions.close(prompt_bufnr)
						vim.schedule(function()
							mutate(function(next_excludes)
								launch(next_excludes, line)
							end)
						end)
					end

					local function add(prompt_bufnr)
						restart(prompt_bufnr, function(reopen)
							local next_excludes = vim.deepcopy(excludes)
							-- comma separated, e.g. "*.lock, dist, **/vendor/**"
							local input = vim.fn.input("Exclude (globs, comma sep) > ")
							for glob in string.gmatch(input, "[^,]+") do
								glob = vim.trim(glob)
								if glob ~= "" then
									table.insert(next_excludes, glob)
								end
							end
							reopen(next_excludes)
						end)
					end

					local function clear(prompt_bufnr)
						restart(prompt_bufnr, function(reopen) reopen({}) end)
					end

					open(excludes, default_text, function(_, map)
						map('n', '<leader>fr', add)
						map('i', '<C-g>', add)
						map({ 'i', 'n' }, '<C-y>', clear)
						return true
					end)
				end

				return function() launch({}, nil) end
			end

			vim.keymap.set('n', '<leader>ff', with_excludes(function(excludes, default_text, attach)
				builtin.find_files({
					-- find_files ignores additional_args, so drive rg directly
					find_command = vim.list_extend({ "rg", "--files", "--color", "never" }, glob_args(excludes)),
					default_text = default_text,
					prompt_title = title("Find Files", excludes),
					attach_mappings = attach,
				})
			end))

			vim.keymap.set('n', '<leader>fj', builtin.buffers, {})
			vim.keymap.set('n', '<leader>fg', builtin.git_files, {})

			vim.keymap.set('n', '<leader>ft', function()
				local search = vim.fn.input("Grep > ")
				if search == "" then return end
				with_excludes(function(excludes, default_text, attach)
					builtin.grep_string({
						search = search,
						additional_args = glob_args(excludes),
						default_text = default_text,
						prompt_title = title("Grep: " .. search, excludes),
						attach_mappings = attach,
					})
				end)()
			end)

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
