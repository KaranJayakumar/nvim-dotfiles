return {
  'neovim/nvim-lspconfig',
  event = "UIEnter",
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls"},
      handlers = {
        function(server_name)
          local lspconfig = require("lspconfig");
          lspconfig[server_name].setup({})
        end,
        ["lua_ls"] = function()
          local lspconfig = require("lspconfig");
          lspconfig.lua_ls.setup {
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" }
                }
              }
            }
          }
        end,
        ["pyright"] = function()
          require('lspconfig').pyright.setup {
            settings = {
              pyright = {
                -- Using Ruff's import organizer
                disableOrganizeImports = true,
              },
              python = {
                analysis = {
                  -- Ignore all files for analysis to exclusively use Ruff for linting
                  ignore = { '*' },
                },
              },
            },
          }
        end
      },
    })
  end
}
