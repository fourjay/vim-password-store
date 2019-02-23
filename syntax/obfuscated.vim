if exists('b:current_syntax') | finish|  endif

setlocal cursorline

" set redacted colors from colorscheme
let s:error_highlight_str = execute( 'highlight Error' )
let s:error_fg = matchstr(s:error_highlight_str, 'guifg=\zs\S*')

let s:comment_highlight_str = execute( 'highlight Comment' )
let s:comment_fg = matchstr(s:comment_highlight_str, 'guifg=\zs\S*')

execute 'highlight password_store_password ' .
            \ ' guibg=' . s:comment_fg .
            \ ' guifg=' . s:comment_fg .
            \ ' ctermfg=1 ctermbg=1'

execute 'highlight password_store_password_short ' .
            \ ' guibg=' . s:error_fg .
            \ ' guifg=' . s:error_fg .
            \ ' ctermfg=1 ctermbg=1'

