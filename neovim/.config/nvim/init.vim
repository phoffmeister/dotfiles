filetype plugin indent on

call plug#begin('~/.vim/plugged')
Plug 'jeetsukumaran/vim-buffergator'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'mattn/emmet-vim'
Plug 'numToStr/Comment.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/vim-clang-format'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'neovim/nvim-lspconfig'
Plug 'mbbill/undotree'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
call plug#end()

colorscheme onedark
highlight Normal guibg=none

source ~/.config/nvim/keymaps.vim
source ~/.config/nvim/lsp.vim
source ~/.config/nvim/netrw.vim
source ~/.config/nvim/prettier.vim
source ~/.config/nvim/sets.vim
source ~/.config/nvim/telescope.vim
source ~/.config/nvim/undotree.vim
source ~/.config/nvim/cmp.vim
source ~/.config/nvim/nerdtree.vim
source ~/.config/nvim/buffergator.vim

luafile ~/.config/nvim/lua/lsp/tsserver.lua
luafile ~/.config/nvim/lua/lsp/pyright.lua

lua require('Comment').setup()

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
EOF


