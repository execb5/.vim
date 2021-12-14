map <leader>f :MixFormat<CR>
"let g:ale_completion_enabled = 1
nnoremap <c-]> :ALEGoToDefinition<cr>
"nnoremap K :ALEHover<cr>
"let g:ale_fixers = {}
let g:ale_fixers.elixir = ['mix_format']
let g:ale_fix_on_save = 1
"let g:ale_elixir_elixir_ls_release = '/Users/matthias/programs/elixir-ls/rel'
