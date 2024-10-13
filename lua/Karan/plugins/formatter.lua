return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        lua = { "stylua" },
        python = { "ruff" }
      },
      format_on_save = {
        lsp_fallback = true,
      },
    })
    vim.keymap.set("n", "<leader>cc", function()
      conform.format({
      })
    end)
  end,
}
