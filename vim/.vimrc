call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'bling/vim-airline'
Plug 'mhinz/vim-grepper'
Plug 'evanmiller/nginx-vim-syntax'
Plug 'ekalinin/Dockerfile.vim'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
Plug 'terryma/vim-expand-region'
" Colorschemes
Plug 'flazz/vim-colorschemes'
Plug 'mhartington/oceanic-next'

if has('nvim')
	Plug 'fatih/vim-go'
	Plug 'Valloric/YouCompleteMe', { 'do': './install.py --gocode-completer' }
	Plug 'neomake/neomake'
	Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'
end

call plug#end()

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
nnoremap <silent> <space>ib <ESC>:normal mzgg=G`zzz<CR>

nnoremap <silent> <leader>q :close!<CR>
nnoremap <silent> <leader>w :only<CR>
nnoremap <silent> <leader>v :vsplit<CR>
nnoremap <silent> <leader>s :w<CR>
nnoremap <silent> <leader>b :call fzf#run({
			\	'source':  reverse(<sid>buflist()),
			\	'sink':    function('<sid>bufopen'),
			\	'options': '+m',
			\	'down':    len(<sid>buflist()) + 2
			\ })<CR>

function! s:buflist()
	redir => ls
	silent ls
	redir END
	return split(ls, '\n')
endfunction

function! s:bufopen(e)
	execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

imap <leader>s <ESC><leader>s
imap fd <ESC>
imap <A-BS> <C-w>
imap <C-g> <ESC>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

vmap y ygv<Esc>
vmap <C-g> <ESC>

xmap <leader>a <plug>(GrepperOperator)

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

" go
au FileType go set completeopt-=preview
au FileType go nmap <space>tr <Plug>(go-rename)
au FileType go nmap <C-]> <Plug>(go-def)

if has('nvim')
	set viminfo='10,\"100,:20,%,n~/.nviminfo

	let g:ycm_key_list_select_completion = ['<C-n>']
	let g:ycm_key_list_previous_completion = ['<C-p>']
	let g:UltiSnipsExpandTrigger='<tab>'
	let g:UltiSnipsJumpForwardTrigger='<tab>'
	let g:UltiSnipsJumpBackwardTrigger='<S-tab>'
	let g:go_def_mode = 'godef'
	let g:go_fmt_command = 'goimports'
endif

set bg=dark
colorscheme OceanicNext
let g:airline_theme='oceanicnext'

if filereadable(expand('~/.vimrc.local'))
	source ~/.vimrc.local
endif

