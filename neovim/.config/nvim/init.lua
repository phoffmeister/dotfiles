local use = require('packer').use

require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    -- LSP
    use {
        'neovim/nvim-lspconfig',
        requires = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'jose-elias-alvarez/null-ls.nvim',
            'j-hui/fidget.nvim',
        }
    }

    -- SNIP
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'L3MON4D3/LuaSnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip'
        }
    }

    -- TreeSitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use {
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter',
    }

    -- git goodies
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use 'lewis6991/gitsigns.nvim'

    -- formatting
    use 'rhysd/vim-clang-format'

    -- misc
    use 'windwp/nvim-autopairs'
    use 'mbbill/undotree'
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
    }
    use 'lukas-reineke/indent-blankline.nvim'
    use 'numToStr/Comment.nvim'
    use 'ryanoasis/vim-devicons'
    use 'rose-pine/neovim'
    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons',
            opt = true
        }
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }
end)

vim.cmd [[colorscheme rose-pine]]

vim.o.termguicolors = true
vim.o.exrc = true
vim.o.mouse = 'a'
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
vim.o.updatetime = 250
vim.o.spelllang = 'en'
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.opt.laststatus = 3
vim.opt.winbar = '%=%m %f'
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

-- space is the LEADER!
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set('', '<Space>', '<Nop>')
local t_b = require 'telescope.builtin'

vim.keymap.set('n', '<leader><space>', t_b.buffers)
vim.keymap.set('n', '<leader>ff', t_b.find_files)
vim.keymap.set('n', '<leader>fb', t_b.current_buffer_fuzzy_find)
vim.keymap.set('n', '<leader>fh', t_b.help_tags)
vim.keymap.set('n', '<leader>ft', t_b.tags)
vim.keymap.set('n', '<leader>fw', t_b.grep_string)
vim.keymap.set('n', '<leader>fp', t_b.live_grep)
vim.keymap.set('n', '<leader>fd', t_b.diagnostics)
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>')
vim.keymap.set('n', '<leader>n', '<cmd>bn<cr>')
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

local on_attach = function(_, bufnr)
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')

    -- See `:help K` for why this keymap
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

    -- Lesser used LSP functionality
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        if vim.lsp.buf.format then
            vim.lsp.buf.format()
        elseif vim.lsp.buf.formatting then
            vim.lsp.buf.formatting()
        end
    end, { desc = 'Format current buffer with LSP' })
end

require('mason').setup()

local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver', 'lua_ls', 'gopls' }

require('mason-lspconfig').setup {
    ensure_installed = servers,
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

for _, lsp in ipairs(servers) do
    require('lspconfig')[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

require('fidget').setup {
    text = {
        spinner = "moon",
    }
}

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

require('lspconfig').lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = runtime_path,
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = { library = vim.api.nvim_get_runtime_file('', true) },
            telemetry = { enable = false },
        },
    },
}

local null_ls = require("null-ls")
null_ls.setup {
    sources = { null_ls.builtins.formatting.black }
}

require('snip').setup()

local cmp = require 'cmp'
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<C-y>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        },
        ['<C-Space>'] = cmp.mapping.complete(),
    },
    sources = {
        { name = 'nvim_lua' },
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'luasnip' },
        { name = 'buffer', keyword_length = 5 },
    },
})

require "nvim-tree".setup()
require "nvim-autopairs".setup()
require "indent_blankline".setup {
    char = '┊',
    show_trailing_blankline_indent = false,
}
require 'lualine'.setup({})
require 'Comment'.setup()
require 'gitsigns'.setup {
    signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
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
        map('n', '<leader>tb', gs.toggle_current_line_blame)
        map('n', '<leader>hd', gs.diffthis)
    end
}
require('telescope').setup {
    defaults = {
        mappings = { i = { ['<C-u>'] = false, ['<C-d>'] = false } },
        file_ignore_patterns = { ".git", "node_modules" },
    }
}
require 'nvim-treesitter.configs'.setup {
    ensure_installed = {
        'bash',
        'c',
        'cmake',
        'cpp',
        'css',
        'diff',
        'dockerfile',
        'gitcommit',
        'go',
        'graphql',
        'help',
        'html',
        'javascript',
        'json',
        'json5',
        'julia',
        'kotlin',
        'latex',
        'lua',
        'markdown',
        'php',
        'python',
        'r',
        'regex',
        'ruby',
        'rust',
        'scala',
        'sql',
        'toml',
        'tsx',
        'typescript',
        'vim',
        'yaml',
        'zig',
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

-- dev stuff
P = function(v)
    print(vim.inspect(v))
    return v
end
