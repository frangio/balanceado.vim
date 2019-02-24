" balanceado.vim - Intuitive insertion of balanced delimiters
"
" Author: Francisco Giordano <frangio.1@gmail.com>
" License: MIT License

inoremap <expr> <Esc>   balanceado#Esc()
inoremap <expr> <BS>    balanceado#BS()

call balanceado#register_pair('(', ')')
call balanceado#register_pair('{', '}')
call balanceado#register_pair('[', ']')

augroup balanceado
  autocmd!
  autocmd InsertEnter * call balanceado#InsertEnter()
augroup end
