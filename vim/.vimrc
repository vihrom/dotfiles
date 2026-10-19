vim9script

# General
g:mapleader = " "
syntax on
set number
  \ relativenumber
  \ clipboard=unnamedplus
  \ laststatus=2
  \ nowrap
  \ ttimeoutlen=50
  \ updatetime=250
  \ signcolumn=yes
  \ lazyredraw
  \ tags=./tags;,tags;

# Search
set hlsearch incsearch ignorecase smartcase
nnoremap <ESC><ESC> <cmd>noh<CR>

# Undo
if !isdirectory(expand('~/.vim/undo'))
    mkdir(expand('~/.vim/undo'), 'p')
endif
set undofile undodir=~/.vim/undo

# Plugins
vim9cmd plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-sleuth'
Plug 'junegunn/vim-easy-align'
Plug 'powerman/vim-plugin-ruscmd'
Plug 'altercation/vim-colors-solarized'
vim9cmd plug#end()

packadd! editorconfig

# True Color Support & Colorscheme
set termguicolors
set background=light
colorscheme solarized

# Easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
