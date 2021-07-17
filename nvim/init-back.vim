if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set number


" configure tabs
set tabstop     =4   " width of the tab character
set softtabstop =4   " fine tunes the amount of whitespace to be added
set shiftwidth  =4   " determines the amount of whitespace to add in normal mode
set expandtab        " when this is enabled, vi will use spaces instead of tabs
set smartindent      " auto indentation 

" changing the keybindings to move between splits
nnoremap    <C-j>   <C-W><C-J>
nnoremap    <C-k>   <C-W><C-K>
nnoremap    <C-l>   <C-W><C-L>
nnoremap    <C-h>   <C-W><C-H>

" changing the keybindings for resizing the splits
nnoremap    <C-A-j> <C-W><C--> 
nnoremap    <C-A-k> <C-W><C-+> 
nnoremap    <C-A-l> <C-W><C->> 
nnoremap    <C-A-h> <C-W><C-<> 

" changing the keybindings for moving between tabs
nnoremap    <A-l>   gt
nnoremap    <A-h>   gT
nnoremap    <A-j>   gt
nnoremap    <A-k>   gT

"runtime medium.vim

" plugins
call plug#begin()

  Plug 'cespare/vim-toml' " syntax highlighting for toml
  "Plug 'junegunn/fzf' " searching for files 

  Plug 'sheerun/vim-polyglot' " syntax highlighting for many lankuages
  "Plug 'tpope/vim-fugitive' " git integration into vim
  Plug 'tpope/vim-surround' " better surrounding characters manipulation

  " vscode-like file-tree and integration of git into it
  Plug 'scrooloose/nerdtree' |
              \ Plug 'Xuyuanp/nerdtree-git-plugin'

  Plug 'vim-airline/vim-airline' " improved bottom line of vim

  Plug 'dracula/vim', { 'as': 'dracula' } " theme
  Plug 'NLKNguyen/papercolor-theme', { 'as': 'PaperColor' } " theme, but better
  Plug 'nightsense/stellarized' " light theme, but actually visible
  Plug 'rakr/vim-one', { 'as': 'one' }

  Plug 'morhetz/gruvbox'

call plug#end()

set mouse=a

" gruvbox configuration
let g:gruvbox_italic=1
let g:gruvbox_bold=1
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_contrast_light='hard'

set background=dark
colorscheme gruvbox
let g:airline_theme='gruvbox'

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
