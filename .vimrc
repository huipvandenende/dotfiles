set nocompatible " So Vim doesn't pretend to be Vi.
set relativenumber " Show relative line numbers.
set nu rnu " Shows real line number between relative ones.
syntax on

" My list of plugins (using vim-plug)
call plug#begin('~/.vim/plugged')
	Plug 'tpope/vim-fugitive' " Git plugin
	Plug 'preservim/nerdtree' " File system explorer
call plug#end()

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when using tab complete
set wildmenu

" Autoindent
filetype plugin indent on

" NERDTree configuration
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
\ quit | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror

" Disable these at your own risk!
set nobackup
set noswapfile

set mouse=a
