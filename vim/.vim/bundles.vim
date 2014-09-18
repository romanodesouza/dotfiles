" Install bundles with :BundleInstall command or run it from the console:
" vim --noplugin -u vundles.vim -N "+set hidden" "+syntax on" +BundleClean! +BundleInstall +qall
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle "gmarik/vundle"

" CtrlP
Bundle "kien/ctrlp.vim"
" Airline
Bundle "bling/vim-airline.git"
" CamelCaseMotion
Bundle "vim-scripts/camelcasemotion.git"
" Syntastic
Bundle "scrooloose/syntastic.git"
" TComment
Bundle "tomtom/tcomment_vim.git"
" Vim pasta
Bundle "sickill/vim-pasta"
" Git stuff
Bundle "mattn/webapi-vim"
Bundle "mattn/gist-vim"
Bundle "tpope/vim-fugitive"
" Dockerfile
Bundle "ekalinin/Dockerfile.vim"
" Nginx
Bundle "evanmiller/nginx-vim-syntax"
" Colorschemes
Bundle "flazz/vim-colorschemes"
Bundle "daylerees/colour-schemes", { "rtp": "vim/" }
Bundle "ChrisKempson/Tomorrow-Theme", { "rtp": "vim/" }

filetype plugin indent on
