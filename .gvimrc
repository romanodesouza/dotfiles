" Disable visualbell
set visualbell t_vb=
" For better reading
set linespace=4
" Font
set guifont=DejaVu\ Sans\ Mono\ 10
" No menu bar
set guioptions-=m
" No toolbar
set guioptions-=T
" No scroll bars
set guioptions=-r
set guioptions-=r
set guioptions-=l
set guioptions-=b
" Disable cursor blinking
set guicursor+=a:blinkon0
" Size
set lines=30
set columns=100

" Mouse's behaviour
behave mswin

" Local conf
if filereadable(expand("~/.gvimrc.local"))
    source ~/.gvimrc.local
endif
