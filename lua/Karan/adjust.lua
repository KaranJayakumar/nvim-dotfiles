vim.opt.nu = true;
vim.opt.relativenumber = true;

vim.opt.tabstop = 4;
vim.opt.softtabstop = 4;
vim.opt.expandtab = true;
vim.opt.shiftwidth = 4;

vim.opt.smartindent = true;
vim.opt.swapfile = false;
vim.opt.backup = false;
vim.opt.undodir = vim.fn.stdpath('data') .. '/undodir';
vim.opt.undofile = true;

vim.opt.hlsearch = false;
vim.opt.incsearch = true;

vim.opt.termguicolors = true;
vim.opt.scrolloff = 8;

vim.opt.updatetime = 50;

vim.opt.colorcolumn = "80";
-- set termguicolors to enable highlight groups
vim.g.netrw_banner = 0;
vim.opt.termguicolors = true
vim.loader.enable();
