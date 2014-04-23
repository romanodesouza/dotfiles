" Extensions
let g:ctrlp_extensions=['funky']
" Default to filename searches
let g:ctrlp_by_filename=0
" Force Ctrl P plugin to not clear the cache
let g:ctrlp_clear_cache_on_exit=0
" Buffer tag searching for functions only
" nnoremap <c-b> :CtrlPBufTag<CR>
nnoremap <c-b> :CtrlPFunky<Cr>
let g:ctrlp_buftag_types={
    \ 'php': '--PHP-kinds=+f-vc'
\}
let g:ctrlp_max_files=0
