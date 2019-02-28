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
	Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
	Plug '/usr/local/opt/fzf'
  

	" Org
	Plug 'jceb/vim-orgmode', { 'for': 'org' }
	Plug 'vim-scripts/SyntaxRange', { 'for': 'org' }
	Plug 'mattn/calendar-vim', { 'for': 'org' }
	Plug 'vim-scripts/utl.vim', { 'for': 'org' }

	" Elixir
	Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
	Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
	Plug 'mhinz/vim-mix-format', { 'for': 'elixir' }

	" Alda
	Plug 'daveyarwood/vim-alda', { 'for': 'alda' }

	" Elm
	Plug 'elmcast/elm-vim', { 'for': 'elm' }

	" C & C++
	Plug 'justinmk/vim-syntax-extra', { 'for': 'c' }                " better syntax highlight for C
	Plug 'vim-scripts/a.vim', { 'for': ['c', 'cpp'] }
	Plug 'drmikehenry/vim-headerguard', { 'for': ['c', 'cpp'] }

	" Markdown
	Plug 'suan/vim-instant-markdown', { 'for': 'markdown' }
	Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for': 'markdown' }

	" Csv
	Plug 'chrisbra/csv.vim', { 'for': 'csv' }

	" PHP
	Plug 'StanAngeloff/php.vim', { 'for': 'php' }

	" Pretify things
	Plug 'mhinz/vim-signify'                                        " show what changed in file
	Plug 'mhinz/vim-startify'
	Plug 'machakann/vim-highlightedyank'

	" Colorschemes
	Plug 'noahfrederick/vim-noctu'

	" Random
	Plug 'johngrib/vim-game-snake', { 'on': 'VimGameSnake' }
	Plug 'ap/vim-css-color'
	Plug 'johngrib/vim-game-code-break', { 'on': 'VimGameCodeBreak' }

call plug#end()




" Plugins configuration

" Startify options
let g:startify_custom_header = [
	\ '   ██▒   █▓ ██▓ ███▄ ▄███▓                         ',
	\ '  ▓██░   █▒▓██▒▓██▒▀█▀ ██▒                         ',
	\ '   ▓██  █▒░▒██▒▓██    ▓██░                         ',
	\ '    ▒██ █░░░██░▒██    ▒██                          ',
	\ '     ▒▀█░  ░██░▒██▒   ░██▒            \_`-)|_      ',
	\ '     ░ ▐░  ░▓  ░ ▒░   ░  ░         ,""       \     ',
	\ '     ░ ░░   ▒ ░░  ░      ░       ,"  ## |   ಠ ಠ.   ',
	\ '       ░░   ▒ ░░      ░        ," ##   ,-\__    `. ',
	\ '        ░   ░         ░      ,"       /     `--._;)',
	\ '       ░                   ,"     ## /             ',
	\ ]

let g:ackprg = 'rg --vimgrep' " Use rg with ack vim
" ack wont jump to first result by default
cnoreabbrev Ack Ack!

" Signify option
let g:signify_vcs_list = [ 'git', 'svn' ]

" Fzf
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'




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
nnoremap <Leader>p :FZF<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Mouse wheel will move throught time and not space
map <ScrollWheelUp> <C-r>
map <ScrollWheelDown> u




" Initial configuration
autocmd BufNewFile,BufReadPost *.md set filetype=markdown " Detect *.md as markdown
autocmd BufNewFile,BufReadPost *.tex set filetype=tex " Detect *.tex as latex
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




" statusline
"function! GitBranch()
  "return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
"endfunction

"function! StatuslineGit()
  "let l:branchname = GitBranch()
  "return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
"endfunction

"set statusline=
"set statusline+=%#Statement#
"set statusline+=%{StatuslineGit()}
set statusline=
set statusline+=%#Conceal#
set statusline+=\ %f
set statusline+=%h%m%r
set statusline+=%=
set statusline+=%#Statement#
set statusline+=\ %y
set statusline+=\ %3.3p%%
set statusline+=\ %-10.(%l:%c%V%)
set statusline+=\ %P

colorscheme noctu

"highlight Comment cterm=italic
"highlight htmlArg cterm=italic
"highlight xmlAttrib cterm=italic
"highlight Type cterm=italic
"highlight Normal ctermbg=none
