set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'jiangmiao/auto-pairs'
call vundle#end()            " required
filetype plugin indent on  

call plug#begin()
"Plug 'arcticicestudio/nord-vim'
"Plug 'KKPMW/sacredforest-vim'
Plug 'sheerun/vim-polyglot'
Plug 'honza/vim-snippets'
Plug 'vim-airline/vim-airline'
"Plug 'xavierd/clang_complete'
Plug 'w0rp/ale'
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

colorscheme dracula 

" configure airline

let g:airline#extensions#tabline#enabled = 1
    
" map leader character to space
let mapleader = "\<Space>"

" show line numbers relative to current line
set number

set t_Co=256
set t_ut=

" enable syntax highlighting
filetype plugin on
syntax on

" highlight cursor
set cursorline

" buffer lines when scrolling
set scrolloff=5

" always have status line
set laststatus=2


" change Y behavior to yank from cursor to end of line
nnoremap Y y$

" make seaching nicer
set hlsearch
set incsearch
set ignorecase
set smartcase

" prevent vim from adding ^M
set binary

" leader commands
" enable replace of word under cursor (shortcut <space> s)
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
" quick save
nnoremap <Leader>w :w<CR>
" remove highlighting
nnoremap <Leader>h :noh<CR>
" destroy buffer
nnoremap <Leader>d :bd<CR>
" switch to next buffer
nnoremap <Leader>n :bn<CR>
" switch to previous buffer
nnoremap <Leader>p :bp<CR>
" close vim
nnoremap <Leader>q :q<CR>
" vertical split buffer
nnoremap <Leader>v :vsp<CR>

" make good tabs
set autoindent
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=4

" fix backspace
set backspace=indent,eol,start

" remove delay for block edits
set timeoutlen=1000 ttimeoutlen=0

" allow vim to have hidden buffers (i.e. unsaved changes in background buffer)
set hidden

" inverse tab bindings
nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>

" Extending to F13
set <F13>=^[[25~

" Toggling normal/insert using Caps Lock
" nnoremap <F13> i
" inoremap <F13> <Esc>l

" Allow wrapping
set wrap
set linebreak
set nolist  " list disables linebreak

" Putting right margin
set cc=80

" Will search for tags until root directory
set tags=tags;/

"path to directory, where library can be found
let g:clang_library_path='/usr/lib/llvm-3.8/lib'
