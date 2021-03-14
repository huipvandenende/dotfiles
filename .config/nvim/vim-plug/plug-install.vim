
" My list of plugins (using vim-plug)
call plug#begin('~/.vim/plugged')
	Plug 'tpope/vim-fugitive' " Git plugin
	Plug 'preservim/nerdtree' " File system explorer
	
	Plug 'morhetz/gruvbox' " Gruvbox theme

	Plug 'vim-airline/vim-airline'
	" Fuzzy file searcher
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

	" Use release branch (recommend)
 	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	Plug 'liuchengxu/vim-which-key' " Vim key suggestions
	Plug 'sharkdp/fd' " find that respects ,gitignore
	Plug 'BurntSushi/ripgrep' " Searches for regex pattern
	Plug 'airblade/vim-rooter' " Change working dir of vim when opening file or directory

	" Plug 'dominikduda/vim_current_word' " Highlights current word under cursor
	Plug 'tomtom/tcomment_vim' " Easy comments
call plug#end()

