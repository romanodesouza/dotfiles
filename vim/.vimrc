call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'bling/vim-airline'
Plug 'evanmiller/nginx-vim-syntax'
Plug 'ekalinin/Dockerfile.vim'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
Plug 'terryma/vim-expand-region'
Plug 'tomtom/tcomment_vim'
Plug 'flazz/vim-colorschemes'
Plug 'mhartington/oceanic-next'

call plug#end()

" recover last buffer position
augroup resCur
	autocmd!
	autocmd BufWinEnter * call ResCur()
augroup END

function! ResCur()
	if line("'\"") <= line("$")
		normal! g`"
		return 1
	endif
endfunction

command -nargs=* GitGrep
  \ call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>).
  \ " -- './*' '!vendor/' '!node_modules/'", 0, 0)

let mapleader = ","

" no vi compatibility
set nocompatible

" side numbers
set relativenumber
set number

" fix backspace key
set backspace=indent,eol,start
" no visualbell
set visualbell t_vb=
" unload closed buffers
set hidden
" highlight pair match like (), [] or {}
set showmatch
" 256 colors on terminal
set t_Co=256

" airline
set noshowmode
set laststatus=2

" enable mouse
set mouse=a
set mousehide

" search
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan

" nobackup
set noswapfile
set nobackup
set nowb

" indent
set autoindent
set smartindent
set noexpandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=4
set tabstop=4

" wrap lines
set wrap
set linebreak

" no fold
set nofoldenable

" scroll
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

" clipboard cross compatible with X
set clipboard=unnamedplus

set viminfo='10,\"100,:20,%,n~/.viminfo
set history=1000
set fileformats=unix,mac,dos
set ruler
set title

nnoremap <leader>a :GitGrep<space>
nnoremap <space>s /
nnoremap <space>r ?
nnoremap <silent> <space>pf :FZF<CR>
nnoremap <silent> <space> :nohls<CR>
nnoremap <silent> <space>ib <ESC>:normal mzgg=G`zzz<CR>
nnoremap <silent> <leader>q :close!<CR>
nnoremap <silent> <leader>w :only<CR>
nnoremap <silent> <leader>v :vsplit<CR>
nnoremap <silent> <leader>s :w<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <space><space> :Commands<CR>
nnoremap <silent> <leader>d :BLines<CR>
nnoremap <silent> <leader>e $
" soft line navigation
nnoremap j gj
nnoremap k gk

imap <leader>s <ESC><leader>s
imap <leader>e <ESC><leader>e
imap fd <ESC>
imap <A-BS> <C-w>
imap <C-g> <ESC>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <leader>c :TComment<CR>

vmap y ygv<Esc>
vmap <C-g> <ESC>

xmap <leader>a "yy:<C-u>GitGrep <c-r>y<CR>
xmap <space>s /
xmap <space>r ?

cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-d> <Delete>
cnoremap <C-g> <C-c>
cnoremap <A-BS> <C-w>

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

syntax on

au FileType php nmap <leader>d :BLines function <CR>
au FileType go nmap<leader>d :BLines func{ <CR>
au FileType python nmap<leader>d :BLines def: <CR>

set bg=dark
colorscheme OceanicNext
let g:airline_theme='oceanicnext'

if filereadable(expand('~/.vimrc.local'))
	source ~/.vimrc.local
endif
