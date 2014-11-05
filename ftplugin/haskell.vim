"Vim can call ghc-mod from itself
let $PATH = $PATH . ':' . expand('~/.cabal/bin')

"Show detailed information(type) of symbols.
let g:necoghc_enable_detailed_browse = 1

"For omni-completion
setlocal omnifunc=necoghc#omnifunc

"Display unicode
let g:haskell_conceal_wide = 1

"Shortcut to fold and unfold functions and stuff
nmap <F8> :foldopen<CR>
nmap <Leader><Leader> :foldclose<CR>


set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
