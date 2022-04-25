local M = {}

M.setup = function ()
    vim.o.termguicolors = true
    vim.o.exrc = true
    vim.o.hidden = true
    vim.o.errorbells = false
    vim.o.tabstop = 4
    vim.o.shiftwidth = 4
    vim.o.shiftwidth = 4
    vim.o.smartindent = true
    vim.o.smarttab = true
    vim.o.expandtab = true
    vim.o.number = true
    vim.o.relativenumber = true
    vim.o.wrap = true
    vim.o.swapfile = false
    vim.o.backup = false
    vim.o.undofile = true
    vim.o.incsearch = true
    vim.o.scrolloff = 8
    vim.o.showmode = false
    vim.o.completeopt = 'menuone,noselect'
    vim.o.signcolumn = 'yes'
    vim.opt.listchars = {
        tab = '▸~',
        eol = '⏎',
        trail = '☠',
        space = '␣',
        extends = '>',
        precedes = '<'
    }

    vim.o.ignorecase = true
    vim.o.smartcase = true
    vim.o.cmdheight = 2
    vim.wo.colorcolumn = '80'
    vim.o.updatetime = 50
    vim.o.spelllang = 'en'
    vim.o.shortmess = vim.o.shortmess .. 'c'

    -- Highlight on yank
    vim.cmd [[
      augroup YankHighlight
        autocmd!
        autocmd TextYankPost * silent! lua vim.highlight.on_yank()
      augroup end
    ]]
end

return M
