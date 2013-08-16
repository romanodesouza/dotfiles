" Disable visualbell
set visualbell t_vb=
" For better reading
set linespace=4
" Font
set guifont=Monospace\ 10 
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
" Command completion
set wildmenu
set wildmode=list:longest
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
" Size
set lines=30
set columns=100

" Colorscheme
colorscheme Earthsong

" Mouse's behaviour
behave mswin

" Better tab navigation
map <C-S-PageUp> :tabm +1<CR>
map <C-S-PageDown> :tabm -1<CR>

" Local conf
if filereadable(expand("~/.gvimrc.local"))
    source ~/.gvimrc.local
endif
