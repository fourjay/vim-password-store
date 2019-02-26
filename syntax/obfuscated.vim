if exists('b:current_syntax') | finish|  endif

if execute('highlight CursorLine') =~# 'xxx term=underline cterm=underline guibg=Grey40'
    echohl WarningMsg
    echo 'cursorline expected for obfuscation, manually setting'
    echohl None
    highlight CursorLine term=underline ctermbg=gray guibg=Grey40
endif

setlocal cursorline

" set redacted colors from colorscheme
" regular passwords are Comment
let s:comment_guifg = password_store#get_highight('Comment', 'guifg')
let s:comment_ctermfg = password_store#get_highight('Comment', 'ctermfg')

" short passwords are Error
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
