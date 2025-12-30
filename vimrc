" Defining Leader
let mapleader = " "

call plug#begin('~/.vim/plugged')

	" Workflow
	Plug 'dense-analysis/ale'
	Plug 'mileszs/ack.vim', { 'on': 'Ack' }
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-endwise', { 'for': ['ruby', 'elixir'] }
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-rhubarb'
	Plug 'tpope/vim-speeddating'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-unimpaired'
	Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
	Plug 'junegunn/vim-easy-align'
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'wsdjeg/vim-fetch'

	" Html
	Plug 'adelarsq/vim-matchit'
	Plug 'mattn/emmet-vim'

	" Rust
	Plug 'rust-lang/rust.vim'

	" Elixir
	Plug 'elixir-editors/vim-elixir'
	"Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
	Plug 'mhinz/vim-mix-format', { 'for': 'elixir' }

	Plug 'ElmCast/elm-vim', { 'for': 'elm' }

	" PHP
	Plug 'StanAngeloff/php.vim'
	Plug 'aeke/vim-php-cs-fixer'

	" Tsx
	Plug 'leafgarland/typescript-vim'
	Plug 'peitalin/vim-jsx-typescript'

	" csv
	Plug 'chrisbra/csv.vim'

	" Terraform
	Plug 'hashivim/vim-terraform'

	" C & C++
	Plug 'justinmk/vim-syntax-extra', { 'for': 'c' }
	Plug 'vim-scripts/a.vim', { 'for': ['c', 'cpp'] }
	Plug 'drmikehenry/vim-headerguard', { 'for': ['c', 'cpp'] }

	" Golang
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

	" Markdown
	Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for': 'markdown' }

	" Wakatime
	Plug 'wakatime/vim-wakatime'

	" GitHub
	Plug 'jehuipark/github-co-author-vim-plugin'

	" Pretify things
	Plug 'mhinz/vim-signify'
	Plug 'mhinz/vim-startify'
	Plug 'machakann/vim-highlightedyank'
	Plug 'ap/vim-css-color'
	Plug 'thiagoalessio/rainbow_levels.vim', { 'on': 'RainbowLevelsToggle' }
	Plug 'willchao612/vim-diagon'

	" Colorschemes
	Plug 'noahfrederick/vim-noctu'
	Plug 'dylanaraps/wal.vim'
	Plug 'ghifarit53/tokyonight-vim'

	" Random
	Plug 'johngrib/vim-game-snake', { 'on': 'VimGameSnake' }
	Plug 'johngrib/vim-game-code-break', { 'on': 'VimGameCodeBreak' }
	Plug 'iqxd/vim-mine-sweeping', { 'on': 'MineSweep' }
	Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
	Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }

	" Spell files
	Plug 'mateusbraga/vim-spell-pt-br'

call plug#end()




" Plugins configuration

" ALE go
let g:ale_go_golangci_lint_package = 1
let g:ale_linters = {
  \ 'go': ['gopls'],
  \ 'python': ['pylsp', 'flake8'],
  \}
let g:ale_completion_enabled = 1

" vim-go
let g:go_highlight_extra_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1

