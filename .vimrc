" General Setting
" line number
set number
colorscheme hybrid
" F2 copy paste mode
set pastetoggle=<F2>
" highlight search
set hlsearch
" fold
set foldmethod=indent

" jj into normal mode
inoremap jj <ESC>`^
" leader+w install directly
inoremap <leader>w <Esc>:w<cr>
noremap <leader>w :w<cr>

" switch buffer
nnoremap <silent> [b :bprevious<CR>
nnoremap <silert> [n :bnext<CR>
" use ctrl+h/j/k/l switch window
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" Plugin with vim-plug
call plug#begin('~/.vim/plugged')
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree'
call plug#end()

" config of Plugin
let g:startify_change_to_dir = 0

" nerdtree
nmap ,v :NERDTreeFind<cr>
nmap ,g :NERDTreeToggle<cr>
