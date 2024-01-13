return {
    -- TreeSitter
    {
        'nvim-treesitter/nvim-treesitter',
        config = function ()
            require 'nvim-treesitter.configs'.setup {
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            }
        end
    },
    'nvim-treesitter/nvim-treesitter-textobjects',

    -- git goodies
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',
    'tpope/vim-obsession',

    -- formatting
    'rhysd/vim-clang-format',

    -- misc
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {}
    },
    'mbbill/undotree',
    {
        'numToStr/Comment.nvim',
        opts = {}
    },
    'rose-pine/neovim',
    'folke/tokyonight.nvim',
    "bluz71/vim-nightfly-colors",
    {
        'nvim-lualine/lualine.nvim',
        opts = {},
        dependencies = {
            'kyazdani42/nvim-web-devicons',
        }
    },
    'github/copilot.vim',

    {
        'nvim-tree/nvim-tree.lua',
        config = function()
            require "nvim-tree".setup({
                actions = {
                    open_file = {
                        quit_on_open = true,
                    }
                }
            })
        end
    },

}
