return {
    -- set the colorscheme first
    {
        "bluz71/vim-nightfly-colors",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme nightfly]])
        end
    },

    {
        'nvim-treesitter/nvim-treesitter',
        opts =  {
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        }
    },
    'nvim-treesitter/nvim-treesitter-textobjects',

    -- tpope goodies
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',
    'tpope/vim-obsession',
    'tpope/vim-unimpaired',

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
        opts = {
            actions = {
                open_file = {
                    quit_on_open = true,
                }
            },
            filters = {
                git_ignored = false,
            }
        }
    },
}
