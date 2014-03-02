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
" snipMate
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"
" Multiple cursors
Bundle "terryma/vim-multiple-cursors"
" Autotag
Bundle "vim-scripts/AutoTag"
" Jinja syntax
Bundle "estin/htmljinja"
" EasyMotion
Bundle "Lokaltog/vim-easymotion"
" Ag
Bundle "rking/ag.vim"
" Qargs
Bundle "henrik/vim-qargs"
" Emmet
Bundle "mattn/emmet-vim"
" Lusty Explorer
Bundle "sjbach/lusty"
" Git stuff
Bundle "mattn/webapi-vim"
Bundle "mattn/gist-vim"
" PHP stuff
Bundle "stephpy/vim-php-cs-fixer"
Bundle "shawncplus/phpcomplete.vim"
Bundle "arnaud-lb/vim-php-namespace"
" Javascript stuff
Bundle "pangloss/vim-javascript"
Bundle "itspriddle/vim-jquery.git"
" Colorschemes
Bundle "flazz/vim-colorschemes"
Bundle "daylerees/colour-schemes", { "rtp": "vim-themes/" }

filetype plugin indent on
