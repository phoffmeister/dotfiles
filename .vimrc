set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'chriskempson/base16-vim'
Plugin 'tpope/vim-commentary'
Plugin 'Chiel92/vim-autoformat'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-fugitive'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
call vundle#end()

filetype plugin indent on

"ultsnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1


set expandtab " tabs ftw
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=2 " the visible width of tabs
set softtabstop=2 " edit as if the tabs are 4 characters wide
set shiftwidth=2 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'

vnoremap <C-c> "+y
"noremap <C-v> "+p

" Folding
" set fdm=syntax
" set foldcolumn=4
" set foldnestmax=4

set backspace=indent,eol,start
set showmatch
nmap <F8> :TagbarToggle<CR>
set laststatus=2
syntax enable
set ttyfast
set ignorecase
set encoding=utf-8
"let base16colorspace=256
set t_Co=256
" set background=dark
" colorscheme delek
set autoindent
set relativenumber
set number
" highlight Normal ctermfg=grey ctermbg=black
" highlight LineNr ctermfg=red
set listchars=tab:▸\ ,eol:⏎,trail:␣,extends:>,precedes:< "☠
set list
set mouse=a
set whichwrap=b,s,<,>,[,]
