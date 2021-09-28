set shell=/bin/bash

set nocompatible
" idk
"filetype off
" idk tho
"set rtp+=~/dev/others/base16/templates/vim

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
nnoremap <silent> <A-l>     gt
nnoremap <silent> <A-h>     gT 
nnoremap <silent> <A-j>     gt
nnoremap <silent> <A-k>     gT

" nvim terminal keybindings (also applicable to gnvim)
tnoremap <silent> <Esc>     <C-\><C-n>  " maps Esc to escaping the input of the terminal

let mapleader = ","


" Plugins
call plug#begin()
  " plugins for all vims
  Plug 'morhetz/gruvbox' " gruvbox theme
  Plug 'vim-airline/vim-airline' " improved bottom line of vim

  Plug 'sheerun/vim-polyglot' " syntax highlighting for many lankuages
  
  " VIM enhancements
  Plug 'ciaranm/securemodelines'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'justinmk/vim-sneak'
  Plug 'wesQ3/vim-windowswap'

  if exists("g:qtnvim")
    Plug 'junegunn/fzf' " well, this is fzf


    " vscode-like file-tree and integration of git into it
    Plug 'scrooloose/nerdtree' |
              \ Plug 'Xuyuanp/nerdtree-git-plugin'
    
    " language support
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/lsp_extensions.nvim'
    Plug 'nvim-lua/completion-nvim'
    "Plug 'neovim/ft_rust'

    " language support
    Plug 'cespare/vim-toml'
    Plug 'stephpy/vim-yaml'
    Plug 'rust-lang/rust.vim'
    Plug 'plasticboy/vim-markdown'
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

  " folding blocks in rust
  " 0 => no folding
  " 1 => folding, all folds opened by default
  " 2 => folding, all folds closed by default
  let g:rust_fold = 2

  " LSP configuration
  lua << END
  local lspconfig = require('lspconfig')
  local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    --Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-A-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

    -- Forward to other plugins
    require'completion'.on_attach(client)
  end

  local servers = { "rust_analyzer" }
  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
      }
    }
  end

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = true,
      signs = true,
      update_in_insert = true,
    }
  )
END

" Completion
" Better completion
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

endif " g:qtnvim


nnoremap <silent> <C-J>     <C-W><C-J>
nnoremap <silent> <C-K>     <C-W><C-K>
nnoremap <silent> <C-L>     <C-W><C-L>
nnoremap <silent> <C-H>     <C-W><C-H> 

