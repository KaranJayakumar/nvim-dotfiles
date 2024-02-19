return{

    'neovim/nvim-lspconfig',
    event = "UIEnter",
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {"lua_ls", "tsserver"},
            handlers = {
                function(server_name)
                    local lspconfig = require("lspconfig");
                    lspconfig[server_name].setup({})
                end,
                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig");
                    lspconfig.lua_ls.setup{
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = {"vim"}
                                }
                            }
                        }
                    }
                end
            },
        })
    end
}
