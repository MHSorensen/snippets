" Set Non-compatible mode
set nocompatible
set noshowmode

" Relative line numbers
set number

" Set tabs
set expandtab
set tabstop=4
set shiftwidth=4
set shiftround
set smarttab
filetype indent on

" Indention
set autoindent
set copyindent

" Set character encoding
set encoding=utf-8
set fileencoding=utf-8

" Word wrap and line breaks - don't break words
set formatoptions=1
set linebreak

" Leader key [Spacebar] (prefix just like CTRL + s in Tmux)
let mapleader=" "

" Key bindings
" Open new tab
map <leader>+ :tabnew<CR>
" Toggle spelling
map <leader>s :set spell!<CR>
" Easy navigate buffers with arrow keys
nmap <leader><Left> :bp<CR>
nmap <leader><Right> :bn<CR>
nmap <leader><Up> :buffers<CR>
nmap <leader><Down> :b
" Map double leader to fuzzy file finder
nmap <leader><leader> :FZF<CR>


" Fix ESC key delay
set timeoutlen=1000 ttimeoutlen=0

" Enable mouse support in vim
set mouse=a

" Auto install plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" Activate Lightline
set laststatus=2

" Show git info in Lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

