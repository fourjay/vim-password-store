" detect password-store files
if exists('did_pass') || &compatible  || version < 700
    finish
endif
let g:did_pass = 'did_pass'
let s:save_cpo = &cpoptions
set compatible&vim

" this is straight from Tom Ryders plugin

autocmd VimEnter
            \ /dev/shm/pass.?*/?*.txt
            \,/dev/shm/gopass-edit*/secret
            \,$TMPDIR/pass.?*/?*.txt
            \,/tmp/pass.?*/?*.txt
            \ setlocal filetype=pass |
            \ if password_store#setting('enable_syntax') ==# 'true' | setlocal syntax=pass.obfuscated | endif

" Cleanup at end
let &cpoptions = s:save_cpo
