" balanceado.vim - Intuitive delimiter prediction
"
" Author: Francisco Giordano <frangio.1@gmail.com>
" License: MIT License

inoremap <expr> <BS>    balanceado#backspace()

inoremap <expr> (       balanceado#character("(")
inoremap <expr> )       balanceado#character(")")
