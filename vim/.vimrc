vim9script

# General
g:mapleader = " "
syntax on
set number relativenumber clipboard=unnamedplus laststatus=2 nowrap ttimeoutlen=50 autochdir updatetime=250 signcolumn=yes

# Search
set hlsearch incsearch
nnoremap <ESC><ESC> <cmd>noh<CR>

# Undo
set undofile undodir=~/.vim/undo

# Plugins
legacy call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-sleuth'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'
Plug 'powerman/vim-plugin-ruscmd'
Plug 'airblade/vim-gitgutter'
Plug 'yegappan/lsp'
Plug 'morhetz/gruvbox'
Plug 'ntpeters/vim-better-whitespace'
Plug 'editorconfig/editorconfig-vim'
legacy call plug#end()

# Plugin Settings & Maps
g:airline_powerline_fonts = 1
g:airline#extensions#whitespace#enabled = 0
g:better_whitespace_enabled = 0
nnoremap <leader>ff <cmd>Files<CR>
nnoremap <leader>fg <cmd>Rg<CR>
nnoremap <leader>fb <cmd>Buffers<CR>
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

# True Color Support & Colorscheme
set termguicolors
set background=dark
colorscheme gruvbox

# LSP Config & Servers Registration
def LspInit()
    g:LspOptionsSet({
        showDiagWithVirtualText: true,
        completionMatcher: 'fuzzy'
    })

    var servers = [
        {name: 'clangd', filetype: ['c', 'cpp'], path: 'clangd', args: ['--background-index', '--clang-tidy']},
        {name: 'gopls', filetype: ['go'], path: 'gopls', args: ['serve'], syncInit: true},
        {name: 'pyright', filetype: ['python'], path: 'pyright-langserver', args: ['--stdio']},
        {name: 'ruff', filetype: ['python'], path: 'ruff', args: ['server']}
    ]
    g:LspAddServer(servers)
enddef

def LspMappings()
    setlocal omnifunc=lsp#complete
    nnoremap <buffer> gd <cmd>LspGotoDefinition<CR>
    nnoremap <buffer> gr <cmd>LspShowReferences<CR>
    nnoremap <buffer> gi <cmd>LspGotoImpl<CR>
    nnoremap <buffer> <f2> <cmd>LspRename<CR>
    nnoremap <buffer> K <cmd>LspHover<CR>
    nnoremap <buffer> [d <cmd>LspDiag prev<CR>
    nnoremap <buffer> ]d <cmd>LspDiag next<CR>
    nnoremap <buffer> <leader>a <cmd>LspCodeAction<CR>
    nnoremap <buffer> <leader>q <cmd>LspDiag show<CR>
enddef

augroup Vim9Lsp
    autocmd!
    autocmd User LspSetup LspInit()
    autocmd User LspAttached LspMappings()
augroup END
