
"Defining leader
let mapleader = ","

call plug#begin('~/.vim/plugged')

	"Workflow
	Plug 'scrooloose/syntastic'
	Plug 'scrooloose/nerdcommenter'
	Plug 'mileszs/ack.vim', { 'on': 'Ack' }
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-fugitive'
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'terryma/vim-multiple-cursors'
	Plug 'Townk/vim-autoclose'
	Plug 'junegunn/vim-easy-align'
	Plug 'wakatime/vim-wakatime'                                    "Waka-time

	"Css
	Plug 'ap/vim-css-color'

	"Ruby
	Plug 'tpope/vim-rails', { 'for': 'ruby' }
	Plug 'tpope/vim-endwise'                                        "Should work for elixir also
	Plug 'skwp/vim-rspec', { 'for': 'ruby' }

	"Elixir
	Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
	Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }

	"Elm
	Plug 'elmcast/elm-vim', { 'for': 'elm' }

	"C & C++
	Plug 'justinmk/vim-syntax-extra', { 'for': 'c' }                "better syntax highlight for C
	Plug 'vim-scripts/a.vim', { 'for': ['c', 'c++'] }

	"Pretify things
	Plug 'vim-airline/vim-airline'
	Plug 'mhinz/vim-signify'                                        "show what changed in file
	Plug 'ryanoasis/vim-devicons'                                   "icons
	Plug 'mhinz/vim-startify'
	Plug 'junegunn/goyo.vim'                                        "Distraction free
	Plug 'junegunn/limelight.vim'                                   "Hyperfocus-writing

	"Colorschemes
	Plug 'whatyouhide/vim-gotham'
	Plug 'NLKNguyen/papercolor-theme'
	Plug 'nanotech/jellybeans.vim'
	Plug 'dracula/vim'
	Plug 'morhetz/gruvbox'

call plug#end()

"Startify options
let g:startify_custom_header = [
	\ '____________________________________________________________/\\\__________/\\\\\\\\\\\\\\\___/\\\\______________        ',
	\ ' ___________________________________________________________\/\\\_________\/\\\///////////___\///\\______________       ',
	\ '  ___________________________________________________________\/\\\_________\/\\\_______________/\\/_______________      ',
	\ '   _____/\\\\\\\\___/\\\____/\\\_____/\\\\\\\\______/\\\\\\\\_\/\\\_________\/\\\\\\\\\\\\_____\//_____/\\\\\\\\\\_     ',
	\ '    ___/\\\/////\\\_\///\\\/\\\/____/\\\/////\\\___/\\\//////__\/\\\\\\\\\___\////////////\\\__________\/\\\//////__    ',
	\ '     __/\\\\\\\\\\\____\///\\\/_____/\\\\\\\\\\\___/\\\_________\/\\\////\\\_____________\//\\\_________\/\\\\\\\\\\_   ',
	\ '      _\//\\///////______/\\\/\\\___\//\\///////___\//\\\________\/\\\__\/\\\__/\\\________\/\\\_________\////////\\\_  ',
	\ '       __\//\\\\\\\\\\__/\\\/\///\\\__\//\\\\\\\\\\__\///\\\\\\\\_\/\\\\\\\\\__\//\\\\\\\\\\\\\/___________/\\\\\\\\\\_ ',
	\ '        ___\//////////__\///____\///____\//////////_____\////////__\/////////____\/////////////____________\//////////__',
	\ '__/\\\________/\\\_________________________________________/\\\\\\\\\______________/\\\\\\\____                         ',
	\ ' _\/\\\_______\/\\\_______________________________________/\\\///////\\\__________/\\\/////\\\__                        ',
	\ '  _\//\\\______/\\\___/\\\________________________________\/\\\_____\/\\\_________/\\\____\//\\\_                       ',
	\ '   __\//\\\____/\\\___\///_____/\\\\\__/\\\\\______________\///\\\\\\\\\/_________\/\\\_____\/\\\_                      ',
	\ '    ___\//\\\__/\\\_____/\\\__/\\\///\\\\\///\\\_____________/\\\///////\\\________\/\\\_____\/\\\_                     ',
	\ '     ____\//\\\/\\\_____\/\\\_\/\\\_\//\\\__\/\\\____________/\\\______\//\\\_______\/\\\_____\/\\\_                    ',
	\ '      _____\//\\\\\______\/\\\_\/\\\__\/\\\__\/\\\___________\//\\\______/\\\________\//\\\____/\\\__                   ',
	\ '       ______\//\\\_______\/\\\_\/\\\__\/\\\__\/\\\____________\///\\\\\\\\\/____/\\\__\///\\\\\\\/___                  ',
	\ '        _______\///________\///__\///___\///___\///_______________\/////////_____\///_____\///////_____                 ',
	\ ]

