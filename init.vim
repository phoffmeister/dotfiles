call plug#begin('~/.vim/plugged')
Plug 'junegunn/gv.vim'
Plug 'masukomi/vim-markdown-folding'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
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
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap - ddp
nnoremap _ ddkP
nnoremap <leader>w :w<cr>
nnoremap <leader>o :Vex .<cr>
nnoremap <leader>d :bd<cr>
nnoremap <leader>n :bn<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>0 :nohl<cr>
nnoremap <leader>1 :set list!<cr>

let g:python3_host_prog = '$HOME/.pyenv/versions/neovim3/bin/python'

" move selected block up or down
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" copy and paste from clipboard
vnoremap <leader>c "+y
nnoremap <leader>v "+p

" surround word with quotes
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

" move to the beginning/ end of a line with cap H/ L
nnoremap L $
nnoremap H ^

" use the arrow keys to resize splits
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" replace esc with jk and force to use it since esc wont do anything in
" insert-modek
inoremap jk <esc>
inoremap <esc> <nop>
