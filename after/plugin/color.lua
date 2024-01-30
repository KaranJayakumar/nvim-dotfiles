function ColorMyPencils(color)
    color = color or "catppuccin"
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})
    vim.cmd [[
    highlight LineNr term=bold cterm=NONE ctermfg=Green ctermbg=NONE gui=NONE guifg=#62bd7a guibg=NONE
    ]]

end
vim.opt.colorcolumn="0"

ColorMyPencils()
