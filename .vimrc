source $VIMRUNTIME/defaults.vim

function! ClipboardYank()
    call system('xclip -selection clipboard', getreg('"'))
endfunction

vnoremap y y:call ClipboardYank()<CR>

nnoremap yy yy:call ClipboardYank()<CR>

set number relativenumber 
