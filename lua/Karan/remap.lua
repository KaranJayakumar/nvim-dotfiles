--Leader key = <Space>
vim.g.mapleader = " "

local keymap = vim.api.nvim_set_keymap;
local opts = {noremap = true, silent = true}
--Toggling NVIM Tree
vim.keymap.set("n", "<leader>pv",":NvimTreeToggle<cr>");

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
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dp', opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
