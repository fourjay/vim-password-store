" this is mostly from Tom Ryders plugin
" with deleyed obfuscation syntax
autocmd VimEnter
            \ /dev/shm/pass.?*/?*.txt
            \,/dev/shm/gopass-edit*/secret
            \,$TMPDIR/pass.?*/?*.txt
            \,/tmp/pass.?*/?*.txt
            \ setlocal filetype=pass |
            \ if password_store#setting('enable_syntax') ==# 'true' | setlocal syntax=pass.obfuscated | endif
