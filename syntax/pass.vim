if exists('b:current_syntax') | finish|  endif

" first line (by convention always a single pasword
syntax match password_store_password /\%1l.*/
highlight link password_store_password Comment

" colon field value is the suggested path for additional information
syntax match password_store_header '\v^[^:]+:'
highlight link password_store_header PreProc


