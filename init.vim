call plug#begin('~/.vim/plugged')
Plug 'junegunn/gv.vim'
Plug 'masukomi/vim-markdown-folding'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/loremipsum'
call plug#end()

filetype plugin indent on

set number
set wrap
set listchars=tab:▸\ ,eol:⏎,trail:X,space:␣,extends:>,precedes:< "☠
set expandtab " tabs ftw
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=2 " the visible width of tabs
set shiftwidth=2 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'
set ignorecase " ignore case while search
set smartcase " ignore case as long as the search term is all lower case

let mapleader = " "
noremap <space> <nop>
" --cheat space is leader | <space>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" --cheat open vim settings in a split | <leader>ev

nnoremap <leader>sv :source $MYVIMRC<cr>
" --cheat source vim settings | <leader>sv

nnoremap - ddp
" --cheat move line down | -

nnoremap _ ddkP
" --cheat move line up | _

nnoremap <leader>w :w<cr>
" --cheat save file | <leader>w

nnoremap <leader>o :Explore<cr>
" --cheat file explorer | <leader>o

nnoremap <leader>d :bd<cr>
" --cheat delete buffer | <leader>d

nnoremap <leader>n :bn<cr>
" --cheat next buffer | <leader>n

nnoremap <leader>q :q<cr>
" --cheat quit | <leader>q

nnoremap <leader>0 :nohl<cr>
" --cheat no more highlight | <leader>0

nnoremap <leader>1 :set list!<cr>
" --cheat show some whitespace | <leader>1

let g:python3_host_prog = '$HOME/.pyenv/versions/neovim3/bin/python'

xnoremap K :move '<-2<CR>gv-gv
" --cheat move visual chunk up | K

xnoremap J :move '>+1<CR>gv-gv
" --cheat move visual chunk down | J

vnoremap <leader>c "+y
" --cheat copy visual to clipboard | <leader>c

nnoremap <leader>v "+p
" --cheat paste from clipboard | <leader>v

nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
" --cheat surround with ' | <leader>'

nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
" --cheat surround with " | <leader>"

" move to the beginning/ end of a line with cap H/ L
nnoremap L $
" --cheat move to the end of line | L

nnoremap H ^
" --cheat move to the beginning of line | H

nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
" --cheat resize split | <Up>/<Down>/<Right>/<Left>

inoremap jk <esc>
inoremap <esc> <nop>
" --cheat get out of insert mode | jk

let g:netrw_liststyle=3