"Ignore stuff for ctrlp
set exrc
" Ctrl P custom ignore"
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|deps|node_modules|_build)$',
  \ 'file': '\v\.(DS_Store)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

"Detect *.md as markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
"Detect *.tex as latex
autocmd BufNewFile,BufReadPost *.tex set filetype=tex

"Use ag with ack vim
let g:ackprg = 'ag --vimgrep'

"Deactivate default mappings for vim-rspec
let g:RspecKeymap=0

"To make Syntastic work
let g:syntastic_auto_loc_list=1
let g:syntastic_disabled_filetypes=['html']
let g:syntastic_enable_signs=1
let g:syntastic_quiet_messages = {'level': 'warnings'}

"Elm syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:elm_syntastic_show_warnings = 1

"Elm auto format on save
"let g:elm_format_autosave = 1
map <leader>m :ElmFormat<CR>

"Airline config
let g:airline_powerline_fonts = 1

"Signify option
let g:signify_vcs_list = [ 'git', 'svn' ]

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

"Keybindings
nmap <F2> :w<CR>
imap <F2> :w<CR>a
nmap <F3> :wq!<CR>
nmap <F4> :q!<CR>
nmap <F5> :noh<CR>
nmap <F6> :%! python -m json.tool<CR>
map <leader>i mzgg=G`z
"Keybindings using Leader
nmap <Leader>w :w<CR>
nmap <Leader>q :wq<CR>
nmap <silent> <leader>yw :call MarkWindowSwap()<CR>
nmap <silent> <leader>pw :call DoWindowSwap()<CR>
nnoremap <leader>nt :call NerdPreviewToggle()<cr>
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
"Disabling arrow keys to learn the hjkl
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>
vnoremap <Up> <nop>
vnoremap <Down> <nop>
vnoremap <Left> <nop>
vnoremap <Right> <nop>
"EasyAlign stuff
vmap <Space> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
"Elm stuff
nnoremap <leader>el :ElmEvalLine<CR>
vnoremap <leader>es :<C-u>ElmEvalSelection<CR>
nnoremap <leader>em :ElmMakeCurrentFile<CR>

"Initial configuration
set relativenumber
set number
set autoindent
set list lcs=trail:·,precedes:«,extends:»,tab:▸\ ,eol:¬
set ls=2 "show status line even when there is only one file
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

"Run 256 colors on terminal
if $TERM == "xterm-256color" || $TERM == "rxvt-unicode-256color" || $TERM == "screen-256color"
	set t_Co=256
endif

"Get true color working on iterm with tmux
"if (has("termguicolors"))
	"set termguicolors
	"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"endif

if has('gui_running')
	"GUI settings
	set encoding=utf8
	set guioptions-=m  "remove menu bar
	set guioptions-=T  "remove toolbar
	set guioptions-=r  "remove right-hand scroll bar
	set guioptions-=L  "remove left-hand scroll bar
	colorscheme gotham
else
	"Non-GUI (terminal) colors
	"colorscheme jellybeans
	colorscheme dracula
	"colorscheme gotham
	"set background=light
	"colorscheme PaperColor
endif
set backupdir=~/.vimtmp,.
set directory=~/.vimtmp,.
















"I have to organize this later... so lazy
syn on
set background=dark
colorscheme gruvbox
hi vertsplit ctermfg=238 ctermbg=235
hi LineNr ctermfg=237
hi StatusLine ctermfg=235 ctermbg=245
hi StatusLineNC ctermfg=235 ctermbg=237
hi Search ctermbg=58 ctermfg=15
hi Default ctermfg=1
hi clear SignColumn
hi SignColumn ctermbg=235
hi GitGutterAdd ctermbg=235 ctermfg=245
hi GitGutterChange ctermbg=235 ctermfg=245
hi GitGutterDelete ctermbg=235 ctermfg=245
hi GitGutterChangeDelete ctermbg=235 ctermfg=245
hi EndOfBuffer ctermfg=237 ctermbg=235

set statusline=%=&P\ %f\ %m
set fillchars=vert:\ ,stl:\ ,stlnc:\ 
set laststatus=2
set noshowmode
