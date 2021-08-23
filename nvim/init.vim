" this will be the new config, incorporating both nvim and gnvim

" colours magic thing
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set number
syntax on
set mouse=a

" configure tabs (fuck tabs, all my homies love spaces)
set tabstop     =4   " width of the tab character
set softtabstop =4   " fine tunes the amount of whitespace to be added
set shiftwidth  =4   " determines the amount of whitespace to add in normal mode
set expandtab        " when this is enabled, vi will use spaces instead of tabs
set smartindent      " auto indentation 

" changing the keybindings to move between splits
nnoremap  <C-j>    <C-W><C-J>
nnoremap  <C-K>    <C-W><C-K>
nnoremap  <C-L>    <C-W><C-L>
nnoremap  <C-H>    <C-W><C-H> 

" changing the keybindings for resizing the splits
nnoremap    <C-A-j> <C-W><C--> 
nnoremap    <C-A-k> <C-W><C-+> 
nnoremap    <C-A-l> <C-W><C->> 
nnoremap    <C-A-h> <C-W><C-<> 

" changing the keybindings for moving between tabs
nnoremap  <A-l>     gt
nnoremap  <A-h>     gT 
nnoremap  <A-j>     gt
nnoremap  <A-k>     gT

" nvim terminal keybindings (also applicable to gnvim)
tnoremap  <Esc>    <C-\><C-n>  " maps Esc to escaping the input of the terminal

if exists("g:gnvim") " gnvim-only settings

  call plug#begin() " plugins for gnvim

    Plug 'junegunn/fzf' " well, this is fzf
    
    " vscode-like file-tree and integration of git into it
    Plug 'scrooloose/nerdtree' |
                \ Plug 'Xuyuanp/nerdtree-git-plugin'



    "Plug 'neoclide/coc.nvim', {'branch': 'release'} " Completion engine
  call plug#end()

  " NERDTree keybindings

  
else " standard nvim settings

  call plug#begin() " plugins for standard nvim
  call plug#end()

endif

" plugins for all of
call plug#begin()
  Plug 'morhetz/gruvbox' " gruvbox theme
  Plug 'rakr/vim-one', { 'as': 'one' } " onedark theme

  Plug 'vim-airline/vim-airline' " improved bottom line of vim

  Plug 'sheerun/vim-polyglot' " syntax highlighting for many lankuages
call plug#end()

if exists("g:all_plugins_for_debug_and_stuff")
  call plug#begin()
    Plug 'morhetz/gruvbox' " gruvbox theme
    Plug 'rakr/vim-one', { 'as': 'one' } " onedark theme

    Plug 'vim-airline/vim-airline' " improved bottom line of vim

    Plug 'sheerun/vim-polyglot' " syntax highlighting for many lankuages

    Plug 'junegunn/fzf' " well, this is fzf
    
    " vscode-like file-tree and integration of git into it
    Plug 'scrooloose/nerdtree' |
                \ Plug 'Xuyuanp/nerdtree-git-plugin'

    "Plug 'neoclide/coc.nvim', {'branch': 'release'} " Completion engine

  call plug#end()
endif


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

