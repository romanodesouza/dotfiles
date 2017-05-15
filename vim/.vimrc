call plug#begin('~/.vim/plugged')

" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" airline
Plug 'bling/vim-airline'

" nginx support
Plug 'evanmiller/nginx-vim-syntax'

" Dockerfile support
Plug 'ekalinin/Dockerfile.vim'

" expand region
Plug 'terryma/vim-expand-region'

" gist
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'

" TComment
Plug 'tomtom/tcomment_vim'
let g:tcommentMapLeader1='<C-;>'

" Detect buffer indentation
Plug 'tpope/vim-sleuth'

" Strip trailing white spaces
Plug 'ntpeters/vim-better-whitespace'
autocmd BufEnter * EnableStripWhitespaceOnSave

" Distraction-free mode
Plug 'junegunn/Goyo.vim'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<S-tab>'

" YouCompleteMe
Plug 'Valloric/YouCompleteMe'
let g:ycm_key_list_select_completion = ['<C-n>']
let g:ycm_key_list_previous_completion = ['<C-p>']

" Go
Plug 'fatih/vim-go'
let g:go_def_mode = 'godef'
let g:go_fmt_command = 'goimports'
au FileType go nmap<leader>d :BLines func{ <CR>
au FileType go nmap <C-]> <Plug>(go-def)
au FileType go nmap <leader>r <Plug>(go-rename)
au FileType go nmap <leader>gr <Plug>(go-referrers)

" TypeScript
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi', { 'for': 'typescript', 'do': 'yarn' }
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" PHP
au FileType php nmap <leader>d :BLines function <CR>

" Python
au FileType python nmap<leader>d :BLines def: <CR>

" Themes
Plug 'flazz/vim-colorschemes'
Plug 'mhartington/oceanic-next'

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
nnoremap <silent> <space>o :FZF<CR>
nnoremap <silent> <space>p :FZF<CR>
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

" clear highlight search before changing mode or moving
nnoremap <silent>i <ESC>:nohls<CR>i
nnoremap <silent>o <ESC>:nohls<CR>o
nnoremap <silent>c <ESC>:nohls<CR>c
nnoremap <silent>I <ESC>:nohls<CR>I
nnoremap <silent>O <ESC>:nohls<CR>O
nnoremap <silent>C <ESC>:nohls<CR>C
nnoremap <silent>A <ESC>:nohls<CR>A
nnoremap <silent>v <ESC>:nohls<CR>v
nnoremap <silent><S-v> <ESC>:nohls<CR><S-v>
nnoremap <silent><C-v> <ESC>:nohls<CR><C-v>
nnoremap <silent>h <ESC>:nohls<CR>h
nnoremap <silent>l <ESC>:nohls<CR>l
nnoremap <silent>j <ESC>:nohls<CR>j
nnoremap <silent>k <ESC>:nohls<CR>k

imap <leader>s <ESC><leader>s
imap <leader>e <ESC><leader>e
imap fd <ESC>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <leader>c :TComment<CR>

vmap y ygv<Esc>
vmap <C-g> <ESC>

" git grep selection
xmap <leader>a "yy:<C-u>GitGrep <c-r>y<CR>
xmap <space>s /
xmap <space>r ?

" emacs key bindings
imap <C-_> <C-o>u
imap <A-BS> <C-w>
imap <C-g> <ESC>
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-a> <C-o>I
imap <C-e> <End>
imap <C-d> <Del>
imap <C-h> <BS>
imap <C-k> <C-o>D
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-d> <Delete>
cnoremap <C-g> <C-c>
cnoremap <A-BS> <C-w>
nnoremap <C-_> u
nnoremap <silent><C-g> <ESC>:nohls<CR><C-g>

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
cab q1 q!
cab w1 w!
cab wq1 wq!

syntax on
set bg=dark
colorscheme OceanicNext
let g:airline_theme='oceanicnext'

if filereadable(expand('~/.vimrc.local'))
	source ~/.vimrc.local
endif
