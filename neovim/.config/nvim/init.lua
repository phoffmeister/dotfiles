vim.o.number = true
-- vim.o.relativenumber = true
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.signcolumn = "yes"
vim.o.swapfile = false
vim.o.winborder = "rounded"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.termguicolors = true
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.expandtab = true
vim.o.incsearch = true
vim.o.showmode = false
vim.o.completeopt = 'menuone,noselect'
vim.g.mapleader = " "
vim.wo.colorcolumn = '80'
vim.o.spelllang = 'en'
vim.o.laststatus = 3
vim.o.winbar = '%=%m %f'
vim.o.hidden = true
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.opt.listchars = {
    tab = '▸~',
    eol = '⏎',
    trail = '☠',
    space = '␣',
    extends = '>',
    precedes = '<'
}

vim.keymap.set('n', '<leader>0', ':nohl<CR>')
vim.keymap.set('n', '<leader>1', function() vim.o.list = not vim.o.list end)
vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('i', 'jk', '<ESC>')

vim.pack.add({
    { src = "https://github.com/vague2k/vague.nvim" },
    { src = "https://github.com/dracula/vim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/nvim-telescope/telescope.nvim" },
    { src = "https://github.com/nvim-tree/nvim-tree.lua" },
    { src = "https://github.com/hrsh7th/nvim-cmp" },
    { src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
    { src = "https://github.com/hrsh7th/cmp-buffer" },
    { src = "https://github.com/hrsh7th/cmp-vsnip" },
    { src = "https://github.com/hrsh7th/vim-vsnip" },
    { src = "https://github.com/ntpeters/vim-better-whitespace" },
})

vim.keymap.set('n', '<leader>y', ':ToggleWhitespace<CR>')

local cmp = require 'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end
    },
    mapping = {
        ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-e>'] = cmp.mapping.close(),
    },
    sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'vsnip' },
        },
        {
            {
                name = 'buffer',
                max_item_count = 5,
            },
        }
    )
})

local capabilities = require 'cmp_nvim_lsp'.default_capabilities()

vim.lsp.config('lua_ls', {
    on_init = function(client)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if
                path ~= vim.fn.stdpath('config')
                and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
            then
                return
            end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
                version = 'LuaJIT',
                path = {
                    'lua/?.lua',
                    'lua/?/init.lua',
                },
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME
                }
            }
        })
    end,
    settings = {
        Lua = {}
    },
    capabilities = capabilities
})

vim.lsp.enable({ "lua_ls", "zls" })
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)

require 'nvim-tree'.setup({
    actions = {
        open_file = {
            quit_on_open = true,
        }
    }
})
vim.keymap.set('n', '<leader>ll', ':NvimTreeToggle<CR>', { desc = 'NvimTreeToggle' })

local t_builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>ff', t_builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', t_builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', t_builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', t_builtin.help_tags, { desc = 'Telescope help tags' })


vim.cmd("colorscheme dracula")
vim.cmd(":hi statusline guibg=NONE")
