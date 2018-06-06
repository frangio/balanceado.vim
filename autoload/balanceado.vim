" balanceado.vim - Intuitive insertion of balanced delimiters
"
" Author: Francisco Giordano <frangio.1@gmail.com>
" License: MIT License

function! balanceado#set_up()
  let b:balanceado_open = { }
  let b:balanceado_close = { }

  call balanceado#add_pair('(', ')')
  call balanceado#add_pair('{', '}')
endfunction

function! balanceado#add_pair(open, close)
  let b:balanceado_open[a:open] = a:close
  let b:balanceado_close[a:close] = a:open
endfunction

function! balanceado#character(char)
  let l:col = col('.') - 1
  let l:post = getline('.')[l:col]

  if s:is_opening(a:char)
    return a:char . s:closing(a:char) . s:left
  elseif s:is_closing(a:char) && l:post ==# a:char
    return s:right
  else
    return a:char
  endif
endfunction

function! balanceado#backspace()
  let l:col = col('.') - 1
  let l:line = getline('.')
  let l:pre = l:line[l:col - 1]
  let l:post = l:line[l:col]

  if s:is_closing(l:pre)
    return s:left
  elseif s:is_opening(l:pre) && l:post ==# s:closing(l:pre)
    return s:right . "\<BS>\<BS>"
  else
    return "\<BS>"
  endif
endfunction

function! s:is_opening(char)
  return has_key(b:balanceado_open, a:char)
endfunction

function! s:is_closing(char)
  return has_key(b:balanceado_close, a:char)
endfunction

function! s:closing(char)
  if has_key(b:balanceado_open, a:char)
    return b:balanceado_open[a:char]
  else
    throw 'no matching closing delimiter found'
  endif
endfunction

let s:left = "\<C-G>U\<Left>"
let s:right = "\<C-G>U\<Right>"
