" Defining Leader
let mapleader = " "

call plug#begin('~/.vim/plugged')

	" Workflow
	Plug 'w0rp/ale'
	Plug 'scrooloose/nerdcommenter'
	Plug 'mileszs/ack.vim', { 'on': 'Ack' }
	Plug 'tpope/vim-endwise', { 'for': ['ruby', 'elixir'] }
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-rhubarb'
	Plug 'tpope/vim-speeddating'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-unimpaired'
	Plug 'Townk/vim-autoclose'
	Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
	Plug 'junegunn/vim-easy-align'
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

	" Go
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

	" csv
	Plug 'chrisbra/csv.vim'

	" Terraform
	Plug 'hashivim/vim-terraform', { 'for': 'terraform' }

	" C & C++
	Plug 'justinmk/vim-syntax-extra', { 'for': 'c' }
	Plug 'vim-scripts/a.vim', { 'for': ['c', 'cpp'] }
	Plug 'drmikehenry/vim-headerguard', { 'for': ['c', 'cpp'] }

	" Markdown
	Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for': 'markdown' }

	" Processing
	Plug 'sophacles/vim-processing'

	" Wakatime
	Plug 'wakatime/vim-wakatime'

	" Pretify things
	Plug 'mhinz/vim-signify'
	Plug 'mhinz/vim-startify'
	Plug 'machakann/vim-highlightedyank'
	Plug 'ap/vim-css-color'
	Plug 'thiagoalessio/rainbow_levels.vim', { 'on': 'RainbowLevelsToggle' }

	" Colorschemes
	Plug 'noahfrederick/vim-noctu'
	Plug 'dylanaraps/wal.vim'

	" Random
	Plug 'johngrib/vim-game-snake', { 'on': 'VimGameSnake' }
	Plug 'johngrib/vim-game-code-break', { 'on': 'VimGameCodeBreak' }
	Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
	Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }

	" Spell files
	Plug 'mateusbraga/vim-spell-pt-br'

call plug#end()




" Plugins configuration

" Startify options
let g:startify_custom_header = [
	\ "             ..uu.",
	\ "            ?$\"\"`?i           z\'",
	\ "            `M  .@\"          x\"",
	\ "            \'Z :#\"  .   .    f 8M",
	\ "            \'&H?`  :$f U8   <  MP   x#\'",
	\ "            d#`    XM  $5.  $  M\' xM\"",
	\ "          .!\">     @  \'f`$L:M  R.@!`",
	\ "         +`  >     R  X  \"NXF  R\"*L",
	\ "             k    \'f  M   \"$$ :E  5.",
	\ "             %    `~  \"    `  \'K  \'M",
	\ "                 .uH          \'E   `h",
	\ "              .x*`             X     `",
	\ "           .uf`                *",
	\ "         .@8     .",
	\ "        \'E9F  uf\"          ,     ,",
	\ "          9h+\"   $M    eH. 8b. .8    .....",
	\ "         .8`     $\'   M \'E  `R;\'   d?\"\"\"`\"#",
	\ "        ` E      @    b  d   9R    ?*     @",
	\ "          >      K.zM `%M\'   9\'    Xf   .f",
	\ "         ;       R\'          9     M  .=`",
	\ "         t                   M     Mx~",
	\ "         @                  lR    z\"",
	\ "         @                  `   ;\"",
	\ "                               `",
	\ ]

let g:ackprg = 'rg --vimgrep' " Use rg with ack vim
" ack wont jump to first result by default
cnoreabbrev Ack Ack!

" Signify option
let g:signify_vcs_list = [ 'git', 'svn' ]

" Ctrlp options
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Tagbar
let g:tagbar_type_terraform = {
	\ 'ctagstype' : 'terraform',
	\ 'kinds' : [
	\ 'r:resources',
	\ 'm:modules',
	\ 'o:outputs',
	\ 'v:variables',
	\ 'f:tfvars'
	\ ],
	\ 'sort' : 0
	\ }

let g:tagbar_type_markdown = {
	\ 'ctagstype' : 'markdown',
	\ 'kinds' : [
	\ 'h:Heading_L1',
	\ 'i:Heading_L2',
	\ 'k:Heading_L3'
	\ ]
	\ }




" Functions

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

function! StripTrailingWhitespace()
	if !&binary && &filetype != 'diff'
		normal mz
		normal Hmy
		%s/\s\+$//e
		normal 'yz<CR>
		normal `z
	endif
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
nmap <Leader>i mzgg=G`z
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>h :noh<CR>
nmap <Leader>e :e<CR>
nmap <Leader>j :%! python -m json.tool<CR>
nmap <Leader>c :!ctags -R .<CR>
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
map <leader>l :RainbowLevelsToggle<CR>
nnoremap <Leader>p :CtrlPTag<CR>

" Mouse wheel will move throught time and not space

map <ScrollWheelUp> <C-r>
map <ScrollWheelDown> u




" Initial configuration

autocmd BufNewFile,BufReadPost *.md set filetype=markdown " Detect *.md as markdown
autocmd BufNewFile,BufReadPost *.tex set filetype=tex " Detect *.tex as latex
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning
set path+=**
set relativenumber
set number
set autoindent
"set list lcs=trail:·,precedes:«,extends:»,tab:▸\ ,eol:¬
set list lcs=trail:·,precedes:«,extends:»,tab:\ ,eol:¬
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
set re=1
set backupdir=~/.vimtmp,.
set directory=~/.vimtmp,.
set laststatus=2
set noshowmode
set ignorecase
set smartcase
set clipboard=unnamed

if has('patch-8.1.0360')
	set diffopt=filler,internal,algorithm:histogram,indent-heuristic
endif

call BuildStatusLine()

colorscheme noctu

highlight EndOfBuffer ctermfg=black  guifg=black
