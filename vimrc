" Defining Leader
let mapleader = " "

call plug#begin('~/.vim/plugged')

	" Workflow
	Plug 'w0rp/ale'
	Plug 'scrooloose/nerdcommenter'
	Plug 'mileszs/ack.vim', { 'on': 'Ack' }
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-unimpaired'
	Plug 'tpope/vim-speeddating'
	Plug 'tpope/vim-endwise', { 'for': ['ruby', 'elixir'] }
	Plug 'terryma/vim-multiple-cursors'
	Plug 'Townk/vim-autoclose'
	Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
	Plug 'junegunn/vim-easy-align'
	Plug 'wsdjeg/FlyGrep.vim'
	Plug 'ctrlpvim/ctrlp.vim'

	" Org
	Plug 'jceb/vim-orgmode', { 'for': 'org' }
	Plug 'vim-scripts/SyntaxRange', { 'for': 'org' }
	Plug 'mattn/calendar-vim', { 'for': 'org' }
	Plug 'vim-scripts/utl.vim', { 'for': 'org' }

	" Elixir
	Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
	Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
	Plug 'mhinz/vim-mix-format', { 'for': 'elixir' }

	" Elm
	Plug 'elmcast/elm-vim', { 'for': 'elm' }

	" R
	Plug 'jalvesaq/Nvim-R', { 'for': 'R' }

	" csv
	Plug 'chrisbra/csv.vim'

	" Terraform
	Plug 'hashivim/vim-terraform', { 'for': 'terraform' }

	" C & C++
	Plug 'justinmk/vim-syntax-extra', { 'for': 'c' }
	Plug 'vim-scripts/a.vim', { 'for': ['c', 'cpp'] }
	Plug 'drmikehenry/vim-headerguard', { 'for': ['c', 'cpp'] }

	" Markdown
	Plug 'suan/vim-instant-markdown', { 'for': 'markdown' }
	Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for': 'markdown' }

	" Pretify things
	Plug 'mhinz/vim-signify'
	Plug 'mhinz/vim-startify'
	Plug 'machakann/vim-highlightedyank'
	Plug 'ap/vim-css-color'

	" Colorschemes
	Plug 'noahfrederick/vim-noctu'

	" Random
	Plug 'johngrib/vim-game-snake', { 'on': 'VimGameSnake' }
	Plug 'johngrib/vim-game-code-break', { 'on': 'VimGameCodeBreak' }
	Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
	Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }


call plug#end()




" Plugins configuration

" Startify options
let g:startify_custom_header = [
	\ '   ██▒   █▓ ██▓ ███▄ ▄███▓',
	\ '  ▓██░   █▒▓██▒▓██▒▀█▀ ██▒',
	\ '   ▓██  █▒░▒██▒▓██    ▓██░',
	\ '    ▒██ █░░░██░▒██    ▒██',
	\ '     ▒▀█░  ░██░▒██▒   ░██▒            \_`-)|_',
	\ '     ░ ▐░  ░▓  ░ ▒░   ░  ░         ,""       \',
	\ '     ░ ░░   ▒ ░░  ░      ░       ,"  ## |   ಠ ಠ.',
	\ '       ░░   ▒ ░░      ░        ," ##   ,-\__    `.',
	\ '        ░   ░         ░      ,"       /     `--._;)',
	\ '       ░                   ,"     ## /',
	\ ]

let g:ackprg = 'rg --vimgrep' " Use rg with ack vim
" ack wont jump to first result by default
cnoreabbrev Ack Ack!

" Signify option
let g:signify_vcs_list = [ 'git', 'svn' ]

" Ctrlp options
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']




" Functions

" Get status from ALE
function! LinterStatus() abort
	let l:counts = ale#statusline#Count(bufnr(''))
	let l:all_errors = l:counts.error + l:counts.style_error
	let l:all_non_errors = l:counts.total - l:all_errors
	return l:counts.total == 0 ? '' : printf(
	\ '[W:%d E:%d]',
	\ l:all_non_errors,
	\ l:all_errors
	\)
endfunction

" Detect trailing whitespace
function! StatuslineTrailingSpaceWarning()
	if !exists("b:statusline_trailing_space_warning")

		if !&modifiable
			let b:statusline_trailing_space_warning = ''
			return b:statusline_trailing_space_warning
		endif

		if search('\s\+$', 'nw') != 0
			let b:statusline_trailing_space_warning = '[\s]'
		else
			let b:statusline_trailing_space_warning = ''
		endif
	endif
	return b:statusline_trailing_space_warning
endfunction

