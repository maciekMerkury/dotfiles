set number relativenumber

syntax on

set omnifunc=ale#completion#OmniFunc
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1

call plug#begin()

Plug 'cespare/vim-toml'
Plug 'junegunn/fzf'
Plug 'sheerun/vim-polyglot'
Plug 'alaviss/nim.nvim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'dense-analysis/ale'

call plug#end()

set tabstop     =4 " Width of tab character
set softtabstop =4 " Fine tunes the amount of white space to be added
set shiftwidth  =4 " Determines the amount of whitespace to add in normal mode
set expandtab      " When this option is enabled, vi will use spaces instead of tabs
filetype plugin indent on

let g:asyncomplete_auto_popup = 1

au User asyncomplete_setup call asyncomplete#register_source({
    \ 'name': 'nim',
    \ 'whitelist': ['nim'],
    \ 'completor': {opt, ctx -> nim#suggest#sug#GetAllCandidates({start, candidates -> asyncomplete#complete(opt['name'], ctx, start, candidates)})}
    \ })

if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        \ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
        \ 'whitelist': ['rust'],
        \ })
endif
