set number relativenumber

syntax on

call plug#begin()

Plug 'cespare/vim-toml'
Plug 'junegunn/fzf'
Plug 'sheerun/vim-polyglot'
Plug 'alaviss/nim.nvim'
Plug 'prabirshrestha/asyncomplete.vim'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
\ }

call plug#end()

set tabstop     =4 " Width of tab character
set softtabstop =4 " Fine tunes the amount of white space to be added
set shiftwidth  =4 " Determines the amount of whitespace to add in normal mode
set expandtab      " When this option is enabled, vi will use spaces instead of tabs


let g:asyncomplete_auto_popup = 1

au User asyncomplete_setup call asyncomplete#register_source({
    \ 'name': 'nim',
    \ 'whitelist': ['nim'],
    \ 'completor': {opt, ctx -> nim#suggest#sug#GetAllCandidates({start, candidates -> asyncomplete#complete(opt['name'], ctx, start, candidates)})}
    \ })

let g:LanguageClient_server_commands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
\ }
