" setup known state
if exists('did_password_store') 
      "  || &compatible 
      "  || version < 700}
    finish
endif
let g:did_password_store = '1'
let s:save_cpo = &cpoptions
set compatible&vim
"echo 'main code'}}
" Return vim to users choice
function! password_store#generate() abort
    if executable('pwgen')
        return systemlist('pwgen -N1 ' . g:password_store_pw_length )[0]
    endif
endfunction

function! password_store#replace() abort
    execute 's/\<.*\>/' . password_store#generate() . '/'
endfunction

let &cpoptions = s:save_cpo
