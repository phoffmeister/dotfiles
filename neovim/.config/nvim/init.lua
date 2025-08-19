vim.o.number = true
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.signcolumn = "yes" -- also needed for gitgutter
vim.o.updatetime = 100   -- also needed for gitgutter
vim.o.swapfile = false
vim.o.winborder = "rounded"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.termguicolors = true
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.smartcase = true
vim.o.ignorecase = true
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
vim.o.shortmess = vim.o.shortmess .. 'cI'
vim.opt.listchars = {
    tab = '▸~',
    eol = '⏎',
    trail = '☠',
    space = '␣',
    extends = '>',
    precedes = '<'
}

vim.api.nvim_create_autocmd("FileType", {
    pattern = "lua",
    callback = function()
        vim.keymap.set('n', '<leader>o', ':update<CR>:source<CR>', { buffer = true })
    end,
})

vim.keymap.set('n', '<leader>0', ':nohl<CR>')
vim.keymap.set('n', '<leader>1', function() vim.o.list = not vim.o.list end)
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('i', 'jk', '<ESC>')

vim.pack.add({
    { src = "https://github.com/vague2k/vague.nvim" },
    { src = "https://github.com/dracula/vim" },
    { src = "https://github.com/folke/tokyonight.nvim" },
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
    { src = "https://github.com/tpope/vim-fugitive" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/airblade/vim-gitgutter" },
    { src = "https://github.com/natecraddock/sessions.nvim" },
    { src = "https://github.com/j-hui/fidget.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
})

-- sessions
local sessions = require 'sessions'
sessions.setup({
    session_filepath = vim.fn.stdpath("data") .. "/sessions",
    absolute = true,
})
vim.keymap.set('n', '<leader>ss', function() sessions.save() end)
vim.keymap.set('n', '<leader>sl', function() sessions.load() end)

-- fidget
require("fidget").setup({
    progress = {
        display = {
            progress_icon = { "moon" },
        },
    },
    notification = {
        window = {
            winblend = 15,
            border = 'rounded',
        },
    },
})


-- treesitter
require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "zig", "rust" },
    sync_install = false,
    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

-- angry whitespace
vim.keymap.set('n', '<leader>y', ':ToggleWhitespace<CR>')

-- cmp
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

local wanted_lsp_clients = { "lua_ls", "zls", "pyright", "rust_analyzer", "ts_ls" }
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
})

for _, lsp_client in ipairs(wanted_lsp_clients) do
    vim.lsp.config(lsp_client, {
        capabilities = capabilities,
    })
end
vim.lsp.enable(wanted_lsp_clients)

vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition)

require 'nvim-tree'.setup({
    actions = {
        open_file = {
            quit_on_open = true,
        }
    }
})
vim.keymap.set('n', '<leader>ll', ':NvimTreeToggle<CR>', { desc = 'NvimTreeToggle' })

local telescope = require 'telescope.builtin'
vim.keymap.set('n', '<leader>ff', telescope.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', telescope.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', telescope.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', telescope.help_tags, { desc = 'Telescope help tags' })


vim.cmd("colorscheme tokyonight-night")
vim.cmd(":hi statusline guibg=NONE")
