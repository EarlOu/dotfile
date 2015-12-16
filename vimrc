" no vi compatible mode
set nocompatible

set encoding=utf-8

" vim-plug setup
call plug#begin('~/vim/plugged')
    Plug 'airblade/vim-gitgutter'
    Plug 'kien/ctrlp.vim'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'scrooloose/syntastic'
    Plug 'Valloric/YouCompleteMe'
 
    " Vim theme
    Plug 'altercation/vim-colors-solarized'
    Plug 'sjl/badwolf'
call plug#end()

" Setup indent formating
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set smartindent
set colorcolumn=81
filetype plugin indent on

" Setup theme
syntax on
set background=dark
colorscheme badwolf

" Show ruler, line nu, braket, etc.
set nu
set cursorline
set ruler
set showmatch
set showmode
set showcmd

" Show tab, tailing space.
set list listchars=tab:▸\ ,trail:~,eol:¬,precedes:<,extends:>

" Let backspace works as backspace
set backspace=indent,eol,start

" Set search highlight and incremental search
set hlsearch
set incsearch
nnoremap <F3> :set hlsearch!<CR>

" Set warpping
set wrap
nnoremap <F4> :set wrap!<CR>

" Set history
set history=100

" Set vim-indent-guides
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

" Set vim-gitgutter
let g:gitgutter_realtime = 1

" Map W
command W w

set clipboard=unnamedplus
