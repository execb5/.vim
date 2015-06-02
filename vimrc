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
        Plugin 'vim-scripts/screensaver.vim'
        Plugin 'haya14busa/incsearch.vim'
        Plugin 'junegunn/vim-easy-align'
        Plugin 'junegunn/seoul256.vim'
        Plugin 'junegunn/goyo.vim'
        Plugin 'junegunn/limelight.vim'
        Plugin 'vim-scripts/visualrepeat'
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

"Airline config
let g:airline_powerline_fonts = 1

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

"NERDTree preview
let g:nerd_preview_enabled = 0
let g:preview_last_buffer  = 0

function! NerdTreePreview()
  " Only on nerdtree window
  if (&ft ==# 'nerdtree')
    " Get filename
    let l:filename = substitute(getline("."), "^\\s\\+\\|\\s\\+$","","g")

    " Preview if it is not a folder
    let l:lastchar = strpart(l:filename, strlen(l:filename) - 1, 1)
    if (l:lastchar != "/" && strpart(l:filename, 0 ,2) != "..")

      let l:store_buffer_to_close = 1
      if (bufnr(l:filename) > 0)
        " Don't close if the buffer is already open
        let l:store_buffer_to_close = 0
      endif

      " Do preview
      execute "normal go"

      " Close previews buffer
      if (g:preview_last_buffer > 0)
        execute "bwipeout " . g:preview_last_buffer
        let g:preview_last_buffer = 0
      endif

      " Set last buffer to close it later
      if (l:store_buffer_to_close)
        let g:preview_last_buffer = bufnr(l:filename)
      endif
    endif
  elseif (g:preview_last_buffer > 0)
    " Close last previewed buffer
    let g:preview_last_buffer = 0
  endif
endfunction

function! NerdPreviewToggle()
  if (g:nerd_preview_enabled)
    let g:nerd_preview_enabled = 0
    augroup nerdpreview
      autocmd!
      augroup END
  else
    let g:nerd_preview_enabled = 1
    augroup nerdpreview
      autocmd!
      autocmd CursorMoved * nested call NerdTreePreview()
    augroup END
  endif
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
"For the incsearch plugin
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
"EasyAlign stuff
vmap <Space> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"Run 256 colors on terminal
if $TERM == "xterm-256color" || $TERM == "rxvt-unicode-256color"
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
if has('gui_running')
    " GUI colors
    colorscheme gotham
else
    " Non-GUI (terminal) colors
    colorscheme jellybeans
endif
set backupdir=~/.vimtmp,.
set directory=~/.vimtmp,.
"call NerdPreviewToggle()

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

"gViM stuff
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
