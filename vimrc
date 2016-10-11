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
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
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
au FileType java set sw=4 sts=4 ts=4 colorcolumn=100

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

" Set paste
nnoremap <leader>p :set paste!<CR>

" Set history
set history=100

" Set youcompleteme
let g:ycm_global_ycm_extra_conf = '~/vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_extra_conf_globlist = ['~/chromium/*']
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>d :YcmCompleter GetDoc<CR>
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" Set vim-indent-guides
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

" Set vim-gitgutter
let g:gitgutter_realtime = 1

" Set syntastic
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_mode_map = {
    \ "mode": "passive"}

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Map W
command W w
command Wq wq

set clipboard=unnamed
