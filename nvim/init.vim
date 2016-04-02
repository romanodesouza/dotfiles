set rtp+=~/.vim
source ~/.vimrc

let g:ctrlp_map = '<no-binding>'
let g:ctrlp_prompt_mappings = {
\ 'PrtSelectMove("j")':   ['<c-j>', '<down>', '<c-n>'],
\ 'PrtSelectMove("k")':   ['<c-k>', '<up>', '<c-p>'],
\ 'PrtHistory(-1)':       [],
\ 'PrtHistory(1)':        [],
\ }
let g:ctrlp_funky_syntax_highlight = 1

nnoremap <silent> <leader>d :CtrlPFunky<CR>
