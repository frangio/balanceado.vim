" balanceado.vim - Intuitive delimiter prediction
"
" Author: Francisco Giordano <frangio.1@gmail.com>
" License: MIT License

function! balanceado#character(char)
  if a:char ==# '('
    return '()' . s:left
  elseif a:char ==# ')'
    return s:right
  endif
endfunction

function! balanceado#backspace()
  let l:col = col('.') - 1
  let l:char = getline('.')[l:col - 1]
  if l:char ==# ')'
    return s:left
  elseif l:char ==# '('
    return s:right . "\<BS>\<BS>"
  else
    return "\<BS>"
  endif
endfunction

let s:left = "\<C-G>U\<Left>"
let s:right = "\<C-G>U\<Right>"
