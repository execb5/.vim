"Elm auto format on save
let g:elm_format_autosave = 1
map <leader>f :ElmFormat<CR>

nnoremap <leader>el :ElmEvalLine<CR>
vnoremap <leader>es :<C-u>ElmEvalSelection<CR>
nnoremap <leader>em :ElmMakeCurrentFile<CR>
