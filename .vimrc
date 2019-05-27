set nocompatible
filetype plugin indent on  " filetype detection[ON] plugin[ON] indent[ON]

" Theme
:colorscheme vividchalk " vividchalk colorscheme
:set t_Co=256           " enable 256-color mode
:syntax on              " enable syntax highlighting

" Formatting and Layout
:set autoindent         " auto-ident
:set tabstop=4          " tab spacing
:set softtabstop=4      " unify tab spacing
:set shiftwidth=4       " ident/outdent by 4 colomns
:set shiftround         " always ident/outdent to nearest tabstop
:set expandtab          " use spaces not tabs
:set smarttab           " use tabs at the start of a line, spaces elsewhere
:set textwidth=79       " maximum line length is 79

" Misc
:set hlsearch               " highlight all matches
:set clipboard=unnamed      " use the system clipboard
:let mapleader=","          " change leader to ,
:let maplocalleader=","     " change local leader to ,
:set hidden                 " buffers and hidden not closed
:set virtualedit=block      " allow cursor anywhere visual block mode
:set shortmess+=I           " do now show the launch screen
:set autoread               " auto load files changed outside of vim
:set mouse=a                " mouse support in vim
:set mousemodel=popup
:set laststatus=2           " status line always on
:set ruler                  " line and colume on status line
set backspace=indent,eol,start " backspace over indents, end of line, etc
set incsearch               " jump to searches while typing
set formatoptions+=j        " Delete comment characters when joining lines

" Spell checking
"set spell spelllang=en_us
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red
"nnoremap <C-u> ea<C-X>s

" Borrowed from How to Do 90% of What Plugins Do (with just Vim)
" Max Cantor
" https://www.youtube.com/watch?v=XA2WjJbmmoM&t=3474s

" file jumping, use :find pattern<tab> to search for files
set path+=**   " search into subfolders with :find
set wildmenu   " display all matching file when tab is pressed

" tag jumping
command! MakeTags !ctags -R .
" Use ^] to jump to a tag under the cursor
" g^] for ambiguous tags
" ^t to jump back up the tag stack

" Remap window movement keys to Control+{arrow, h, j, k, l}
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j
nnoremap <silent> <C-l> <c-w>l
nnoremap <silent> <C-h> <c-w>h
nnoremap <silent> <C-k> <c-w>k
nnoremap <silent> <C-j> <c-w>j

" File specific formatting over-rides
autocmd FileType yaml setlocal ts=2 expandtab sts=2 sw=2
autocmd FileType python setlocal omnifunc=python3complete#Complete

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
let g:SuperTabDefaultCompletionType = "context"
" Completion chaining, fall back to <c-p> when omnicomplete returns no results
autocmd FileType *
    \ if &omnifunc != '' |
    \   call SuperTabChain(&omnifunc, "<c-p>") |
    \ endif
