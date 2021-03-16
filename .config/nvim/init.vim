set nu rnu " Shows real line number between relative ones
syntax on

nnoremap <Space> <Nop>

source $HOME/.config/nvim/vim-plug/mappings.vim
source $HOME/.config/nvim/vim-plug/plug-install.vim
source $HOME/.config/nvim/vim-plug/fzf.vim
source $HOME/.config/nvim/vim-plug/coc.vim
source $HOME/.config/nvim/vim-plug/which-key.vim
source $HOME/.config/nvim/vim-plug/vimwiki.vim

if empty(glob('~/.vim/autoload/plug.vim'))
	  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif


" Set colorscheme for Vim to gruvbox
let g:gruvbox_italic=1 " Some terminals screw up italics so beware!
let g:gruvbox_contrast_light = 'hard'
let g:gruvbox_contrast_dark = 'medium'

colorscheme gruvbox

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

set tabstop=2
set shiftwidth=2
set noshowmode

" Disable these at your own risk!
set nobackup
set noswapfile

" Enables mouse for lazy times
set mouse=a
