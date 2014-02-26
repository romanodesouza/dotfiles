" Default to filename searches
let g:ctrlp_by_filename=1
" Force Ctrl P plugin to not clear the cache
let g:ctrlp_clear_cache_on_exit=0
" Buffer tag searching for functions only
nnoremap <c-k> :CtrlPBufTag<CR>
let g:ctrlp_buftag_types={
    \ 'php': '--PHP-kinds=+f-vc'
\}
" On git projects, use it to list the files tracked and to be tracked
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
