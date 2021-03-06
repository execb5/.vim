"Vim can call ghc-mod from itself
let $PATH = $PATH . ':' . expand('~/.cabal/bin')

"Show detailed information(type) of symbols.
let g:necoghc_enable_detailed_browse = 1

"For omni-completion
setlocal omnifunc=necoghc#omnifunc

"Display unicode
"let g:haskell_conceal_wide = 1

" disable all conceals, including the simple ones like
" lambda and composition
let g:haskell_conceal = 0

" disable concealing of 'enumerations': commatized lists like
" deriving clauses and LANGUAGE pragmas,
" otherwise collapsed into a single ellipsis
let g:haskell_conceal_enumerations = 0

"Shortcut to fold and unfold functions and stuff
nmap <Leader>fo :foldopen<CR>
nmap <Leader>fc :foldclose<CR>


set shiftwidth=8
set tabstop=8
set softtabstop=8
set expandtab
