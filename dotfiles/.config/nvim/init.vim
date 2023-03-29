call plug#begin('~/.local/share/nvim/plugged')

" Python
Plug 'davidhalter/jedi-vim'
	" disable autocompletion, because we use deoplete for completion
	let g:jedi#completions_enabled = 0
	" open the go-to function in split, not another buffer
	let g:jedi#use_splits_not_buffers = "right"
	let g:jedi#goto_command = "gd"
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
	let g:deoplete#enable_at_startup = 1
	let g:python3_host_prog = '$HOME/.virtualenvs/nvim/bin/python'
	let g:deoplete#sources#jedi#show_docstring = 0
Plug 'scrooloose/nerdcommenter'
Plug 'sbdchd/neoformat'
Plug 'neomake/neomake'
Plug 'vim-python/python-syntax'
	let g:python_highlight_all = 1
Plug 'vim-scripts/indentpython.vim'
Plug 'preservim/tagbar'

"Git plugin
Plug 'tpope/vim-fugitive'

" General utilities
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'justinmk/vim-sneak'
	let g:sneak#s_next = 1

" Color scheme
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
	let g:airline_theme='gruvbox'

" File navigation Plugins
Plug 'ctrlpvim/ctrlp.vim'

" Latex Plugins
Plug 'lervag/vimtex'
	let g:tex_flavor='latex'
	let g:vimtex_view_method='general'
	let g:vimtex_quickfix_mode=0
Plug 'KeitaNakamura/tex-conceal.vim'
    	set conceallevel=1
    	let g:tex_conceal='abdmg'
    	hi Conceal ctermbg=none

" Snippets
Plug 'sirver/ultisnips'
	let g:UltiSnipsExpandTrigger = '<tab>'
	let g:UltiSnipsJumpForwardTrigger = '<tab>'
	let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
	let g:UltiSnipsSnippetDirectories=["UltiSnips", $HOME.'/.congig/nvim/UltiSnips']
	let g:ultisnips_python_style = 'google'

" Auto tag management
Plug 'ludovicchabant/vim-gutentags'

" tmux config
Plug 'christoomey/vim-tmux-navigator'

" Repeat vim command
Plug 'tpope/vim-repeat'

" rst
"Plug 'stormherz/tablify'
Plug 'dhruvasagar/vim-table-mode'
call plug#end()

colorscheme gruvbox
set background=dark " use dark mode

" Useful spacemacs-like keymaps
imap fd <Esc>
let mapleader = " "  
"map <Space>qq :wq<CR>
"map <Space><TAB> :w<CR>:bp<CR>
nmap <LEADER><TAB> <C-^>

" files
nmap <LEADER>fa :<C-u>Unite buffer history/yank file file_rec/async file_mru<cr>
nmap <LEADER>ff :<C-u>Unite file file_rec/async file_mru<cr>
nmap <LEADER>fr :<C-u>Unite -no-split -buffer-name=mru -start-insert file_mru<cr>
nmap <LEADER>fs :w<CR>
nmap <LEADER>fS :wa<CR>
nmap <LEADER>ft :NERDTreeToggle<CR>

" buffers
nmap <LEADER>bb :buffers<CR>
nmap <LEADER>bd :bdelete<CR>
nmap <LEADER>bn :bn<CR>
nmap <LEADER>bp :bp<CR>
nmap <LEADER>bR :e<CR>

" Git
nmap <LEADER>gb :Gblame<CR>
nmap <LEADER>gd :Gdiff<CR>
nmap <LEADER>gs :Git<CR>
nmap <LEADER>gw :Gwrite<CR>
nmap <LEADER>gp :Git push<CR>
nmap <LEADER>gc :Gcommit<CR>
nmap <LEADER>gt :GitGutterToggle<CR>

" windows
nmap <LEADER>w- :sp<CR>
nmap <LEADER>w/ :vsp<CR>
nmap <LEADER>w= <C-W>=
nmap <LEADER>wc :q<CR>
nmap <LEADER>wh <C-W>h
nmap <LEADER>wj <C-W>j
nmap <LEADER>wk <C-W>k
nmap <LEADER>wl <C-W>l
nmap <LEADER>ws <C-W>s
nmap <LEADER>wv <C-W>v
nmap <LEADER>wm :MaximizerToggle<CR>
nmap <LEADER>ww <C-W><C-W>
nmap <LEADER>1 :buffer 1<CR>
nmap <LEADER>2 :buffer 2<CR>
nmap <LEADER>3 :buffer 3<CR>
nmap <LEADER>4 :buffer 4<CR>
nmap <LEADER>5 :buffer 5<CR>


" Exit
nnoremap <LEADER>qq :qa<CR>
nnoremap <Leader>qQ :qa!<CR>
nnoremap <Leader>qs :xa<CR>

" commenting
nmap <Leader>;  <Plug>Commentary
vmap <Leader>;  <Plug>Commentary
omap <Leader>;  <Plug>Commentary
nmap <Leader>;; <Plug>CommentaryLine

nmap <Space>rt :TagbarOpenAutoClose<CR>


"Spell Check
setlocal spell
set spelllang=en_gb
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Hard wrap
set textwidth=79
set colorcolumn=79


""""""""""""""""""""""Deoplete config""""""""""""""""""""""
" Not tested yet.
"if has('win32') || has('win64')
  "Plug 'tbodt/deoplete-tabnine', { 'do': 'powershell.exe .\install.ps1' }
"else
  "Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
"endif


"""""""""""""""""""Window realated settings"""""""""""""""""""
set splitbelow
set splitright



" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"


" Vim airline settings
" Tabline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Show buffer number for easier switching between buffer,
" see https://github.com/vim-airline/vim-airline/issues/1149
let g:airline#extensions#tabline#buffer_nr_show = 1

" Buffer number display format
let g:airline#extensions#tabline#buffer_nr_format = '%s. '

" Whether to show function or other tags on status line
let g:airline#extensions#vista#enabled = 1
let g:airline#extensions#gutentags#enabled = 1

" Do not show search index in statusline since it is shown on command line
let g:airline#extensions#anzu#enabled = 0

" Enable vim-airline extension for vim-lsp
let g:airline#extensions#lsp#enabled = 1

" Skip empty sections if there are nothing to show,
" extracted from https://vi.stackexchange.com/a/9637/15292
let g:airline_skip_empty_sections = 1

" Whether to use powerline symbols, see https://vi.stackexchange.com/q/3359/15292
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 'Ꞩ'

" Only show git hunks which are non-zero
let g:airline#extensions#hunks#non_zero_only = 1

" Get rid of something I do not understand
let g:airline#extensions#whitespace#enabled = 0

" Speed up airline
let g:airline_highlighting_cache = 1


""""""""""""""""""""""""" Neomake settigs """""""""""""""""
" Automatic call to neomake when writing a buffer (no delay).
" call neomake#configure#automake('w') " It works but it is too much information.

let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_python_flake8_maker = {
  \ 'exe': '/home/asiergalicia/.virtualenvs/nvim/bin/flake8',
  \ 'args': ['--format=default'],
  \ 'errorformat':
      \ '%E%f:%l: could not compile,%-Z%p^,' .
      \ '%A%f:%l:%c: %t%n %m,' .
      \ '%A%f:%l: %t%n %m,' .
      \ '%-G%.%#',
  \ 'postprocess': function('neomake#makers#ft#python#Flake8EntryProcess')
  \ }

" Set default yank and paste to clipboard
set clipboard=unnamedplus
