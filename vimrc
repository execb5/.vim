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
        Plugin 'MarcWeber/vim-addon-mw-utils'
        Plugin 'tomtom/tlib_vim'
        Plugin 'garbas/vim-snipmate'
        Plugin 'honza/vim-snippets'
        Plugin 'ervandew/supertab'
        Plugin 'Townk/vim-autoclose'
        Plugin 'dag/vim2hs' "<-Haskell
        Plugin 'eagletmt/ghcmod-vim' "<-Haskell
        Plugin 'Shougo/vimproc.vim' "<-Haskell    Needs to run 'make' after installing
        Plugin 'eagletmt/neco-ghc' "<-Haskell
        Plugin 'whatyouhide/vim-gotham'
call vundle#end()

filetype plugin indent on

"Force NERDTree to close with last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"Detect *.md as markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

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

"Disable latex conceal
let g:tex_conceal = ""

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
imap <F2> :w!<CR> i
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
"Keybindings using Leader
nmap <Leader>w :w<CR>
nmap <Leader>wq :wq<CR>
nmap <Leader>q :q<CR>
nmap <Leader>g :GundoToggle<CR>
nmap <Leader>n :NERDTreeToggle<CR>
nmap <Leader>m :TagbarToggle<CR>
nmap <Leader>b :TagbarToggle<CR>:NERDTreeToggle<CR>
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
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
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
set incsearch
"colo jellybeans
colo gotham256

"Transparent background
hi Normal ctermbg=NONE
hi Comment ctermbg=NONE
hi Constant ctermbg=NONE
hi Special ctermbg=NONE
hi Identifier ctermbg=NONE
hi Statement ctermbg=NONE
hi PreProc ctermbg=NONE
hi Type ctermbg=NONE
hi Underlined ctermbg=NONE
hi Todo ctermbg=NONE
hi String ctermbg=NONE
hi Function ctermbg=NONE
hi Conditional ctermbg=NONE
hi Repeat ctermbg=NONE
hi Operator ctermbg=NONE
hi Structure ctermbg=NONE
