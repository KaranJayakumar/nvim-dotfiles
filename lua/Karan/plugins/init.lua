return {
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
    tag = '0.1.4',
    dependencies = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
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
  { "ellisonleao/glow.nvim", config = true, cmd = "Glow" }
}
