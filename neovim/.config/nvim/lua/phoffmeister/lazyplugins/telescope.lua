return {
    'nvim-lua/plenary.nvim',
    {
        'nvim-telescope/telescope.nvim',
        config = function()
            require('telescope').setup {
                defaults = {
                    layout_strategy = 'vertical',
                    file_ignore_patterns = { ".git", "node_modules" },
                    path_display = { "shorten" },
                }
            }

            local t_b = require 'telescope.builtin'
            vim.keymap.set('n', '<leader><space>', t_b.buffers)
            vim.keymap.set('n', '<leader>ff', t_b.find_files)
            vim.keymap.set('n', '<leader>fb', t_b.current_buffer_fuzzy_find)
            vim.keymap.set('n', '<leader>fh', t_b.help_tags)
            vim.keymap.set('n', '<leader>ft', t_b.tags)
            vim.keymap.set('n', '<leader>fw', t_b.grep_string)
            vim.keymap.set('n', '<leader>fp', t_b.live_grep)
            vim.keymap.set('n', '<leader>fd', t_b.diagnostics)
            vim.keymap.set('n', '<leader>fg', t_b.git_status)
        end
    },
}
