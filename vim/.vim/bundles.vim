" Install bundles with :BundleInstall command or run it from the console:
" vim --noplugin -u vundles.vim -N "+set hidden" "+syntax on" +BundleClean! +BundleInstall +qall
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle "gmarik/vundle"

" CtrlP
Bundle "kien/ctrlp.vim"
" CtrlP Funky
Bundle "tacahiroy/ctrlp-funky"
" Airline
Bundle "bling/vim-airline.git"
" CamelCaseMotion
Bundle "vim-scripts/camelcasemotion.git"
" Syntastic
Bundle "scrooloose/syntastic.git"
" TComment
Bundle "tomtom/tcomment_vim.git"
" Ultisnips
Bundle "SirVer/ultisnips"
Bundle "honza/vim-snippets"
" YouCompleteMe
Bundle "Valloric/YouCompleteMe"
" Multiple cursors
Bundle "terryma/vim-multiple-cursors"
" Autotag
Bundle "vim-scripts/AutoTag"
" Vim pasta
Bundle "sickill/vim-pasta"
" Jinja syntax
Bundle "estin/htmljinja"
" EasyMotion
Bundle "Lokaltog/vim-easymotion"
" Ag
Bundle "rking/ag.vim"
" Qargs
Bundle "henrik/vim-qargs"
" Lusty Explorer
Bundle "sjbach/lusty"
" Tabular
Bundle "godlygeek/tabular"
" Git stuff
Bundle "mattn/webapi-vim"
Bundle "mattn/gist-vim"
Bundle "tpope/vim-fugitive"
" PHP stuff
Bundle "stephpy/vim-php-cs-fixer"
Bundle "shawncplus/phpcomplete.vim"
Bundle "arnaud-lb/vim-php-namespace"
" Javascript stuff
Bundle "pangloss/vim-javascript"
Bundle "itspriddle/vim-jquery.git"
" Go stuff
Bundle "jnwhiteh/vim-golang"
" Ruby stuff
Bundle "vim-ruby/vim-ruby"
" Moonscript stuff
Bundle "leafo/moonscript-vim"
" Colorschemes
Bundle "flazz/vim-colorschemes"
Bundle "daylerees/colour-schemes", { "rtp": "vim/" }
" Dockerfile
Bundle "ekalinin/Dockerfile.vim"
" Nginx
Bundle "evanmiller/nginx-vim-syntax"

filetype plugin indent on
