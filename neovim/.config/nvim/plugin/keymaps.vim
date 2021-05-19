" general
let mapleader = " "
noremap <space> <nop>

nnoremap <leader>w :w<cr>
nnoremap <leader>d :bd<cr>
nnoremap <leader>n :bn<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>0 :nohl<cr>
nnoremap <leader>1 :set list!<cr>
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
inoremap jk <esc>
inoremap <esc> <nop>
