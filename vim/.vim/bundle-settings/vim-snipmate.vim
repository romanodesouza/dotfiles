" Set the extra snippets dir in the rtp
set rtp+=~/.vim/bundle-settings/vim-snipmate/

let g:snipMate={}
let g:snipMate.scope_aliases={}
" Let only php snippets on php filetype
let g:snipMate.scope_aliases['php']='php'
