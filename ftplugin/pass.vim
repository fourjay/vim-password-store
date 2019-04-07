if exists('did_pass_ftplugin') || &compatible  || v:version < 700
    finish
endif
let g:did_pass = 'did_pass_ftplugin'
let s:save_cpo = &cpoptions
set cpoptions&vim

nmap <buffer> <Plug>rotate_password :call password_store#replace()<Cr>
if ! hasmapto( '\<Plug>rotate_password', 'n')
    nmap <C-X> <Plug>rotate_password
endif

setlocal nospell


" Check whether we should set redacting options or not
function! s:CheckArgsRedact()

  " Ensure there's one argument and it's the matched file
  if argc() != 1 || fnamemodify(argv(0), ':p') !=# expand('<afile>:p')
    return
  endif

  " Disable all the leaky options globally
  set nobackup
  set nowritebackup
  set noswapfile
  set viminfo=
  if has('persistent_undo')
    set noundofile
  endif

  " Tell the user what we're doing so they know this worked, via a message and
  " a global variable they can check
  echomsg 'Editing password file--disabled leaky options!'
  let g:redact_pass_redacted = 1

endfunction

call s:CheckArgsRedact()

function! s:reveal_pass() abort
    setlocal syntax=pass
endfunction
command! Reveal call <SID>reveal_pass()

function! s:conceal_pass() abort
    setlocal syntax=pass.obfuscated
endfunction
command! Conceal call <SID>conceal_pass()
normal! GG

" Cleanup at end
let &cpoptions = s:save_cpo
