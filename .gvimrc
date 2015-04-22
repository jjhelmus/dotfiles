" gvim specifics
:set lines=50 columns=80
:set visualbell t_vb=
:colorscheme vividchalk
:set ballooneval

function! Foobar()
    :set columns=161
    :vsplit
endfunction


function! Foobar2()
    :TbStart
    :set columns=161
    :NERDTree
    :vsplit
endfunction
