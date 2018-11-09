map <leader>f :MixFormat<CR>
let g:ale_completion_enabled = 1
nnoremap <c-]> :ALEGoToDefinition<cr>
nnoremap K :ALEHover<cr>
let g:ale_fixers = {}
let g:ale_fixers.elixir = ['mix_format']
let g:ale_fix_on_save = 1
let elixir_version = system("elixir --version | grep 'Elixir' | awk '{printf $2}'")
if elixir_version == "1.6.6"
	let g:ale_elixir_elixir_ls_release = '/Users/matthias/programs/elixir-ls/old_rel'
else
	let g:ale_elixir_elixir_ls_release = '/Users/matthias/programs/elixir-ls/rel'
endif

