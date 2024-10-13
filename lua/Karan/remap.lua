--Leader key = <Space>
vim.g.mapleader = " "

local keymap = vim.api.nvim_set_keymap;
local opts = { noremap = true, silent = true }
--Toggling NVIM Tree
vim.keymap.set("n", "<leader>pv", ":Ex<cr>");

--Setting UndoTree Toggle
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

--Opening Git Fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

--Select All
keymap("n", "<leader>a", "ggVG", opts)
keymap("n", "<leader>y", "\"+y", opts)

--Copying to System Register
keymap("v", "<leader>y", "\"+y", opts)

--Navigating Buffers
keymap('n', '<leader>=', ':bnext<CR>', opts)
keymap('n', '<leader>-', ':bprev<CR>', opts)
keymap('n', '<leader>d', '<C-w>w', opts)

--Viewing Errors
keymap('n', '<leader>e', ':lua vim.diagnostic.open_float()<CR>', opts)

--Stay in Visual when indenting
keymap("v", "<", "<gv", opts);
keymap("v", ">", ">gv", opts);

--Move code up & down : Visual & Visual Block
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "p", '"_dp', opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

--keymaps for when LSP is attached
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  end,
})
