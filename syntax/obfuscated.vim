if exists('b:current_syntax') | finish|  endif

setlocal cursorline

" set redacted colors from colorscheme
let s:error_highlight_str = execute( 'highlight Error' )
let s:error_fg = matchstr(s:error_highlight_str, 'guifg=\zs\S*')

let s:comment_guifg = password_store#get_highight('Comment', 'guifg')
let s:comment_ctermfg = password_store#get_highight('Comment', 'ctermfg')

let s:error_guifg = password_store#get_highight('Error', 'guifg')
let s:error_ctermfg = password_store#get_highight('Error', 'ctermfg')

execute 'highlight password_store_password ' .
            \ ' guibg=' . s:comment_guifg .
            \ ' guifg=' . s:comment_guifg .
            \ ' ctermfg=' . s:comment_ctermfg
            \  'ctermbg=' . s:comment_ctermfg

execute 'highlight password_store_password_short ' .
            \ ' guibg=' . s:error_guifg .
            \ ' guifg=' . s:error_guifg .
            \ ' ctermfg=' . s:error_ctermfg
            \  'ctermbg=' . s:error_ctermfg
