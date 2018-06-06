" balanceado.vim - Intuitive insertion of balanced delimiters
"
" Author: Francisco Giordano <frangio.1@gmail.com>
" License: MIT License

inoremap <expr> <BS>    balanceado#backspace()

inoremap <expr> (       balanceado#character('(')
inoremap <expr> )       balanceado#character(')')
inoremap <expr> {       balanceado#character('{')
inoremap <expr> }       balanceado#character('}')

augroup balanceado
  autocmd!
  autocmd BufEnter * call balanceado#set_up()
augroup end
