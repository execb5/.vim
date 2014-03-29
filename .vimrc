"To make the snipMate work
:filetype plugin on

"To make the NERDTree close with a file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"To make Syntastic work
let g:syntastic_auto_loc_list=1
let g:syntastic_disabled_filetypes=['html']
let g:syntastic_enable_signs=1

"Remap to keyboard buttons
nmap <F7> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F2> :w<CR> 
nmap <F3> :wq<CR> 
nmap <F4> :q!<CR>

"Disabling default keys to learn the hjkl
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

"Initial configuration
set number
set autoindent
set nowrap
set hlsearch
set tabpagemax=30
