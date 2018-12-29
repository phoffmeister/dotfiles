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

"go to the same position in file
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

"airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

set number
set listchars=eol:↵,space:␣

let mapleader = " "
"cheat go to first non whitespace char | H
nnoremap H ^
"cheat go to last non whitespace char | L
nnoremap L g_

nnoremap <space> <nop>
"cheat write file | leader-w
nnoremap <leader>w :w<cr>
"cheat quit | leader-q
nnoremap <leader>q :q<cr>
"cheat no highlight | leader-0
nnoremap <leader>0 :nohl<cr>
"cheat show whitespace | leader-1
nnoremap <leader>1 :set list!<cr>
"cheat surround word with \" | leader-\"
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
"cheat surround word with \' | leader-\'
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel

"cheat edit vim config | leader-e-v
nnoremap <leader>ev :split $MYVIMRC<cr>
"cheat load vim config | leader-e-v
nnoremap <leader>sv :source $MYVIMRC<cr>

"cheat open tagbar | leader-t
nnoremap <leader>t :TagbarToggle<cr>
"cheat open ctrl-p | leader-p
nnoremap <leader>p :CtrlP<cr>
"cheat exit terminal mode | <esc>
tnoremap <Esc> <C-\><C-n>
