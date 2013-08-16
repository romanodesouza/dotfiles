" Vim rather than Vi
set nocompatible
syntax on
let mapleader=","

" Init Vundle
if filereadable(expand("~/.vim/vundles.vim"))
    source ~/.vim/vundles.vim
endif

filetype plugin indent on

" General config
set number
set backspace=indent,eol,start
set history=1000
set showcmd
set noshowmode " Use airline
set visualbell t_vb= " Disable visualbell
set autoread
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
set linebreak " For set wrap
" No folds
set nofoldenable
" Scrolling
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

" Full copy/cut/past simple
inoremap <C-v> <ESC>"+gpa
vnoremap <C-c> "+y
vnoremap <C-x> "+x
" Key mapping for window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" Quick save
inoremap <Leader>s <ESC>:update<CR>
" Smart enter and indention after enter
inoremap {<cr> {<cr>}<Esc><S-o>
inoremap [<cr> [<cr>]<Esc><S-o>
inoremap (<cr> (<cr>)<Esc><S-o>
" Full file indent
noremap <Leader>ff <ESC>:normal mzgg=G`zzz<CR>
" Clear the highlight
nnoremap <Leader>h :nohls<CR>
inoremap <Leader>h <ESC>:nohls<CR>

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

" Colorscheme
if (!has("gui_running"))
    colorscheme kellys
endif

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
augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

" Set the fileformat
autocmd BufWinEnter * set formatoptions-=o " don't continue comments when pushing o/O

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

" Local conf
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
