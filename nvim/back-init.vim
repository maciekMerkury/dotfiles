" this will be the new config, for both nvim and gnvim

" colours magic thing
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" make it so words are not split in the middle when they cannot fit onto the
" screen in their entirety
set linebreak

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
nnoremap  <C-J>    <C-W><C-J>
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


call plug#begin()
  Plug 'morhetz/gruvbox' " gruvbox theme
  Plug 'vim-airline/vim-airline' " improved bottom line of vim

  Plug 'sheerun/vim-polyglot' " syntax highlighting for many lankuages

  if exists("g:qtnvim") " qtnvim-specific plugins
    "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    "Plug 'Shougo/deoplete-lsp'
    Plug 'neovim/nvim-lspconfig'
    Plug 'simrat39/rust-tools.nvim'

    "Plug 'rust-lang/rust.vim'
    Plug 'racer-rust/vim-racer'
    
    " Optional dependencies
    "Plug 'nvim-lua/popup.nvim'
    "Plug 'nvim-lua/plenary.nvim'
    "Plug 'nvim-telescope/telescope.nvim'

    "Plug 'ncm2/ncm2'
    "Plug 'roxma/nvim-yarp'

    Plug 'neovim/nvim-lspconfig'

    Plug 'junegunn/fzf' " well, this is fzf

    " vscode-like file-tree and integration of git into it
    Plug 'scrooloose/nerdtree' |
              \ Plug 'Xuyuanp/nerdtree-git-plugin'

  elseif exists("g:enable_all_plugins") " all qtnvim plugins
    Plug 'morhetz/gruvbox' " gruvbox theme
    Plug 'rakr/vim-one', { 'as': 'one' } " onedark theme

    Plug 'vim-airline/vim-airline' " improved bottom line of vim

    Plug 'sheerun/vim-polyglot' " syntax highlighting for many lankuages

    Plug 'junegunn/fzf' " well, this is fzf

    " vscode-like file-tree and integration of git into it
    Plug 'scrooloose/nerdtree' |
                \ Plug 'Xuyuanp/nerdtree-git-plugin'

    "Plug 'neoclide/coc.nvim', {'branch': 'release'} " Completion engine

  else " pure nvim specific plugins


  endif

call plug#end()




" gruvbox configuration
let g:gruvbox_italic = 1
let g:gruvbox_bold = 1
let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_contrast_light = 'hard'

set background=dark
colorscheme gruvbox
let g:airline_theme='gruvbox'

if exists("g:qtnvim")
  lua require'lspconfig'.rust_analyzer.setup({})

  let g:racer_cmd="racer"

  "let g:deoplete#enable_at_startup = 1

  ""call deoplete#custom#source('_', 'max_menu_width', 80)

  "autocmd Filetype rust setlocal omnifunc=v:lua.vim.lsp.omnifunc
  "autocmd Filetype rust call ncm2#enable_for_buffer()

  "set completeopt=noinsert,menuone,noselect

  "set shortmess+=c
  "inoremap <c-c> <ESC>

  "map <C-n> deoplete#complete()

  "inoremap <silent><expr> <C-TAB>
  "\ pumvisible() ? "\<C-n>" :
  "\ deoplete#manual_complete()

  "call deoplete#custom#source('_', 'smart_case', v:true)

  
  " Press Tab to scroll _down_ a list of auto-completions
  "let g:SuperTabDefaultCompletionType = "<C-n>"
endif




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

