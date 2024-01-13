return {
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require 'gitsigns'.setup {
                signs = {
                    add = { text = '+' },
                    change = { text = '~' },
                    delete = { text = '_' },
                    topdelete = { text = '‾' },
                    changedelete = { text = '~' },
                },
                current_line_blame_formatter = '<summary> - <author_time:%d.%b.%Y>',
                current_line_blame_opts = {
                    delay = 300,
                },
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    map({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>')
                    map('n', '<leader>hp', gs.preview_hunk)
                    map('n', '<leader>gb', gs.toggle_current_line_blame)
                    map('n', '<leader>hd', gs.diffthis)
                end
            }
        end
    }
}
