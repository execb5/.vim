set nocompatible
filetype off

"Defining leader
let mapleader = ","

call plug#begin('~/.vim/plugged')

	"Workflow
	Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
	Plug 'scrooloose/syntastic'
	Plug 'scrooloose/nerdcommenter'
	Plug 'mileszs/ack.vim', { 'on': 'Ack' }
	Plug 'majutsushi/tagbar'
	Plug 'tpope/vim-endwise', { 'for': 'ruby' }
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-rails', { 'for': 'ruby' }
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'terryma/vim-multiple-cursors'
	Plug 'garbas/vim-snipmate'
	Plug 'MarcWeber/vim-addon-mw-utils'                             "dependency for snipmate
	Plug 'tomtom/tlib_vim'                                          "dependency for snipmate
	Plug 'honza/vim-snippets'                                       "without this snipmate would be useless
	Plug 'ervandew/supertab'
	Plug 'Townk/vim-autoclose'
	Plug 'junegunn/vim-easy-align'
	Plug 'suan/vim-instant-markdown'

	"C
	Plug 'justinmk/vim-syntax-extra', { 'for': 'c' }                "better syntax highlight for C
	Plug 'a.vim', { 'for': 'c' }                                    "Alternate Files quickly (.c --> .h etc)
	Plug 'drmikehenry/vim-headerguard', { 'for': 'c' }              "Vim plugin for adding header guards to C/C++ header files

	"C++
	Plug 'vim-jp/cpp-vim', { 'for': 'cpp' }                         "c or cpp syntax files
	Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }       "Additional Vim syntax highlighting for C++

	"Pretify things
	Plug 'vim-airline/vim-airline'
	Plug 'mhinz/vim-signify'                                        "show what changed in file
	Plug 'ryanoasis/vim-devicons'                                   "icons
	Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }  "show git signs in nerdtree

	"Colorschemes
	Plug 'whatyouhide/vim-gotham'
	Plug 'junegunn/seoul256.vim'
	Plug 'chriskempson/base16-vim'
	Plug 'NLKNguyen/papercolor-theme'
	Plug 'nanotech/jellybeans.vim'

call plug#end()

filetype plugin indent on

"NERDTree close when quitting
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Detect *.md as markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
"Detect *.gd as gdscript
autocmd BufNewFile,BufReadPost *.gd set filetype=gdscript

"To make Syntastic work
let g:syntastic_auto_loc_list=1
let g:syntastic_disabled_filetypes=['html']
let g:syntastic_enable_signs=1
let g:syntastic_quiet_messages = {'level': 'warnings'}

"Airline config
let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#show_tabs = 1
"let g:airline#extensions#tabline#show_tab_nr = 1
"let g:airline#extensions#tabline#tab_nr_type = 2
"let g:airline#extensions#tabline#buffer_idx_mode = 1
"nmap <leader>1 <Plug>AirlineSelectTab1
"nmap <leader>2 <Plug>AirlineSelectTab2
"nmap <leader>3 <Plug>AirlineSelectTab3
"nmap <leader>4 <Plug>AirlineSelectTab4
"nmap <leader>5 <Plug>AirlineSelectTab5
"nmap <leader>6 <Plug>AirlineSelectTab6
"nmap <leader>7 <Plug>AirlineSelectTab7
"nmap <leader>8 <Plug>AirlineSelectTab8
"nmap <leader>9 <Plug>AirlineSelectTab9

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

"Use ranger to open files
function! RangeChooser()
	let temp = tempname()
	" The option "--choosefiles" was added in ranger 1.5.1. Use the next line
	" with ranger 1.4.2 through 1.5.0 instead.
	"exec 'silent !ranger --choosefile=' . shellescape(temp)
	if has("gui_running")
		exec 'silent !xterm -e ranger --choosefiles=' . shellescape(temp)
	else
		exec 'silent !ranger --choosefiles=' . shellescape(temp)
	endif
	if !filereadable(temp)
		redraw!
		" Nothing to read.
		return
	endif
	let names = readfile(temp)
	if empty(names)
		redraw!
		" Nothing to open.
		return
	endif
	" Edit the first item.
	exec 'edit ' . fnameescape(names[0])
	" Add any remaning items to the arg list/buffer list.
	for name in names[1:]
		exec 'argadd ' . fnameescape(name)
	endfor
	redraw!
endfunction
command! -bar RangerChooser call RangeChooser()
nnoremap <leader>r :<C-U>RangerChooser<CR>

"Keybindings
nmap <F2> :w<CR>
imap <F2> :w<CR>a
nmap <F3> :wq!<CR>
nmap <F4> :q!<CR>
nmap <F5> :noh<CR>
nmap <F7> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F10> :GundoToggle<CR>
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

"Run 256 colors on terminal
if $TERM == "xterm-256color" || $TERM == "rxvt-unicode-256color"
	set t_Co=256
	"set t_Co=16
endif

"Initial configuration
set relativenumber
set number
set autoindent
set list lcs=trail:·,precedes:«,extends:»,eol:¬,tab:▸\ 
"set ls=2 "show status line even when there is only one file
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
