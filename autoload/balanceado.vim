" balanceado.vim - Intuitive insertion of balanced delimiters
"
" Author: Francisco Giordano <frangio.1@gmail.com>
" License: MIT License

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

  if l:pre ==# ')'
    return s:left
  elseif l:pre ==# '(' && l:post ==# ')'
    return s:right . "\<BS>\<BS>"
  else
    return "\<BS>"
  endif
endfunction

function! s:is_opening(char)
  return a:char ==# '(' || a:char ==# '{'
endfunction

function! s:is_closing(char)
  return a:char ==# ')' || a:char ==# '}'
endfunction

function! s:closing(char)
  if a:char ==# '('
    return ')'
  elseif a:char ==# '{'
    return '}'
  else
    throw 'no matching closing delimiter found'
  endif
endfunction

let s:left = "\<C-G>U\<Left>"
let s:right = "\<C-G>U\<Right>"
