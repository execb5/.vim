
"Defining leader
let mapleader = ","

call plug#begin('~/.vim/plugged')

	"Workflow
	Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
	Plug 'scrooloose/syntastic'
	Plug 'scrooloose/nerdcommenter'
	Plug 'mileszs/ack.vim', { 'on': 'Ack' }
	Plug 'majutsushi/tagbar'
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-fugitive'
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'terryma/vim-multiple-cursors'
	Plug 'Townk/vim-autoclose'
	Plug 'junegunn/vim-easy-align'
	Plug 'wakatime/vim-wakatime'                                    "Waka-time

	"Ruby
	Plug 'tpope/vim-endwise', { 'for': 'ruby' }
	Plug 'tpope/vim-rails', { 'for': 'ruby' }

	"C
	Plug 'justinmk/vim-syntax-extra', { 'for': 'c' }                "better syntax highlight for C
	Plug 'a.vim', { 'for': ['c', 'cpp'] }                           "Alternate Files quickly (.c --> .h etc)
	Plug 'drmikehenry/vim-headerguard', { 'for': ['c', 'cpp'] }     "Vim plugin for adding header guards to C/C++ header files

	"C++
	Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }       "Additional Vim syntax highlighting for C++

	"Pretify things
	Plug 'vim-airline/vim-airline'
	Plug 'mhinz/vim-signify'                                        "show what changed in file
	Plug 'ryanoasis/vim-devicons'                                   "icons
	Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }  "show git signs in nerdtree

	"Colorschemes
	Plug 'whatyouhide/vim-gotham'
	Plug 'NLKNguyen/papercolor-theme'
	Plug 'nanotech/jellybeans.vim'

call plug#end()

"NERDTree close when quitting
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Detect *.md as markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
"Detect *.tex as latex
autocmd BufNewFile,BufReadPost *.tex set filetype=tex

"Use ag with ack vim
let g:ackprg = 'ag --vimgrep'

"To make Syntastic work
let g:syntastic_auto_loc_list=1
let g:syntastic_disabled_filetypes=['html']
let g:syntastic_enable_signs=1
let g:syntastic_quiet_messages = {'level': 'warnings'}

"Airline config
let g:airline_powerline_fonts = 1

"Signify option
let g:signify_vcs_list = [ 'git', 'svn' ]

"vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

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
map <F6> :setlocal spell! spelllang=en_us<CR>
nmap <F7> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
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
"Disabling default keys to learn the hjkl
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
"EasyAlign stuff
vmap <Space> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

set t_Co=256

"Initial configuration
set relativenumber
set number
set autoindent
set list lcs=trail:·,precedes:«,extends:»,tab:▸\ ,eol:¬
set ls=2 "show status line even when there is only one file
set textwidth=72
set showcmd
set digraph
set visualbell
set noerrorbells
set noexpandtab
set whichwrap=h,l
set viminfo=%,'50
set viminfo+=\"100,:100
set viminfo+=n~/.viminfo
set nowrap
set hlsearch
set tabpagemax=30
set clipboard=unnamedplus
set mouse=a
set tabstop=8
set shiftwidth=8
set softtabstop=8
set wildmenu
"Choose which buffer to go
nnoremap gb :ls<CR>:b<Space>
set incsearch
if has('gui_running')
	"GUI colors
	set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ Mono\ Plus\ Pomicons\ Book\ 9
	set encoding=utf8
	set guioptions-=m  "remove menu bar
	set guioptions-=T  "remove toolbar
	set guioptions-=r  "remove right-hand scroll bar
	set guioptions-=L  "remove left-hand scroll bar
	colorscheme gotham
else
	"Non-GUI (terminal) colors
	"colorscheme jellybeans
	"colorscheme gotham
	set background=light
	colorscheme PaperColor
endif
set backupdir=~/.vimtmp,.
set directory=~/.vimtmp,.

syn on

"Transparent background
"hi Normal ctermbg=NONE
"hi Comment ctermbg=NONE
"hi Constant ctermbg=NONE
"hi Special ctermbg=NONE
"hi Identifier ctermbg=NONE
"hi Statement ctermbg=NONE
"hi PreProc ctermbg=NONE
"hi Type ctermbg=NONE
"hi Underlined ctermbg=NONE
"hi Todo ctermbg=NONE
"hi String ctermbg=NONE
"hi Function ctermbg=NONE
"hi Conditional ctermbg=NONE
"hi Repeat ctermbg=NONE
"hi Operator ctermbg=NONE
"hi Structure ctermbg=NONE
