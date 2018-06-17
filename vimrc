
"Defining leader
let mapleader = ","

call plug#begin('~/.vim/plugged')

	"Workflow
	Plug 'w0rp/ale'
	Plug 'scrooloose/nerdcommenter'
	Plug 'mileszs/ack.vim', { 'on': 'Ack' }
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-unimpaired'
	Plug 'tpope/vim-speeddating'
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'terryma/vim-multiple-cursors'
	Plug 'Townk/vim-autoclose'
	Plug 'wakatime/vim-wakatime'                                    "Waka-time
	Plug 'simnalamburt/vim-mundo'
	Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }

	"Org
	Plug 'jceb/vim-orgmode', { 'for': 'org' }
	Plug 'vim-scripts/SyntaxRange', { 'for': 'org' }
	Plug 'mattn/calendar-vim', { 'for': 'org' }
	Plug 'vim-scripts/utl.vim', { 'for': 'org' }

	"Css
	Plug 'ap/vim-css-color', { 'for': ['css', 'sass'] }

	"Ruby
	Plug 'tpope/vim-rails', { 'for': 'ruby' }
	Plug 'tpope/vim-endwise', { 'for': ['ruby', 'elixir'] }         "Should work for elixir also
	Plug 'skwp/vim-rspec', { 'for': 'ruby' }

	"Elixir
	Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
	Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
	Plug 'mhinz/vim-mix-format', { 'for': 'elixir' }

	"Elm
	Plug 'elmcast/elm-vim', { 'for': 'elm' }

	"C & C++
	Plug 'justinmk/vim-syntax-extra', { 'for': 'c' }                "better syntax highlight for C
	Plug 'vim-scripts/a.vim', { 'for': ['c', 'cpp'] }
	Plug 'drmikehenry/vim-headerguard', { 'for': ['c', 'cpp'] }

	"C#
	Plug 'OmniSharp/omnisharp-vim', { 'for': 'c#' }

	"Markdown
	Plug 'suan/vim-instant-markdown', { 'for': 'markdown' }

	"Javascript
	Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
	Plug 'leshill/vim-json', { 'for': 'json' }

	"Pretify things
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'mhinz/vim-signify'                                        "show what changed in file
	Plug 'ryanoasis/vim-devicons'                                   "icons
	Plug 'mhinz/vim-startify'
	Plug 'junegunn/goyo.vim'                                        "Distraction free
	Plug 'junegunn/limelight.vim'                                   "Hyperfocus-writing
	Plug 'machakann/vim-highlightedyank'

	"Colorschemes
	Plug 'whatyouhide/vim-gotham'
	Plug 'NLKNguyen/papercolor-theme'
	Plug 'morhetz/gruvbox'
	Plug 'ayu-theme/ayu-vim'
	Plug 'rakr/vim-one'
	Plug 'arcticicestudio/nord-vim'
	Plug 'liuchengxu/space-vim-dark'
	Plug 'chriskempson/base16-vim'
	Plug 'dracula/vim'
	Plug 'drewtempelmeyer/palenight.vim'

	"Random
	Plug 'johngrib/vim-game-snake', { 'on': 'VimGameSnake' }

call plug#end()

"Startify options
let g:startify_custom_header = [
	\ ' ██▒   █▓ ██▓ ███▄ ▄███▓                         ',
	\ '▓██░   █▒▓██▒▓██▒▀█▀ ██▒                         ',
	\ ' ▓██  █▒░▒██▒▓██    ▓██░                         ',
	\ '  ▒██ █░░░██░▒██    ▒██                          ',
	\ '   ▒▀█░  ░██░▒██▒   ░██▒            \_`-)|_      ',
	\ '   ░ ▐░  ░▓  ░ ▒░   ░  ░         ,""       \     ',
	\ '   ░ ░░   ▒ ░░  ░      ░       ,"  ## |   ಠ ಠ.   ',
	\ '     ░░   ▒ ░░      ░        ," ##   ,-\__    `. ',
	\ '      ░   ░         ░      ,"       /     `--._;)',
	\ '     ░                   ,"     ## /             ',
	\ ]


