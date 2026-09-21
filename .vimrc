" Set Space as the leader key
let mapleader = " "

" General settings
syntax on
set number
set relativenumber
set clipboard=unnamedplus
set laststatus=2
set nowrap
set ttimeoutlen=50

" Search
set hlsearch
set incsearch
nnoremap <ESC><ESC> :noh<CR>

" Undo history
set undofile
set undodir=~/.vim/undo

" Plugins
call plug#begin()

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

" LSP
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

call plug#end()

" LSP keybindings and functions
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> <f2> <plug>(lsp-rename)
    nmap <buffer> K <plug>(lsp-hover)
    
    " Diagnostic navigation ([d and ]d)
    nmap <buffer> [d <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]d <plug>(lsp-next-diagnostic)
    
    " Code Actions (Space + a)
    nmap <buffer> <leader>a <plug>(lsp-code-action)

    " Show errors for current file (Space + q)
    nmap <buffer> <leader>q :LspDocumentDiagnostics<CR>
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" Airline settings
let g:airline_powerline_fonts = 1

" FZF keybindings
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :Rg<CR>
nnoremap <leader>fb :Buffers<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Netrw navigation with h-l
augroup NetrwNavigation
  au!
  autocmd FileType netrw nmap <buffer> l <CR>
  autocmd FileType netrw nmap <buffer> h -
augroup END
