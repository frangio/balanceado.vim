" balanceado.vim - Intuitive insertion of balanced delimiters
"
" Author: Francisco Giordano <frangio.1@gmail.com>
" License: MIT License

inoremap <expr> <Esc>   balanceado#Esc()
inoremap <expr> <BS>    balanceado#BS()

inoremap <expr> (       balanceado#character('(')
inoremap <expr> )       balanceado#character(')')

augroup balanceado
  autocmd!
  autocmd InsertEnter * call balanceado#InsertEnter()
augroup end
