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
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'onsails/lspkind-nvim'
    use 'rhysd/vim-clang-format'
    use 'ryanoasis/vim-devicons'
    use 'saadparwaiz1/cmp_luasnip'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use 'wbthomason/packer.nvim'
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}
    use {'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}
    use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'}}
end)

vim.cmd [[colorscheme onedark]]

require"nvim-defaults".setup()
require"keymaps-init".setup()
require"lsp-init".setup()
require"cmp-init".setup()
require"indent_blankline".setup {
    space_char_blank_line = " ",
    show_current_context = true,
    show_current_context_start = true,
}
require'lualine'.setup({
    options = {
        theme = 'onedark',
        section_separators = {left = '┊', right = '┊'},
        component_separators = {left = '┊', right = '┊'}
    },
})
require('Comment').setup()
require('gitsigns').setup {
    signs = {
        add = {hl = 'GitGutterAdd', text = '+'},
        change = {hl = 'GitGutterChange', text = '~'},
        delete = {hl = 'GitGutterDelete', text = '_'},
        topdelete = {hl = 'GitGutterDelete', text = '‾'},
        changedelete = {hl = 'GitGutterChange', text = '~'}
    }
}
require('telescope').setup {
    defaults = {mappings = {i = {['<C-u>'] = false, ['<C-d>'] = false}}}
}
require'nvim-treesitter.configs'.setup {
  ensure_installed = 'all',
  sync_install = false,
  ignore_install = {},
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },
}
