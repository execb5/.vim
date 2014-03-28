autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let g:syntastic_auto_loc_list=1
let g:syntastic_disabled_filetypes=['html']
let g:syntastic_enable_signs=1

nmap <F7> :NERDTreeToggle<CR>

nmap <F8> :TagbarToggle<CR>

set number
set autoindent
set nowrap
set hlsearch
set tabpagemax=30
