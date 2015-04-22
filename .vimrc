" Fortran fixed length source
":let fortran_fixed_source=1
":let fortran_have_tabs=1

" Python Tab settings (<TAB> to be 4 spaces)
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set expandtab
:set textwidth=80
:set softtabstop=4
:set autoindent


" Highlighting
:set hlsearch

:filetype plugin indent on
:syntax on

:set t_Co=256
:colorscheme default


"folding settings
:set foldmethod=indent   "fold based on indent
:set foldnestmax=4       " maximum fold is 4 leveles
:set nofoldenable        " folds are off by default


" Strip trailing whitespace as per vimcast episode #4, 
" call with <F5> and turn on for all Python files 
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

nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>
autocmd BufWritePre *.py :call <SID>StripTrailingWhitespaces()

" Removes trailing spaces
function TrimWhiteSpace()
  %s/\s*$//
  ''
:endfunction

":autocmd FileType python set omnifunc=pythoncomplete#Complete

" Uncomment the following for zenburn late night coding sessions
":set t_Co=256
":let g:zenburn_high_Contrast = 1
":colorscheme zenburn
":hi search ctermbg=223 ctermfg=238
":hi incsearch ctermbg=216 ctermfg=242

vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars


"Remap window movement keys
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j

nnoremap <silent> <C-l> <c-w>l
nnoremap <silent> <C-h> <c-w>h
nnoremap <silent> <C-k> <c-w>k
nnoremap <silent> <C-j> <c-w>j

:set clipboard=unnamedplus

call pathogen#infect()
call pathogen#helptags()
let g:SuperTabDefaultCompletionType = "<c-p>"
"let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
let g:SuperTabDefaultCompletionType = "context"
:set completeopt=longest,menuone