" Detect mixed identation or mismatch with expandtab
function! StatuslineTabWarning()
	if !exists("b:statusline_tab_warning")
	let b:statusline_tab_warning = ''

		if !&modifiable
			return b:statusline_tab_warning
		endif

		let tabs = search('^\t', 'nw') != 0

		"find spaces that arent used as alignment in the first indent column
		let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0

		if tabs && spaces
			let b:statusline_tab_warning =  '[mixed-indenting]'
		elseif (spaces && !&et) || (tabs && &et)
			let b:statusline_tab_warning = '[&et]'
		endif
	endif
	return b:statusline_tab_warning
endfunction

" Get current mode
let g:mode_map={
	\ 'n'  : 'Normal',
	\ 'no' : 'N·Operator Pending',
	\ 'v'  : 'Visual',
	\ 'V'  : 'V·Line',
	\ '^V' : 'V·Block',
	\ 's'  : 'Select',
	\ 'S'  : 'S·Line',
	\ '^S' : 'S·Block',
	\ 'i'  : 'Insert',
	\ 'R'  : 'Replace',
	\ 'Rv' : 'V·Replace',
	\ 'c'  : 'Command',
	\ 'cv' : 'Vim Ex',
	\ 'ce' : 'Ex',
	\ 'r'  : 'Prompt',
	\ 'rm' : 'More',
	\ 'r?' : 'Confirm',
	\ '!'  : 'Shell',
	\ 't'  : 'Terminal '
	\ }
function! CurrentMode() abort
	return toupper(get(g:mode_map, mode(), 'V-Block '))
endfunction

" Build status line
function! BuildStatusLine(show_word = 0)
	set statusline=
	set statusline+=\ %#Search#%{CurrentMode()}
	set statusline+=\%#Normal#
	set statusline+=\ %#SpellCap#%{FugitiveHead()}
	set statusline+=%#Conceal#
	set statusline+=\ %f
	set statusline+=%h%m%r

	set statusline+=%=

	set statusline+=%#Statement#
	"set statusline+=\ [%{&ff}]
	set statusline+=\ %y

	if a:show_word
		set statusline+=\ %{wordcount().words}\ words,
	endif

	set statusline+=\ %3.3p%%
	set statusline+=\ %-10.(%l:%c%V%)
	set statusline+=\ %P

	set statusline+=\ %#error#%{LinterStatus()}
	set statusline+=%*

	set statusline+=%#error#
	set statusline+=%{StatuslineTrailingSpaceWarning()}
	set statusline+=%*

	set statusline+=%#error#
	set statusline+=%{StatuslineTabWarning()}
	set statusline+=%*
endfunction




" netrw configuration
let g:netrw_liststyle = 3 " netrw tree style view
let g:netrw_banner = 0 " hide banner
let g:netrw_browse_split = 2 " open file in new window
let g:netrw_winsize = 25 " set netrw width
let g:netrw_altv = 1 " change from left splitting to right splitting




" Keybindings
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
inoremap jk <esc>
map <Leader>i mzgg=G`z
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>h :noh<CR>
nmap <Leader>j :%! python -m json.tool<CR>
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-l> <t_kr>
cnoremap <C-h> <t_kl>

" Keybinds for plugins
nnoremap <Leader>a :Ack!<Space>
nmap <Leader>t :TagbarToggle<CR>
map y <Plug>(highlightedyank)
nnoremap <Space>s/ :FlyGrep<CR>

" Mouse wheel will move throught time and not space
map <ScrollWheelUp> <C-r>
map <ScrollWheelDown> u




" Initial configuration
autocmd BufNewFile,BufReadPost *.md set filetype=markdown " Detect *.md as markdown
autocmd BufNewFile,BufReadPost *.tex set filetype=tex " Detect *.tex as latex
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning
set relativenumber
set number
set autoindent
set list lcs=trail:·,precedes:«,extends:»,tab:▸\ ,eol:¬
set showcmd
set digraph
set visualbell
set noerrorbells
set noexpandtab
set whichwrap=h,l
set viminfo+=\"100,:100
set viminfo+=n~/.viminfo
set nowrap
set hlsearch
set tabpagemax=30
set mouse=a
set tabstop=8
set shiftwidth=8
set softtabstop=8
set wildmenu
set backspace=2
set undofile
set undodir=~/.vimundo
set incsearch
set colorcolumn=72,80,120
set cm=blowfish2 " Better encryption
set ttyfast
set lazyredraw
set re=1
set backupdir=~/.vimtmp,.
set directory=~/.vimtmp,.
set laststatus=2
set noshowmode

call BuildStatusLine()

colorscheme noctu

highlight EndOfBuffer ctermfg=black  guifg=black
