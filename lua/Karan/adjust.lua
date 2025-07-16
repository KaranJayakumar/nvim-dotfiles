vim.opt.nu = true;
vim.opt.relativenumber = true;
vim.opt.tabstop = 2      -- Number of spaces that a tab counts for
vim.opt.shiftwidth = 2   -- Number of spaces to use for autoindent
vim.opt.expandtab = true -- Convert tabs to spaces

vim.opt.smartindent = true;
vim.opt.swapfile = false;
vim.opt.backup = false;
vim.opt.undodir = vim.fn.stdpath('data') .. '/undodir';
vim.opt.undofile = true;

vim.opt.hlsearch = false;
vim.opt.incsearch = true;

vim.opt.scrolloff = 8;

vim.opt.updatetime = 50;

vim.opt.colorcolumn = "80";
-- set termguicolors to enable highlight groups
vim.g.netrw_banner = 0;

vim.loader.enable();

vim.cmd([[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NormalNC guibg=NONE ctermbg=NONE
  highlight SignColumn guibg=NONE ctermbg=NONE
]])
