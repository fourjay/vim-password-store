function! password_store#generate() abort
    if executable('pwgen')
        let l:result =  systemlist('pwgen -N1 ' . password_store#setting('pw_length') )
        return l:result[0]
    endif
endfunction

function! password_store#replace() abort
    execute 's/\<.*\>/' . password_store#generate() . '/'
endfunction

let s:default_settings = {
            \    'pw_length' : '12',
            \    'enable_syntax' : 'true',
            \ }

function! password_store#setting(key)
    if exists('g:password_store_settings') && has_key(g:password_store_settings, a:key)
        return g:password_store_settings[a:key]
    else
        return s:default_settings[a:key]
    endif
endfunction

function! password_store#get_highight(group, key) abort
    let l:hl_line = execute( 'highlight ' . a:group)
    let l:key = matchstr(l:hl_line, a:key . '=\zs\S*')
    return l:key
endfunction
