local M = {}

M.setup = function ()
    -- space is the LEADER!
    vim.api.nvim_set_keymap('', '<Space>', '<Nop>', {noremap = true, silent = true})
    vim.g.mapleader = ' '
    vim.g.maplocalleader = ' '

    vim.api.nvim_set_keymap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], {noremap = true, silent = true})
    vim.api.nvim_set_keymap('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]], {noremap = true, silent = true})
    vim.api.nvim_set_keymap('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], {noremap = true, silent = true})
    vim.api.nvim_set_keymap('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], {noremap = true, silent = true})
    vim.api.nvim_set_keymap('n', '<leader>ft', [[<cmd>lua require('telescope.builtin').tags()<CR>]], {noremap = true, silent = true})
    vim.api.nvim_set_keymap('n', '<leader>fd', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], {noremap = true, silent = true})
    vim.api.nvim_set_keymap('n', '<leader>fp', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], {noremap = true, silent = true})
    vim.api.nvim_set_keymap('n', '<leader>fo', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]], {noremap = true, silent = true})
    vim.api.nvim_set_keymap('n', '<leader>w', ':w<cr>', {noremap = true, silent = true})
    vim.api.nvim_set_keymap('n', '<leader>n', ':bn<cr>', {noremap = true, silent = true})
    vim.api.nvim_set_keymap('n', '<leader>d', ':bd<cr>', {noremap = true, silent = true})
    vim.api.nvim_set_keymap('i', 'jk', '<esc>', {noremap = true, silent = true})
    vim.api.nvim_set_keymap('n', '<up>', ':resize +2<cr>', {noremap = true, silent = true})
    vim.api.nvim_set_keymap('n', '<down>', ':resize -2<cr>', {noremap = true, silent = true})
    vim.api.nvim_set_keymap('n', '<left>', ':vertical resize +2<cr>', {noremap = true, silent = true})
    vim.api.nvim_set_keymap('n', '<right>', ':vertical resize -2<cr>', {noremap = true, silent = true})
    vim.api.nvim_set_keymap('n', '<leader>q', ':q<cr>', {noremap = true, silent = true})
    vim.api.nvim_set_keymap('n', '<leader>0', ':nohl<cr>', {noremap = true, silent = true})
    vim.api.nvim_set_keymap('n', '<leader>1', ':lua vim.o.list = not vim.o.list<cr>', {noremap = true, silent = true})
end

return M
