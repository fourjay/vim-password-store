if exists('b:current_syntax') | finish|  endif
if g:password_store_settings.enable_syntax != 'true' | finish | endif

" set redacted colors from colorscheme
let s:error_highlight_str = execute( 'highlight Error' )
let s:error_fg = matchstr(s:error_highlight_str, 'guifg=\zs\S*')

let s:comment_highlight_str = execute( 'highlight Comment' )
let s:comment_fg = matchstr(s:comment_highlight_str, 'guifg=\zs\S*')

" first line (by convention always a single pasword)
syntax match password_store_password /\%1l.*/
execute 'highlight password_store_password ' .
            \ ' guibg=' . s:comment_fg .
            \ ' guifg=' . s:comment_fg .
            \ ' ctermfg=1 ctermbg=1'

" highlight short passwords
syntax match password_store_password_short /\%1l.\{,6\}$/
" highlight password_store_password_short guifg=Red guibg=Red ctermfg=1 ctermbg=1
execute 'highlight password_store_password_short ' .
            \ ' guibg=' . s:error_fg .
            \ ' guifg=' . s:error_fg .
            \ ' ctermfg=1 ctermbg=1'

" colon field value is the suggested path for additional information
syntax match password_store_header '\v^[^:]+:'
highlight link password_store_header PreProc


