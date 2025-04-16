local function setup()
    vim.keymap.set('n', '<leader>w', '<cmd>w<cr>')
    vim.keymap.set('n', '<leader>n', '<cmd>b#<cr>')
    vim.keymap.set('i', 'jk', '<esc>')
    vim.keymap.set('n', '<leader>0', '<cmd>nohl<cr>')
    vim.keymap.set('n', '<leader>1', function() vim.o.list = not vim.o.list end)
    vim.keymap.set('n', '<leader>ud', '<cmd>UndotreeToggle<cr>')
    vim.keymap.set('n', '<leader>l', '<cmd>NvimTreeFindFile<cr>')
    vim.keymap.set('n', '<leader>q', '<cmd>q<cr>')
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    vim.keymap.set('n', '<leader>df', vim.diagnostic.open_float)
    vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist)
    vim.keymap.set('n', '<leader>m', function() vim.cmd('e ~/notes/scratch.md') end)
end

return {
    setup = setup,
}
