call plug#begin('~/.vim/plugged')

" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" airline
Plug 'bling/vim-airline'
let g:airline#extensions#lsp#enabled = 1
" Dockerfile support
Plug 'ekalinin/Dockerfile.vim'
" gist
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
" Strip trailing white spaces
Plug 'ntpeters/vim-better-whitespace'
autocmd BufEnter * EnableStripWhitespaceOnSave
" Themes
Plug 'mhartington/oceanic-next'
Plug 'sainnhe/edge'
" Commentary
Plug 'tpope/vim-commentary'
" Multiple cursors
Plug 'terryma/vim-multiple-cursors'
" LSP
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'
let g:lsp_signs_enabled = 0         	" disable signs
let g:lsp_diagnostics_echo_cursor = 1	" enable echo under cursor when in normal mode
" Git messenger
Plug 'rhysd/git-messenger.vim'
let g:git_messenger_no_default_mappings = 1
let g:git_messenger_always_into_popup = 1
nmap <space>gm <Plug>(git-messenger)
" nohls after moving cursor
Plug 'junegunn/vim-slash'

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
" no preview on completion
set completeopt-=preview
" https://unix.stackexchange.com/a/400717
set t_BE=

set viminfo='10,\"100,:20,%,n~/.viminfo
set history=1000
set fileformats=unix,mac,dos
set ruler
set title

nnoremap <leader>a :GitGrep<space>
nnoremap <space>s /
nnoremap <space>r ?
nnoremap <silent> <space>o :FZF<CR>
nnoremap <silent> <leader>q :bd!<CR>
nnoremap <silent> <leader>w :only<CR>
nnoremap <silent> <leader>v :vsplit<CR>
nnoremap <silent> <leader>s :w<CR>:nohls<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>d :BLines<CR>
" soft line navigation
nnoremap j gj
nnoremap k gk
" save on insert mode
imap <leader>s <ESC><leader>s
imap <leader>e <ESC>A
imap fd <ESC>
" Enable <cr> on auto complete pop up
inoremap <expr> <cr> ((pumvisible())?("\<C-y>"):("\<cr>"))
" better window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" put the cursor in the end of selection
vmap y ygv<Esc>
" git grep selection
xmap <leader>a "yy:<C-u>GitGrep <c-r>y<CR>
xmap <space>s /
xmap <space>r ?
" commentary
xmap <silent> <leader>c <Plug>Commentary
" emacs key bindings
vmap <C-g> <ESC>
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

" quit
cab Q q
cab Qa qa
cab qA qa
cab QA qa

syntax on

if !empty($ALACRITTY_LOG) 		" Alacritty
	set bg=light
	silent! colorscheme edge
else							" Terminator
	set bg=dark
	silent! colorscheme OceanicNext
	let g:airline_theme='oceanicnext'
endif

function s:lsp_settings()
	setlocal omnifunc=lsp#complete signcolumn=no
	nmap <buffer> <C-]> <Plug>(lsp-type-definition) <CR>
	nmap <buffer> K <Plug>(lsp-hover)
	nmap <buffer> <space>en <Plug>(lsp-next-diagnostic)
	nmap <buffer> <space>ep <Plug>(lsp-previous-diagnostic)
endfunction

" Golang
autocmd BufWritePre *.go call execute('LspCodeActionSync source.organizeImports')
autocmd FileType go call s:lsp_settings()
autocmd FileType go nmap <buffer> <leader>d :BLines ^type\\|^func <CR>
autocmd FileType go nmap <buffer> <space>gt :term go test -v <CR>
autocmd FileType go nmap <buffer> <space>gi :term go install <CR>

if filereadable(expand('~/.vimrc.local'))
	source ~/.vimrc.local
endif
