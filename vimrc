set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
        Plugin 'gmarik/Vundle.vim'
        Plugin 'scrooloose/nerdtree'
        Plugin 'scrooloose/syntastic'
        Plugin 'scrooloose/nerdcommenter'
        Plugin 'mileszs/ack.vim'
        Plugin 'majutsushi/tagbar'
        Plugin 'tpope/vim-endwise'
        Plugin 'tpope/vim-repeat'
        Plugin 'tpope/vim-speeddating'
        Plugin 'tpope/vim-surround'
        Plugin 'tpope/vim-unimpaired'
        Plugin 'tpope/vim-fugitive'
        Plugin 'tpope/vim-rails'
        Plugin 'tpope/vim-abolish'
        Plugin 'fholgado/minibufexpl.vim'
        Plugin 'kien/ctrlp.vim'
        Plugin 'terryma/vim-multiple-cursors'
        Plugin 'bling/vim-airline'
        Plugin 'mhinz/vim-signify'
        Plugin 'Yggdroot/indentLine'
        Plugin 'gregsexton/gitv'
        Plugin 'sjl/gundo.vim'
        Plugin 'godlygeek/csapprox'
        Plugin 'suan/vim-instant-markdown'
        Bundle "MarcWeber/vim-addon-mw-utils"
        Bundle "tomtom/tlib_vim"
        Bundle "garbas/vim-snipmate"
        Bundle "honza/vim-snippets"
call vundle#end()

filetype plugin indent on

"Force NERDTree to close with last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"To make Syntastic work
let g:syntastic_auto_loc_list=1
let g:syntastic_disabled_filetypes=['html']
let g:syntastic_enable_signs=1
let g:syntastic_quiet_messages = {'level': 'warnings'}

"MiniBufferExplorer Configuration
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1

"Signify option
let g:signify_vcs_list = [ 'git', 'svn' ]

"Defining leader
let mapleader = ","

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

"Set persistant undo
if has("persistent_undo")
        set undodir='~/.undodir/'
        set undofile
endif

"Keybindings
nmap <F2> :w<CR>
imap <F2> :w!<CR> i
nmap <F3> :wq<CR>
nmap <F4> :q!<CR>
nmap <F5> :noh<CR>
nmap <F6> :vertical res +1<CR>
nmap <leader><F6> :res +1<CR>
nmap <F7> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F9> :vertical res -1<CR>
nmap <leader><F9> :res -1<CR>
nmap <F10> :GundoToggle<CR>
map <Leader>e :MBEOpen<cr>
map <Leader>c :MBEClose<cr>
map <Leader>t :MBEToggle<cr>
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

"Disabling default keys to learn the hjkl
"Disable Arrow keys in Escape mode.
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
""Disable Arrow keys in insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

"Run 256 colors on terminal
if $TERM == "xterm-256color"
  set t_Co=256
endif

"Initial configuration
set relativenumber
set number
set autoindent
set nowrap
set hlsearch
set tabpagemax=30
set clipboard=unnamedplus
set mouse=a
set expandtab
set tabstop=8
set shiftwidth=8
set softtabstop=8
set wildmenu
colo jellybeans
