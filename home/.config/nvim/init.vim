set nocompatible
set number numberwidth=1
set autoindent
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
hi MatchParen cterm=bold ctermbg=none ctermfg=white

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

source $HOME/.config/nvim/config/plugged.vimrc
source $HOME/.config/nvim/config/coc.vimrc
