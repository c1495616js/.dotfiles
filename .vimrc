" General Setting
" line number
set number
" F2 copy paste mode
set pastetoggle=<F2>
" highlight search
set hlsearch
" fold
set foldmethod=indent
set encoding=UTF-8

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

" Vim-Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugin with vim-plug
call plug#begin('~/.vim/plugged')
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree'
Plug 'tomasiser/vim-code-dark'
Plug 'ryanoasis/vim-devicons'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mhinz/vim-startify'
call plug#end()

colorscheme codedark
" config of Plugin
let g:startify_change_to_dir = 0

" nerdtree
nmap ,v :NERDTreeFind<cr>
nmap ,g :NERDTreeToggle<cr>
let NERDTreeShowHidden=1 " show hidden files

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_show_hidden = 1
