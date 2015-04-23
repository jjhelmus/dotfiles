set nocompatible
:filetype plugin indent on  " filetype detection[ON] plugin[ON] indent[ON]

" Theme
:set t_Co=256           " enable 256-color mode
:syntax on              " enable syntax highlighting
:colorscheme vividchalk " vividchalk colorscheme

" Formatting and Layout
:set autoindent         " auto-ident
:set tabstop=4          " tab spacing
:set softtabstop=4      " unify tab spacing
:set shiftwidth=4       " ident/outdent by 4 colomns
:set shiftround         " always ident/outdent to nearest tabstop
:set expandtab          " use spaces not tabs
:set smartindent        " automatically insert an extra level of indentation
:set smarttab           " use tabs at the start of a line, spaces elsewhere
:set textwidth=79       " maximum line length is 79

" Misc
:set hlsearch               " highlight all matches
:set clipboard=unnamedplus  " use the system clipboard
:let mapleader=","          " change leader to ,
:let maplocalleader=","     " change local leader to ,
:set hidden                 " buffers and hidden not closed
:set virtualedit=block      " allow cursor anywhere visual block mode
:set shortmess+=I           " do now show the launch screen
:set autoread               " auto load files changed outside of vim
inoremap jj <ESC>

" Remap window movement keys to Control+{arrow, h, j, k, l}
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j
nnoremap <silent> <C-l> <c-w>l
nnoremap <silent> <C-h> <c-w>h
nnoremap <silent> <C-k> <c-w>k
nnoremap <silent> <C-j> <c-w>j

" Functions
" Strip trailing whitespace as per vimcast episode #4,
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" call with <F5> and turn on for all Python files
nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>
autocmd BufWritePre *.py :call <SID>StripTrailingWhitespaces()

" Removes trailing spaces
function TrimWhiteSpace()
  %s/\s*$//
  ''
:endfunction

" Plugins, managed by Pathogen
call pathogen#infect()
call pathogen#helptags()

" Supertab and completions
:set completeopt=longest,menuone
"let g:SuperTabDefaultCompletionType = "<c-p>"
"let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
let g:SuperTabDefaultCompletionType = "context"

:set laststatus=2   " airline always on
