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
    Plug 'sjl/badwolf'
call plug#end()

" Setup defualt indent formating
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set smartindent
set colorcolumn=80

filetype off
filetype plugin indent on
syntax on

au FileType bash,sh set sw=2 sts=2 ts=2

" Setup theme
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
nnoremap <leader>h :set hlsearch!<CR>

" Set warpping
set wrap
nnoremap <leader>w :set wrap!<CR>

" Set history
set history=100

" Set youcompleteme
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>d :YcmCompleter GetDoc<CR>

" Set vim-indent-guides
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

" Set vim-gitgutter
let g:gitgutter_realtime = 1

" Set syntastic
let g:syntastic_mode_map = {
    \ "mode": "passive"}
nnoremap <leader>c :SyntasticCheck<CR>
nnoremap <leader>e :Errors<CR>
nnoremap <leader>n :lnext<CR>
nnoremap <leader>p :lprevious<CR>

" Map W
command W w
command Wq wq

set clipboard=unnamed
