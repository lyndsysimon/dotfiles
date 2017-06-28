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
set tabstop=4 "visual spaces per tab character
set expandtab "use spaces instead of tabs by default
set softtabstop=4 "number of spaces that represent a tab
set shiftwidth=4 "number of spaces for automatic indentation
" }}}

"-- Language-specific settings {{{
augroup configgroup
    " clear autocmds for the current group
    au!

    au BufEnter Makefile setlocal noexpandtab

    au FileType * syntax on

    au FileType python setlocal commentstring=#\ %s

    au FileType javascript setlocal tabstop=2
    au FileType javascript setlocal shiftwidth=2
    au FileType javascript setlocal softtabstop=2
    au FileType javascript setlocal commentstring=//%s

    au FileType ruby setlocal tabstop=2
    au FileType ruby setlocal shiftwidth=2
    au FileType ruby setlocal softtabstop=2
    au FileType ruby setlocal commentstring=#\ %s

    au FileType yaml setlocal tabstop=2
    au FileType yaml setlocal shiftwidth=2
    au FileType yaml setlocal softtabstop=2
    au FileType yaml setlocal commentstring=#\ %s
augroup END
" }}}

"-- UI config {{{

set colorcolumn=80
filetype indent on "load filetype-specific indentation files

set number "show line numbers
set showcmd "show last vim command at bottom right
set showmatch "highlight matching parens, square and curly brackets
set list!
set lcs=tab:>-,eol:¬,trail:▒  "print invisibles
highlight SpecialKey ctermfg=Red

set wildmenu "contextual autocomplete on <Tab> for commands
set wildignore=*~,*.pyc "ignore compiled files

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

" if nvim is opened without specifying a file, open NERDTree by default
augroup NERDTreeConfig
    au!
    au StdinReadPre * let s:std_in=1
    au VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree
augroup END
Plug 'ryanoasis/vim-devicons'

Plug 'airblade/vim-gitgutter'
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1
set updatetime=250 " Note: This may negatively impact performance. Default is 4000.

Plug 'junegunn/rainbow_parentheses.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1

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

Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'

Plug 'majutsushi/tagbar'
nnoremap <leader>2 :TagbarToggle<CR>

call plug#end()
" }}}

" vim:foldmethod=marker:foldlevel=0
