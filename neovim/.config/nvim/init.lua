-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.cmd [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]]

local use = require('packer').use
require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'ryanoasis/vim-devicons'
    use 'numToStr/Comment.nvim'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use 'rhysd/vim-clang-format'
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'}}
    use 'joshdick/onedark.vim'
    use 'onsails/lspkind-nvim'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip'
    use { 'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use 'lukas-reineke/indent-blankline.nvim'
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}
end)

vim.o.termguicolors = true
vim.g.onedark_terminal_italics = 2
vim.cmd [[colorscheme onedark]]

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

vim.api.nvim_set_keymap('', '<Space>', '<Nop>', {noremap = true, silent = true})
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Map blankline
vim.g.indent_blankline_char = '┊'
vim.g.indent_blankline_filetype_exclude = {'help', 'packer'}
vim.g.indent_blankline_buftype_exclude = {'terminal', 'nofile'}
vim.g.indent_blankline_show_trailing_blankline_indent = false

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

-- Add leader shortcuts
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

require'lualine'.setup({
    options = {
        theme = 'onedark',
        section_separators = {left = '┊', right = '┊'},
        component_separators = {left = '┊', right = '┊'}
    },
})

require('Comment').setup()

-- Gitsigns
require('gitsigns').setup {
    signs = {
        add = {hl = 'GitGutterAdd', text = '+'},
        change = {hl = 'GitGutterChange', text = '~'},
        delete = {hl = 'GitGutterDelete', text = '_'},
        topdelete = {hl = 'GitGutterDelete', text = '‾'},
        changedelete = {hl = 'GitGutterChange', text = '~'}
    }
}

-- Telescope
require('telescope').setup {
    defaults = {mappings = {i = {['<C-u>'] = false, ['<C-d>'] = false}}}
}

-- Treesitter configuration
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  sync_install = false,
  ignore_install = {},
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },
}

-- LSP settings
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = {noremap = true, silent = true}

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local servers = {'pyright', 'rust_analyzer'}
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

local lspkind = require'lspkind'
local cmp = require'cmp'
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
        {name = 'nvim_lua'},
        {name = 'nvim_lsp'},
        {name = 'path'},
        {name = 'luasnip'},
        {name = 'buffer', keyword_length = 5},
    },
    formatting = {
        format = lspkind.cmp_format({
            with_text = true,
            menu = {
                buffer = "[buf]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[api]",
                path = "[path]",
                luasnip = "[snip]",
            }
        })
    },
    experimental = {
        native_menu = false,
        ghost_text = true
    }
})
