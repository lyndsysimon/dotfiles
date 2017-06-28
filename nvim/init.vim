"-- Prereqs{{{
" search subdirectories recursively when trying to open a file
set path+=**

" use single-quote as leader
let mapleader="'"

" jj leaves insert mode
inoremap jj <esc>

" highlight the text entered the last time you were in INSERT mode
nnoremap gV `[v`]
" }}}

"-- Spaces & Tabs {{{
" visual spaces per tab character
set tabstop=4

" use spaces instead of tabs by default
set expandtab

" number of spaces that represent a tab
set softtabstop=4

" number of spaces for automatic indentation
set shiftwidth=4
" }}}

"-- Language-specific settings {{{
augroup configgroup
    au!

    au BufEnter Makefile setlocal noexpandtab

    au FileType * syntax on

    au FileType python setlocal commentstring=#\ %s

    au FileType javascript setlocal tabstop=2
    au FileType javascript setlocal shiftwidth=2
    au FileType javascript setlocal softtabstop=2
    au FileType javascript setlocal commentstring=//%s

    au FileType json setlocal tabstop=2
    au FileType json setlocal shiftwidth=2
    au FileType json setlocal softtabstop=2
    au FileType json setlocal commentstring=//%s

    au FileType ruby setlocal tabstop=2
    au FileType ruby setlocal shiftwidth=2
    au FileType ruby setlocal softtabstop=2
    au FileType ruby setlocal commentstring=#\ %s
    au FileType ruby setlocal colorcolumn=99

    au FileType yaml setlocal tabstop=2
    au FileType yaml setlocal shiftwidth=2
    au FileType yaml setlocal softtabstop=2
    au FileType yaml setlocal commentstring=#\ %s
augroup END
" }}}

"-- UI config {{{
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set colorcolumn=80

" load filetype-specific indentation files
filetype indent on

" show line numbers
set number

"show last vim command at bottom right
set showcmd

"highlight matching parens, square and curly brackets
set showmatch

set list!

" print invisibles
set lcs=tab:>-,eol:¬,trail:▒

highlight SpecialKey ctermfg=Red

" contextual autocomplete on <Tab> for commands
set wildmenu

" ignore compiled files
set wildignore=*~,*.pyc

set modelines=1 "check last line of the file for a modeline

set lazyredraw "fewer redraws == faster macros

set clipboard+=unnamedplus

augroup ActiveWindowHighlight
    au!

    au WinEnter * set cul
    au WinLeave * set nocul
augroup END
" }}}

"-- Search {{{
set incsearch "search as you type
set hlsearch "highlight matches
    " remove highlights from an existing search
nnoremap <leader><space> :nohlsearch<CR>
" }}}

"-- Folding {{{
set foldenable "turn folding on
set foldlevelstart=10 "show most folds on open
set foldnestmax=10 "maximum number of nested folds
    " toggle open/close with the spacebar
nnoremap <space> za
set foldmethod=indent "fold based on indentation level. Python, fuck yeah.
" }}}

"-- Movement {{{
    " move up and down based on visual lines - respects wrapping
nnoremap j gj
nnoremap k gk
" }}}

"-- Backups {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}

"-- Neovim Runtime {{{
runtime! python_setup.vim "set up Python runtime
" }}}

"-- Functions {{{
" toggle between number and relativenumber
function! ToggleNumber()
   if(&relativenumber == 1)
       set norelativenumber
       set number
   else
       set relativenumber
   endif
endfunc

" toggle all folding
function! ToggleFolding()
   if(&foldlevel == 0)
       set foldlevel=10
   else
       set foldlevel=0
   endif
endfunc
nnoremap <leader>f :call ToggleFolding()<CR>

" }}}

"-- Plugins {{{
" using vim-plug
call plug#begin()

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
nnoremap <leader>1 :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'ryanoasis/vim-devicons'

Plug 'airblade/vim-gitgutter'
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1
set updatetime=250 " Note: This may negatively impact performance. Default is 4000.

Plug 'junegunn/rainbow_parentheses.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline_theme = 'vice'

Plug 'mileszs/ack.vim'

Plug 'scrooloose/syntastic'
let g:syntastic_ruby_checkers = ['rubocop']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

Plug 'ludovicchabant/vim-gutentags'

Plug 'majutsushi/tagbar'
nnoremap <leader>2 :TagbarToggle<CR>

Plug 'baabelfish/nvim-nim'

call plug#end()
" }}}

" vim:foldmethod=marker:foldlevel=0
