return{
    {
        "rebelot/kanagawa.nvim",
        name = "kanagawa",
        lazy = false,
        priority = 1000,
        config = function()

            require('kanagawa').setup({
                compile = false,             -- enable compiling the colorscheme
                undercurl = true,            -- enable undercurls
                commentStyle = { italic = true },
                functionStyle = {},
                keywordStyle = { italic = true},
                statementStyle = { bold = true },
                typeStyle = {},
                transparent = false,         -- do not set background color
                dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
                terminalColors = true,       -- define vim.g.terminal_color_{0,17}
                colors = {                   -- add/modify theme and palette colors
                    palette = {},
                    theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
                },
                overrides = function(colors) -- add/modify highlights
                    return {}
                end,
                theme = "dragon",              -- Load "wave" theme when 'background' option is not set
                background = {               -- map the value of 'background' option to a theme
                    dark = "dragon",           -- try "dragon" !
                },
            })
            vim.cmd("colorscheme kanagawa")
        end
    },
    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
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

