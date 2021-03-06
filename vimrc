" no vi compatible mode
set nocompatible

set encoding=utf-8

" vim-plug setup
call plug#begin('~/vim/plugged')
    Plug 'airblade/vim-gitgutter'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'scrooloose/syntastic'
    Plug 'Valloric/YouCompleteMe'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'easymotion/vim-easymotion'
    Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
    Plug 'junegunn/fzf.vim'
    Plug 'rhysd/vim-clang-format'
    Plug 'tpope/vim-fugitive'
    Plug 'Glench/Vim-Jinja2-Syntax'
    Plug 'mbbill/undotree'
    Plug 'rix0rrr/vim-gcl'

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
set number relativenumber

filetype off
filetype plugin indent on
syntax on

au FileType bash,sh set sw=2 sts=2 ts=2
au FileType java set sw=4 sts=4 ts=4 colorcolumn=100
au FileType gitcommit set colorcolumn=72
au FileType python setl nosmartindent

au BufRead,BufNewFile *.inc set filetype=cpp
au BufRead,BufNewFile SConstruct set filetype=python

" Spelling check
set spellfile=~/.vim/spell/en.utf-8.add
set complete+=kspell
autocmd BufRead,BufNewFile *.rst setlocal spell
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell

autocmd BufNewFile,BufRead *.borg setfiletype gcl

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

" Remove jj to Esc
imap jj <Esc>

" Save the exit
nnoremap <leader>q :wq<CR>


" Set history
set history=100

" Set youcompleteme
let g:ycm_global_ycm_extra_conf = '~/vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_confirm_extra_conf = 0
nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>t :YcmCompleter GoToDefinition<CR>
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
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_mode_map = {
    \ "mode": "passive"}
nnoremap <leader>s :SyntasticCheck<CR>

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-bd-f2)

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

vnoremap <buffer> <Leader>zh :call ConvertZHToCN()<CR>"

" Set FZF
nnoremap <C-p> :Files<CR>
nnoremap <C-o> :GFiles<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <leader>f :Ag<CR>
let g:fzf_buffers_jump = 1

" Set clang-format
nnoremap <leader>d :ClangFormat<CR>
vnoremap <leader>d :ClangFormat<CR>

" Undotree
nnoremap <leader>u :UndotreeToggle<CR>

" Map W
command W w
command Wq wq
command Tabe tabe

" Reload vimrc
nnoremap <leader>r :so $MYVIMRC<CR>

" Command Make will call make and then cwindow which
" opens a 3 line error window if any errors are found.
" If no errors, it closes any open cwindow.
command -nargs=* Make make -j32 | cwindow 3
nnoremap <leader>m :Make<CR>

set clipboard=unnamedplus

call localrc#load()
