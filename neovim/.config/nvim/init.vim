filetype plugin indent on

call plug#begin('~/.vim/plugged')
Plug 'cespare/vim-toml'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'neovim/nvim-lspconfig'
Plug 'mbbill/undotree'
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
call plug#end()

colorscheme gruvbox
highlight Normal guibg=none

luafile ~/.config/nvim/lua/lsp/tsserver.lua
luafile ~/.config/nvim/lua/lsp/pyright.lua
luafile ~/.config/nvim/lua/lsp/rust.lua
luafile ~/.config/nvim/lua/compe-config.lua

augroup myrust
    au!
    autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
augroup end
