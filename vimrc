set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/indentpython.vim'
"Plugin 'davidhalter/jedi-vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'scrooloose/syntastic'
Plugin 'Yggdroot/indentLine'

call vundle#end()

"let g:indentLine_setColors = 0
let g:indentLine_char = '|'

au BufRead,BufNewFile *py,*sh
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix

set foldmethod=indent
set foldlevel=99
nnoremap <space> za

filetype plugin indent on

autocmd vimenter * NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

set noswapfile

set encoding=utf-8

set number

syntax on

"python
function HeaderPython()
    call setline(1, "#!/usr/bin/env python")
    call append(1, "# -*- coding: utf-8 -*-")
    call append(2, "# Pw @ " . strftime('%Y-%m-%d %T', localtime()))
    call append(3, "# Description:")
    call append(4, "")
    call append(5, "__author__ = 'kin.sen@linecorp.com'")
    normal G
    normal o
    normal o
endf

autocmd bufnewfile *.py call HeaderPython()

"bash
function HeaderBash()
    call setline(1, "#!/bin/bash")
    call append(1, "# Pw @ " . strftime('%Y-%m-%d %T', localtime()))
    call append(2, "# Description:")
    call append(3, "# author: kin.sen@linecorp.com")
    normal G
    normal o
endf

autocmd bufnewfile *.sh call HeaderBash()
