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

call plug#begin()
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'pacokwon/onedarkhc.vim'
  
  " vscode-like file-tree
  Plug 'scrooloose/nerdtree'

  " brackets and stuff
  "Plug 'max-0406/autoclose.nvim'

  " syntax highlighting
  Plug 'sheerun/vim-polyglot'
  Plug 'gentoo/gentoo-syntax'


  Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }

  if exists("g:hvim")
    " git integration to nerdtree
    Plug 'Xuyuanp/nerdtree-git-plugin'

    " lsp loading UI
    Plug 'j-hui/fidget.nvim'
    " nice colours for LSP output
    Plug 'folke/trouble.nvim'
    Plug 'simrat39/rust-tools.nvim'
    Plug 'neovim/nvim-lspconfig'

    " shows stuff
    Plug 'kosayoda/nvim-lightbulb'
    " allows for VSCode-style code action menu
    Plug 'weilbith/nvim-code-action-menu'

    " i'm not really sure what those all plugins do, but I use them for completion
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'
    Plug 'm-demare/hlargs.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  endif " g:hvim
call plug#end()

" colour scheme
set background=dark
colorscheme onedarkhc
let g:airline_theme='onedark'

augroup project
  autocmd!
  autocmd BufRead,BufNewFile *.S,*.s set filetype=asm
augroup END

if exists("g:hvim")
lua require("fidget").setup()
lua require("trouble").setup()
" for weilbith/nvim-code-action-menu
let g:code_action_menu_window_border = 'single'

" configure Rust LSP
" https://github.com/simrat39/rust-tools.nvim#configuration
lua <<EOF
local opts = {
  -- rust-tools options
  tools = {
    autoSetHints = true,
    --hover_with_actions = true,
    inlay_hints = {
      show_parameter_hints = true,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
      },
    },

  server = {
    settings = {
      ["rust-analyzer"] = {
        assist = {
          importEnforceGranularity = true,
          importPrefix = "crate"
          },
        cargo = {
          allFeatures = true,
          --unsetTest = {"core", "crate"}
          },
        checkOnSave = {
          allTargets = false,
          --default: `cargo check`
          --command = 'cargo check'
          --command = "clippy"
          },
        },
        inlayHints = {
          lifetimeElisionHints = {
            enable = true,
            useParameterNames = true
          },
        },
      }
    },
}
require('rust-tools').setup(opts)
EOF

endif " g:hvim

" moving between splits
nnoremap <silent> <C-J>     <C-W><C-J>
nnoremap <silent> <C-K>     <C-W><C-K>
nnoremap <silent> <C-L>     <C-W><C-L>
" unmap <C-H>
nnoremap <silent> <C-H>     <C-W><C-H> 

" moving between tabs
nnoremap <silent> <A-j>     gT
nnoremap <silent> <A-k>     gt

" escape in the nvim terminal
tnoremap <silent> <Esc>     <C-\><C-n> 

nnoremap <silent> <S-e>     :NERDTreeToggle<CR>

if exists("g:hvim")
  nnoremap <silent> K         <cmd>lua vim.lsp.buf.hover()<CR>
  nnoremap <silent> L         <cmd>lua vim.lsp.buf.definition()<CR>

  nnoremap <silent> <space>q  <cmd>TroubleToggle<CR>
  " shows the code action menu
  nnoremap <silent> ga        <cmd>CodeActionMenu<CR>

  " jumps to previous found issue
  nnoremap <silent> [x        <cmd>lua vim.diagnostic.goto_prev()<CR>
  " jumps to next found issue
  nnoremap <silent> ]x        <cmd>lua vim.diagnostic.goto_next()<CR>
  " shows all found issues
  nnoremap <silent> ]s        <cmd>lua vim.diagnostic.show()<CR>
  " hide all found issues
  nnoremap <silent> [s        <cmd>lua vim.diagnostic.hide()<CR>

  nnoremap <silent> Rn        <cmd>lua vim.lsp.buf.rename()<CR>

  " not really sure what the point of this is
  nnoremap <silent> <space>q  <cmd>Trouble<CR>

  " Setup Completion
lua <<EOF
local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<A-k>'] = cmp.mapping.select_prev_item(),
    ['<A-j>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-o>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-e>'] = cmp.mapping.close(),
    ['<Tab>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
    { name = 'nvim_lsp_signature_help' },
  },
})
EOF

lua<<EOF
capabilities = require('cmp_nvim_lsp').default_capabilities()

local lsp_conf = require('lspconfig')

lsp_conf.clangd.setup {
  capabilities = capabilities,
}

lsp_conf.texlab.setup {
    capabilities = capabilities,
        settings = {
            texlab = {
                build = {
                    onSave = true,
                    args = { '-pdf', '-interaction=nonstopmode', '-synctex=1', '-auxdir=aux', '-outdir=output', '%f' },
                },
                forwardSearch = {
                    executable = 'evince-synctex',
                    --TODO: this still doesn't fully work
                },
                chktex = {
                    onOpenAndSave = true,
                    onEdit = true,
                },
            }
    }
}

EOF

" Treesitter config
lua <<EOF
require('nvim-treesitter.configs').setup {
  ensure_installed = { "bash", "c", "cpp", "cmake", "help", "json", "lua", "make", "markdown", "regex", "rust", "toml", "vim", "yaml", "zig", "haskell" },
  highlight = {
    enable = true,
    disable = { "latex" }
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}
require('hlargs').setup()
EOF
" folding with treesitter
set nofoldenable
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
endif

