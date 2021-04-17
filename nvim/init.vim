if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set number relativenumber

syntax on

" configure tabs
set tabstop     =4   " width of the tab character
set softtabstop =4   " fine tunes the amount of whitespace to be added
set shiftwidth  =4   " determines the amount of whitespace to add in normal mode
set expandtab        " when this is enabled, vi will use spaces instead of tabs
set smartindent      " auto indentation 

" changing the keybindings to move between splits
nnoremap   <C-J>   <C-W><C-J>
nnoremap   <C-K>   <C-W><C-K>
nnoremap   <C-L>   <C-W><C-L>
nnoremap   <C-H>   <C-W><C-H>

" changing the keybindings for moving between tabs
nnoremap   <A-l>   gt
nnoremap   <A-h>   gT
nnoremap   <A-j>   gt
nnoremap   <A-k>   gT

let g:polyglot_disabled = ['ftdetect']


" plugins
call plug#begin()

"Plug 'cespare/vim-toml' " syntax highlighting for toml
Plug 'junegunn/fzf' " searching for files 

Plug 'sheerun/vim-polyglot' " syntax highlighting for many languages
"Plug 'tpope/vim-fugitive' " git integration into vim
Plug 'tpope/vim-surround' " better surrounding characters manipulation

" vscode-like file-tree and integration of git into it
Plug 'scrooloose/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'vim-airline/vim-airline' " improved bottom line of vim
Plug 'vim-airline/vim-airline-themes' " themes for vim-airline

Plug 'dracula/vim', { 'as': 'dracula' } " theme

Plug 'arzg/vim-colors-xcode'

"Plug 'nightsense/cosmic_latte'

"Plug 'ervandew/supertab'

call plug#end()


colorscheme dracula

" configuring nerdtree git integration
" TODO: change the symbols to be more legible 
"let g:NERDTreeGitStatusIndicatorMapCustom = {
"                \ 'Modified'  :'M',
"                \ 'Staged'    :'S',
"                \ 'Untracked' :'U',
"                \ 'Renamed'   :'R',
"                \ 'Unmerged'  :'═',
"                \ 'Deleted'   :'x',
"                \ 'Dirty'     :'D',
"                \ 'Ignored'   :'I',
"                \ 'Clean'     :'✔︎',
"                \ 'Unknown'   :'?',
"                \ }
"