" Startify options
" let g:startify_custom_header = [
" 	\ "  ,-.       _,---._ __  / \\            _                        ",
" 	\ " /  )    .-'       `./ /   \\           \\`*-.                    ",
" 	\ "(  (   ,'            `/    /|           )  _`-.                 ",
" 	\ " \\  `-\"             \\'\\   / |          .  : `. .                ",
" 	\ "  `.              ,  \\ \\ /  |          : _   '  \\               ",
" 	\ "   /`.          ,'-`----Y   |          ; *` _.   `*-._          ",
" 	\ "  (            ;        |   '          `-.-'          `-.       ",
" 	\ "  |  ,-.    ,-'         |  /             ;       `       `.     ",
" 	\ "  |  | (   |            | /              :.       .        \\    ",
" 	\ "  )  |  \\  `.___________|/               . \\  .   :   .-'   .   ",
" 	\ "  `--'   `--'                            '  `+.;  ;  '      :   ",
" 	\ "                                         :  '  |    ;       ;-. ",
" 	\ "                                         ; '   : :`-:     _.`* ;",
" 	\ "                                [bug] .*' /  .*' ; .*`- +'  `*' ",
" 	\ "                                      `*-*   `*-*  `*-*'        ",
" 	\ ]

let g:startify_custom_header = [
	\ "___________   _______________________________________^__",
	\ " ___   ___ |||  ___   ___   ___    ___ ___  |   __  ,----\\",
	\ "|   | |   |||| |   | |   | |   |  |   |   | |  |  | |_____\\",
	\ "|___| |___|||| |___| |___| |___|  | O | O | |  |  |        \\",
	\ "           |||                    |___|___| |  |__|         )",
	\ "___________|||______________________________|______________/",
	\ "           |||                                        /--------",
	\ "-----------'''---------------------------------------'",
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

let g:tagbar_type_elixir = {
	\ 'ctagstype' : 'elixir',
	\ 'kinds' : [
		\ 'p:protocols',
		\ 'm:modules',
		\ 'e:exceptions',
		\ 'y:types',
		\ 'd:delegates',
		\ 'f:functions',
		\ 'c:callbacks',
		\ 'a:macros',
		\ 't:tests',
		\ 'i:implementations',
		\ 'o:operators',
		\ 'r:records'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 'p' : 'protocol',
		\ 'm' : 'module'
	\ },
	\ 'scope2kind' : {
		\ 'protocol' : 'p',
		\ 'module' : 'm'
	\ },
	\ 'sort' : 0
\ }

let g:tagbar_type_elm = {
      \ 'kinds' : [
      \ 'f:function:0:0',
      \ 'm:modules:0:0',
      \ 'i:imports:1:0',
      \ 't:types:1:0',
      \ 'a:type aliases:0:0',
      \ 'c:type constructors:0:0',
      \ 'p:ports:0:0',
      \ 's:functions:0:0',
      \ ]
      \}

" Vim GitHub Co Author Plugin
let g:github_co_author_list_path = '~/.vim/github-co-author-list'




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
	set statusline+=\%#Normal#
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

function! DoPrettyXML()
	" save the filetype so we can restore it later
	let l:origft = &ft
	set ft=
	" delete the xml header if it exists. This will
	" permit us to surround the document with fake tags
	" without creating invalid xml.
	1s/<?xml .*?>//e
	" insert fake tags around the entire document.
	" This will permit us to pretty-format excerpts of
	" XML that may contain multiple top-level elements.
	0put ='<PrettyXML>'
	$put ='</PrettyXML>'
	silent %!xmllint --format -
	" xmllint will insert an <?xml?> header. it's easy enough to delete
	" if you don't want it.
	" delete the fake tags
	2d
	$d
	" restore the 'normal' indentation, which is one extra level
	" too deep due to the extra tags we wrapped around the document.
	silent %<
	" back to home
	1
	" restore the filetype
	exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()



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

noremap <Leader>D :Diagon<Space>
noremap <Leader>dm :Diagon Math<CR>
noremap <Leader>ds :Diagon Sequence<CR>
noremap <Leader>dt :Diagon Tree<CR>

" Mouse wheel will move throught time and not space

map <ScrollWheelUp> <C-r>
map <ScrollWheelDown> u

" Map for interactive curl

map <leader>cc vipyPgvO<Esc>O<Esc>gv:!curl --config -<CR>




" Configuration for CoC

inoremap <silent><expr> <c-@> coc#refresh()
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
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

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
	autocmd!
	" Setup formatexpr specified filetype(s).
	autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	" Update signature help on jump placeholder.
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

command! -nargs=0 Format :call CocAction('format')




" Custom commands

command Writemode setlocal spell | Goyo 70 | Limelight




" Initial configuration

autocmd BufNewFile,BufReadPost *.md set filetype=markdown " Detect *.md as markdown
autocmd BufNewFile,BufReadPost *.tex set filetype=tex " Detect *.tex as latex
autocmd BufNewFile,BufReadPost *.dc set filetype=dc " Detect *.dc as desktop calculator
autocmd BufRead,BufNewFile *.ex,*.exs set filetype=elixir
autocmd BufRead,BufNewFile *.eex set filetype=eelixir
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning
set path+=**
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
set re=1
set backupdir=~/.vimtmp,.
set directory^=~/.vimtmp//,.
set laststatus=2
set noshowmode
set ignorecase
set smartcase
set showmatch
set clipboard=unnamed
set encoding=utf-8
set fileencoding=utf-8

call BuildStatusLine()

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

colorscheme wal
" set termguicolors
" let g:tokyonight_style = 'night' " available: night, storm
" let g:tokyonight_transparent_background = 1
" let g:tokyonight_enable_italic = 1
" let g:tokyonight_current_word = 'underline'
" colorscheme tokyonight

highlight EndOfBuffer ctermfg=black  guifg=black

" For italics
" set t_ZH=[3m
" set t_ZR=[23m
highlight Comment cterm=italic gui=italic

" Fixing wal colors issue
"
"
" Adjusting color for eol character since wal uses the same for the
" background.
"
" From the :help 'listchars'
highlight NonText ctermfg=red  guifg=red
" Adjusting color for vertical lines since they're showing
"
" From the :help 'fillchars'
highlight VertSplit ctermfg=0  ctermbg=0
