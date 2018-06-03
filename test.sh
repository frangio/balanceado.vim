#!/usr/bin/env bash

vader="~/.config/nvim/plugged/vader.vim"

vimrc="
filetype off
set runtimepath+=$vader
set runtimepath+=.
set backspace+=start
filetype plugin indent on
syntax enable
"

vim -Nu <(cat <<< "$vimrc") -c 'Vader! test/*'
