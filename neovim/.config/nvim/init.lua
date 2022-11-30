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
    use 'L3MON4D3/LuaSnip'
    use 'windwp/nvim-autopairs'
    use 'prettier/vim-prettier'
    use 'mbbill/undotree'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/nvim-cmp'
    use 'joshdick/onedark.vim'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'neovim/nvim-lspconfig'
    use 'numToStr/Comment.nvim'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-treesitter/playground'
    use 'onsails/lspkind-nvim'
    use 'rhysd/vim-clang-format'
    use 'ryanoasis/vim-devicons'
    use 'saadparwaiz1/cmp_luasnip'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use 'tpope/vim-dadbod'
    use 'dracula/vim'
    use 'kristijanhusak/vim-dadbod-ui'
    use 'wbthomason/packer.nvim'
    use 'kristijanhusak/vim-dadbod-completion'
    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
    use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
    use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
end)

vim.cmd [[colorscheme dracula]]

require "nvim-autopairs".setup({})
require "user-defaults".setup()
require "user-keymaps".setup()
require "user-lsp".setup()
require "user-cmp".setup()
require "user-luasnip".setup()


require "indent_blankline".setup {
    space_char_blank_line = " ",
    show_current_context = true,
    show_current_context_start = true,
}
require 'lualine'.setup()
require 'Comment'.setup()
require 'gitsigns'.setup {
    signs = {
        change = { hl = 'GitGutterChange', text = '~' },
        delete = { hl = 'GitGutterDelete', text = '_' },
        topdelete = { hl = 'GitGutterDelete', text = '‾' },
        changedelete = { hl = 'GitGutterChange', text = '~' }
    },
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        --
        -- Actions
        -- map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
        map({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>')
        -- map('n', '<leader>hS', gs.stage_buffer)
        -- map('n', '<leader>hu', gs.undo_stage_hunk)
        -- map('n', '<leader>hR', gs.reset_buffer)
        map('n', '<leader>hp', gs.preview_hunk)
        -- map('n', '<leader>hb', function() gs.blame_line{full=true} end)
        map('n', '<leader>tb', gs.toggle_current_line_blame)
        map('n', '<leader>hd', gs.diffthis)
        -- map('n', '<leader>hD', function() gs.diffthis('~') end)
        -- map('n', '<leader>td', gs.toggle_deleted)
        --
        -- -- Text object
        -- map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end
}
require('telescope').setup {
    defaults = {
        mappings = { i = { ['<C-u>'] = false, ['<C-d>'] = false } },
        file_ignore_patterns = { ".git", "node_modules" },
    }
}
require 'nvim-treesitter.configs'.setup {
    ensure_installed = 'all',
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}


vim.cmd([[
let g:prettier#autoformat = 1
]])
-- dev stuff
P = function(v)
    print(vim.inspect(v))
    return v
end
