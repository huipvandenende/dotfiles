set nocompatible " So Vim doesn't pretend to be Vi
set relativenumber " Show relative line numbers
set nu rnu " Shows real line number between relative ones
syntax on

" My list of plugins (using vim-plug)
call plug#begin('~/.vim/plugged')
	Plug 'tpope/vim-fugitive' " Git plugin
	Plug 'preservim/nerdtree' " File system explorer
	Plug 'dense-analysis/ale' " Linting

        Plug 'prabirshrestha/vim-lsp' " Add language server support
	Plug 'mattn/vim-lsp-settings' " Makes setting up LSP easier
	
	Plug 'arcticicestudio/nord-vim' " Nord colorscheme
	
	" Use release branch (recommend)
 	Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Set colorscheme for Vim to nord
colorscheme nord

" Display all matching files when using tab complete
set wildmenu

" Set cursor line
set cursorline 

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
