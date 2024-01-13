local function setup()
    vim.o.termguicolors = true
    vim.o.exrc = true
    vim.o.mouse = 'a'
    vim.o.hidden = true
    vim.o.errorbells = false
    vim.o.tabstop = 4
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
    vim.o.updatetime = 250
    vim.o.spelllang = 'en'
    vim.o.shortmess = vim.o.shortmess .. 'c'
    vim.opt.laststatus = 3
    vim.opt.winbar = '%=%m %f'
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.g.python3_host_prog = '/home/phoffmeister/.pyenv/versions/pynvim/bin/python'
end

return {
    setup = setup
}