"\ '██╗   ██╗██╗███╗   ███╗     █████╗    ██╗           \_`-)|_      ',
"\ '██║   ██║██║████╗ ████║    ██╔══██╗  ███║        ,""       \     ',
"\ '██║   ██║██║██╔████╔██║    ╚█████╔╝  ╚██║      ,"  ## |   ಠ ಠ.   ',
"\ '╚██╗ ██╔╝██║██║╚██╔╝██║    ██╔══██╗   ██║    ," ##   ,-\__    `. ',
"\ ' ╚████╔╝ ██║██║ ╚═╝ ██║    ╚█████╔╝██╗██║  ,"       /     `--._;)',
"\ '  ╚═══╝  ╚═╝╚═╝     ╚═╝     ╚════╝ ╚═╝╚═╝,"     ## /             ',

"Ignore stuff for ctrlp
set exrc
" Ctrl P custom ignore"
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/](\.git|deps|node_modules|public|_build|elm-stuff|obj)$',
	\ 'file': '\v\.(DS_Store)$',
	\ 'link': 'some_bad_symbolic_links',
	\ }
let g:ctrlp_show_hidden = 1

"Detect *.md as markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
"Detect *.tex as latex
autocmd BufNewFile,BufReadPost *.tex set filetype=tex

" Enable persistent undo so that undo history persists across vim sessions
set undofile
set undodir=~/.vim/undo

"Use ag with ack vim
let g:ackprg = 'rg --vimgrep'

"Deactivate default mappings for vim-rspec
let g:RspecKeymap=0

"Airline config
let g:airline_powerline_fonts = 1
"let g:airline_left_sep = ''
"let g:airline_right_sep = ''

"Signify option
let g:signify_vcs_list = [ 'git', 'svn' ]

"Instant markdown options
let g:instant_markdown_autostart = 0
"let g:instant_markdown_open_to_the_world = 1

"Functions
function! MarkWindowSwap()
	let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
	"Mark destination
	let curNum = winnr()
	let curBuf = bufnr( "%" )
	exe g:markedWinNum . "wincmd w"
	"Switch to source and shuffle dest->source
	let markedBuf = bufnr( "%" )
	"Hide and open so that we aren't prompted and keep history
	exe 'hide buf' curBuf
	"Switch to dest and shuffle source->dest
	exe curNum . "wincmd w"
	"Hide and open so that we aren't prompted and keep history
	exe 'hide buf' markedBuf
endfunction

"ack wont jump to first result by default
cnoreabbrev Ack Ack!
"Keybindings
if !exists('##TextYankPost')
	map y <Plug>(highlightedyank)
endif
"Keybindings using Leader
nnoremap <Leader>a :Ack!<Space>
map <leader>i mzgg=G`z
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>h :noh<CR>
nmap <Leader>j :%! python -m json.tool<CR>
nmap <Leader>t :TagbarToggle<CR>
nmap <Leader>m :MundoToggle<CR>
nmap <silent> <leader>yw :call MarkWindowSwap()<CR>
nmap <silent> <leader>pw :call DoWindowSwap()<CR>
"Easier command line navigation
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l
"Better command line editing
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-l> <t_kr>
cnoremap <C-h> <t_kl>
"Disabling arrow keys
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
" Make `jk` throw you into normal mode
inoremap jk <esc>

"Initial configuration
set relativenumber
set number
set autoindent
set list lcs=trail:·,precedes:«,extends:»,tab:▸\ ,eol:¬
"set ls=2 "show status line even when there is only one file
set showcmd
set digraph
set visualbell
set noerrorbells
set noexpandtab
set whichwrap=h,l
"set viminfo=%,'50        "Remembers opened buffers
set viminfo+=\"100,:100
set viminfo+=n~/.viminfo
set nowrap
set hlsearch
set tabpagemax=30
set mouse=a
map <ScrollWheelUp> <C-r>
map <ScrollWheelDown> u
set tabstop=8
set shiftwidth=8
set softtabstop=8
set wildmenu
set backspace=2
"Choose which buffer to go
nnoremap gb :ls<CR>:b<Space>
set incsearch
set colorcolumn=72,80,120

"Better encryption
set cm=blowfish2

"Mac terminals are bad and they should feel bad
set ttyfast
set lazyredraw
"Old regular expression behaviour; makes vim faster sometimes
set re=1"

"Get true color working on iterm with tmux
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"
"let g:airline_theme='ayu_mirage'
"let ayucolor="dark"
"let ayucolor="mirage"
"colorscheme ayu

"set background=dark
"colorscheme gruvbox

"set background=dark
"colorscheme one

"let g:airline_theme='nord'
"colorscheme nord
"let g:nord_italic = 1

"colorscheme gotham

"let g:airline_theme='base16_eighties'
"colorscheme base16-eighties

let g:airline_theme='base16'
colorscheme base16-default-dark

"let g:airline_theme='dracula'
"colorscheme dracula

set backupdir=~/.vimtmp,.
set directory=~/.vimtmp,.
