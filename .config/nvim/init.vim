set nu rnu " Shows real line number between relative ones
syntax on
nnoremap <Space> <Nop>

" My list of plugins (using vim-plug)
call plug#begin('~/.vim/plugged')
	Plug 'tpope/vim-fugitive' " Git plugin
	Plug 'preservim/nerdtree' " File system explorer
	
	Plug 'morhetz/gruvbox' " Gruvbox theme
	Plug 'NLKNguyen/papercolor-theme' " Papercolor theme
	Plug 'sainnhe/everforest' " Everforest theme

	Plug 'vim-airline/vim-airline'
	
	" Notes/Wiki for Vim.
	Plug 'vimwiki/vimwiki'


	" Fuzzy file searcher
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	" Plug 'nvim-telescope/telescope.nvim' Enable when nvim v0.5!
	" Use release branch (recommend)
 	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	Plug 'liuchengxu/vim-which-key' " Vim key suggestions
	Plug 'sharkdp/fd' " find that respects ,gitignore
	Plug 'BurntSushi/ripgrep' " Searches for regex pattern
	Plug 'airblade/vim-rooter' " Change working dir of vim when opening file or directory
	Plug 'airblade/vim-gitgutter' " Adds git info on the side

	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Go plugin

	Plug 'vimwiki/vimwiki' " Vim wiki
	Plug 'tomtom/tcomment_vim' " Easy comments
	Plug 'jiangmiao/auto-pairs' " Pairs brackets etc
	Plug 'ayu-theme/ayu-vim'
	Plug 'rakr/vim-one'
	Plug 'psliwka/vim-smoothie' " Smoother scrolling
call plug#end()

if empty(glob('~/.vim/autoload/plug.vim'))
	  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

" Set colorscheme for Vim to gruvbox
let g:gruvbox_italic=0 " Some terminals screw up italics so beware!
let g:gruvbox_contrast_light = 'hard'
let g:gruvbox_contrast_dark = 'medium'

" colorscheme gruvbox
colorscheme one
set bg=light

set guicursor=

" Hides end of buffer icons (~)
hi EndOfBuffer ctermfg=bg ctermbg=bg

" Set border
hi vertsplit guifg=fg guibg=bg  

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

set foldmethod=indent
set nofoldenable

set tabstop=2
set shiftwidth=2
set noshowmode

" Disables annoying check for whitespace
let g:airline#extensions#whitespace#enabled = 0
let g:airline_theme='one'

" Disable these at your own risk!
set nobackup
set noswapfile

" enable indentation
set breakindent
"
" Smart indent
" ident by an additional 2 characters on wrapped lines, when line >= 40 characters, put 'showbreak' at start of line
set breakindentopt=shift:2,min:40,sbr

" Enables mouse for lazy times
set mouse=a

" Vim Go configuration
let g:go_highlight_extra_types = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_diagnostic_errors = 1
let g:go_highlight_diagnostic_warnings = 1
let g:go_code_completion_enabled = 0
let g:go_doc_keywordprg_enabled = 0
let g:go_gopls_enabled = 0



" CoC mappings
"
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)


" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


" fzf remappings
nmap <leader>F :Files<CR>
" nmap <leader>g :GFiles<CR>
nmap <leader>f :Files %:p:h<CR>

" Can't rebind ctrl-v for vsplit on Windows!
let g:fzf_action = {
	\ 'ctrl-s': 'vsplit',
	\ 'ctrl-h': 'split',
	\ 'ctrl-t': 'tab split'
  \ }

" TextEdit might fail if hidden is not set.
set hidden

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif


" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  " autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  "autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}

" Use Markdown as default for Vimwiki.
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

:nnoremap <leader>b :buffers<CR>:buffer<Space>

