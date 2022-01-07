set shell=/bin/bash

set termguicolors

" make it so words are not split in the middle when they cannot fit onto the
" screen in their entirety
set linebreak

set number
syntax on
set mouse=a

" tabs
" configure tabs (fuck tabs, all my homies love spaces)
set tabstop     =4   " width of the tab character
set softtabstop =4   " fine tunes the amount of whitespace to be added
set shiftwidth  =4   " determines the amount of whitespace to add in normal mode
set expandtab        " when this is enabled, vi will use spaces instead of tabs
set smartindent      " auto indentation 

" changing the keybindings to move between splits
nnoremap <silent> <C-J>     <C-W><C-J>
nnoremap <silent> <C-K>     <C-W><C-K>
nnoremap <silent> <C-L>     <C-W><C-L>
nnoremap <silent> <C-H>     <C-W><C-H> 

" changing the keybindings for moving between tabs
" TOOD: change
nnoremap <silent> <A-l>     gt
nnoremap <silent> <A-h>     gT 
nnoremap <silent> <A-j>     gt
nnoremap <silent> <A-k>     gT

" nvim terminal keybindings
tnoremap <silent> <Esc>     <C-\><C-n>  " maps Esc to escaping the input of the terminal

if exists("g:hvim")
  " ALE configuration
  let g:ale_completion_enabled = 1
  let g:ale_completion_autoimport = 1
  let g:ale_sign_column_always = 1
  let g:ale_fix_on_save = 0
  let g:ale_hover_to_floating_preview = 1
  let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰']

  let g:ale_linters = {'rust': ['analyzer'], 'c': ['clangd']}
  "let g:ale_linters_explicit = 1
endif " g:hvim

call plug#begin()
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'pacokwon/onedarkhc.vim'

  Plug 'sheerun/vim-polyglot' " syntax highlighting for many languages
  Plug 'gentoo/gentoo-syntax'

  Plug 'junegunn/fzf' " well, this is fzf


  " vscode-like file-tree and integration of git into it
  Plug 'scrooloose/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'

  if exists("g:hvim")
    Plug 'dense-analysis/ale'
  endif " g:hvim
call plug#end()

set background=dark
colorscheme onedarkhc
let g:airline_theme='onedark'

if exists("g:hvim")
  set omnifunc=ale#completion#OmniFunc
  set completeopt=menu,menuone,preview


  nnoremap <silent> <S-k> :ALEHover<CR>
  nnoremap <silent> <S-l> :ALEGoToDefinition<CR>

  inoremap <silent><expr> <A-j>
        \ pumvisible() ? "\<C-n>" : "\<C-x>\<C-o>"
  inoremap <silent><expr> <A-k>
        \ pumvisible() ? "\<C-S-n>" : "\<A-k>"
endif

