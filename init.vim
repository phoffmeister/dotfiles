call plug#begin('~/.local/share/nvim/plugged')
Plug 'nvie/vim-flake8'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
call plug#end()

filetype plugin indent on

"airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

set number
set listchars=eol:↵,space:␣

let mapleader = " "

nnoremap <space> <nop>
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>0 :nohl<cr>
nnoremap <leader>1 :set list!<cr>

nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <leader>t :TagbarToggle<cr>
nnoremap <leader>p :CtrlP<cr>
