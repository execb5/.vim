"To make the snipMate work
filetype plugin on

"To make the NERDTree close with a file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"To make Syntastic work
let g:syntastic_auto_loc_list=1
let g:syntastic_disabled_filetypes=['html']
let g:syntastic_enable_signs=1
let g:syntastic_quiet_messages = {'level': 'warnings'}

"MiniBufferExplorer Configuration
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

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

"Remap to keyboard buttons
nmap <F2> :w<CR> 
imap <F2>  :w!<CR> i
nmap <F3> :wq<CR> 
nmap <F4> :q!<CR>
nmap <F5> :noh<CR>
nmap <F6> :vertical res +1<CR>
nmap <leader><F6> :res +1<CR>
nmap <F7> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F9> :vertical res -1<CR>
nmap <leader><F9> :res -1<CR>
nmap <F10> :wall<CR> 
nmap <F11> :wqall<CR> 
nmap <F12> :qall!<CR>
map <Leader>c :CMiniBufExplorer<cr>
map <Leader>u :UMiniBufExplorer<cr>
map <Leader>t :TMiniBufExplorer<cr>
nmap <silent> <leader>yw :call MarkWindowSwap()<CR>
nmap <silent> <leader>pw :call DoWindowSwap()<CR>

"Disabling default keys to learn the hjkl
"Disable Arrow keys in Escape mode.
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>
""Disable Arrow keys in insert mode
"imap <up> <nop>
"imap <down> <nop>
"imap <left> <nop>
"imap <right> <nop>

if $TERM == "xterm-256color"
  set t_Co=256
endif

"Initial configuration
set number
set autoindent
set nowrap
set hlsearch
set tabpagemax=30
set clipboard=unnamedplus
colo darkspectrum
