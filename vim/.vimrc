call plug#begin('~/.vim/plugged')

  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'bling/vim-airline'
  Plug 'mhinz/vim-grepper'
  Plug 'evanmiller/nginx-vim-syntax'
  Plug 'ekalinin/Dockerfile.vim'
  Plug 'flazz/vim-colorschemes'
  Plug 'mattn/webapi-vim'
  Plug 'mattn/gist-vim'
  Plug 'scrooloose/syntastic'

call plug#end()

let mapleader = ","

set nocompatible
set relativenumber
set number
set backspace=indent,eol,start
set history=1000
set showcmd
set noshowmode
set visualbell t_vb=
set hidden
set title
set fileformats=unix,mac,dos
set ruler
set showmatch
set t_Co=256
set mouse=a
set mousehide
set laststatus=2
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan
set noswapfile
set nobackup
set nowb
set autoindent
set smartindent
set noexpandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=4
set tabstop=4
set wrap
set linebreak
set nofoldenable
set scrolloff=8
set sidescrolloff=15
set sidescroll=1
set clipboard=unnamedplus
set viminfo='10,\"100,:20,%,n~/.viminfo

nnoremap <leader>a :Ag<space>

nnoremap <space>s /
nnoremap <space>r ?
nnoremap <silent> <space>pf :FZF<CR>
nnoremap <silent> <space> :nohls<CR>
nnoremap <silent> <space>if <ESC>:normal mzgg=G`zzz<CR>

nnoremap <silent> <leader>q :close!<CR>
nnoremap <silent> <leader>w :only<CR>
nnoremap <silent> <leader>e $
nnoremap <silent> <leader>v :vsplit<CR>
nnoremap <silent> <leader>s :wa<CR>
nnoremap <silent> <leader>b :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

imap <leader>e <ESC>A
imap <leader>s <ESC><leader>s
imap fd <ESC>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

vmap y ygv<Esc>

xmap <leader>a <plug>(GrepperOperator)

cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-d> <Delete>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>d <S-right><C-w><Delete>
cnoremap <Esc><Backspace> <C-w><Delete>
cnoremap <C-g> <C-c>

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

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

function! ResCur()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

if (!has("gui_running"))
    colorscheme kellys
    if filereadable(expand("~/.vimrc.local"))
        source ~/.vimrc.local
    endif
endif
