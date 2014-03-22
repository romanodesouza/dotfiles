" Vim rather than Vi
set nocompatible
syntax on
let mapleader=","

" Init bundles
if filereadable(expand("~/.vim/bundles.vim"))
    source ~/.vim/bundles.vim
endif

if filereadable(expand("~/.vim/bundles.vim.local"))
    source ~/.vim/bundles.vim.local
endif

filetype plugin indent on

" General config
set relativenumber
set number " "number" and "relativenumber" can live together!! xD
set backspace=indent,eol,start
set history=1000
set showcmd
set noshowmode " Use airline
set visualbell t_vb= " Disable visualbell
set hidden
set title
set fileformats=unix,mac,dos
set ruler
set cursorline
set showmatch
set t_Co=256
set mouse=a
set mousehide
set pastetoggle=<F2>
set laststatus=2
" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan
" No backup files
set noswapfile
set nobackup
set nowb
" Indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
" No wrap
set nowrap
set linebreak " This is for 'set wrap'
" No folds
set nofoldenable
" Scrolling
set scrolloff=8
set sidescrolloff=15
set sidescroll=1
" Completion
set completeopt-=preview " No preview
autocmd FileType css            setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown  setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript     setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python         setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml            setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby           setlocal omnifunc=rubycomplete#Complete
autocmd FileType haskell        setlocal omnifunc=necoghc#omnifunc
" Command completion
set wildmenu
set wildmode=list:longest
" stuff to ignore when tab completing
set wildignore=*.o,*.obj,*~
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.exe,*.dll
set wildignore+=*.tar
set wildignore+=*.swf
set wildignore+=*.crx
set wildignore+=*.doc
" Select all
nnoremap <C-a> ggvG$
" Full copy/cut/past simple
inoremap <C-v> <ESC>"+gpa
vnoremap <C-c> "+y
vnoremap <C-x> "+x
" Quick save
inoremap <Leader>s <ESC>:update<CR>
nnoremap <Leader>s <ESC>:update<CR>
" Smart enter and indentation after enter
inoremap {<cr> {<cr>}<Esc><S-o>
inoremap [<cr> [<cr>]<Esc><S-o>
inoremap (<cr> (<cr>)<Esc><S-o>
" Full file indent
noremap <Leader>ff <ESC>:normal mzgg=G`zzz<CR>
" Clear the highlight
nnoremap <silent> <Leader>h :nohls<CR>
imap <silent> <Leader>h <ESC><Leader>h
" Home key goes to first non blank character
noremap <Home>  ^
inoremap <Home> <ESC>^<Insert>
imap <C-a> <Home>
imap <C-e> <End>
" Tab switching
nnoremap <silent> <S-PageUp> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <S-PageDown> :execute 'silent! tabmove ' . tabpagenr()<CR>
imap <S-PageUp> <ESC><S-PageUp>a
imap <S-PageDown> <ESC><S-PageDown>a
" Open new tab
nnoremap <silent> <Leader>t :tabnew<CR>
imap <silent> <Leader>t <ESC><Leader>t<Insert>
" Goes to normal mode
imap <Leader>n <ESC>
" Better splitted window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" Git conflicts
map <Leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>
" Filesystem explorer
noremap <F3> :Explore<CR>
inoremap <F3> <ESC>:Explore<CR>

" Abbreviations for exit
cab qw wq
cab Qw wq
cab qW wq
cab QW wq
cab W  w
cab Wq wq
cab wQ wq
cab WQ wq
cab Q  q
cab Wall wall
cab WAll wall
cab Qall qall
cab QAll qall

" ---------------------------------------------------------------------------------------------------"
" Tell vim to remember certain things when we exit
"
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
" ---------------------------------------------------------------------------------------------------"
set viminfo='10,\"100,:20,%,n~/.viminfo

function! ResCur()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

" Striping whitespaces
function! StripTrailingWhitespaces()
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

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

" Set the fileformat
" don't continue comments when pushing o/O and return carriage
autocmd FileType * set formatoptions-=o formatoptions-=r

" Function: Open tag under cursor in new tab
" Source:   http://stackoverflow.com/questions/563616/vimctags-tips-and-tricks
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Init Bundle Settings
if filereadable(expand("~/.vim/bundle-settings.vim"))
    source ~/.vim/bundle-settings.vim
endif

" Setup extra filetypes
if filereadable(expand("~/.vim/extra-filetypes.vim"))
    source ~/.vim/extra-filetypes.vim
endif

if (!has("gui_running"))
    " Colorscheme
    colorscheme kellys
    " Local conf
    if filereadable(expand("~/.vimrc.local"))
        source ~/.vimrc.local
    endif
endif

