" balanceado.vim - Intuitive insertion of balanced delimiters
"
" Author: Francisco Giordano <frangio.1@gmail.com>
" License: MIT License

function! balanceado#InsertEnter()
  let s:stack = s:stack_init()
endfunction

function! balanceado#Esc()
  return s:stack_undo(s:stack) . "\<Esc>"
endfunction

function! balanceado#BS()
  let l:char = matchstr(getline('.'), '\%' . (col('.') - 1) . 'c.')
  call s:stack_pop(s:stack, l:char)
  return "\<BS>"
endfunction

function! balanceado#character(char)
  call s:stack_push(s:stack, a:char)
  return a:char
endfunction


function! s:stack_init()
  return []
endfunction

function! s:stack_undo(stack)
  return join(a:stack, '')
endfunction

function! s:stack_push(stack, char)
  if s:is_open(a:char)
    call insert(a:stack, s:get_close(a:char))
  elseif s:is_close(a:char)
    if len(a:stack) > 0
      call remove(a:stack, 0)
    endif
  endif
endfunction

function! s:stack_pop(stack, char)
  if s:is_close(a:char)
    call insert(a:stack, a:char)
  elseif s:is_open(a:char)
    if len(a:stack) > 0
      call remove(a:stack, 0)
    endif
  endif
endfunction


function! s:is_open(char)
  return a:char ==# '('
endfunction

function! s:is_close(char)
  return a:char ==# ')'
endfunction

function! s:get_close(char)
  if a:char ==# '('
    return ')'
  else
    throw 'no matching closing delimiter found'
  endif
endfunction
