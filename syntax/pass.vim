if exists('b:current_syntax') | finish|  endif

" first line (by convention always a single pasword
syntax match password_store_password /\%1l.*/
highlight password_store_password guifg=DarkGray guibg=DarkGray ctermfg=8 ctermbg=8

" colon field value is the suggested path for additional information
syntax match password_store_header '\v^[^:]+:'
highlight link password_store_header PreProc


