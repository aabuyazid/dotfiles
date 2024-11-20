set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ervandew/supertab'
Plugin 'ap/vim-buftabline'
Plugin 'lepture/vim-velocity'
Plugin 'itchyny/lightline.vim'
Plugin 'rust-lang/rust.vim'
call vundle#end()
filetype plugin indent on

call plug#begin()
Plug 'hkupty/iron.nvim'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'GCBallesteros/vim-textobj-hydrogen'
Plug 'GCBallesteros/jupytext.vim'
Plug 'airblade/vim-rooter'
Plug 'wbthomason/packer.nvim'
call plug#end()

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
nnoremap <Leader>d :bp\|bd #<CR>

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

set noshowmode

"augroup nord-theme-overrides
"  autocmd!
"  " Use 'nord7' as foreground color for Vim comment titles.
"  autocmd ColorScheme nord highlight Comment ctermfg=178 guifg=#dfaf00
"augroup END
"
"colorscheme nord


let g:lightline = {
        \ 'colorscheme': 'catppuccin',
        \ 'active': {
        \       'left': [ [ 'mode', 'paste' ],
        \                 [ 'readonly', 'filename', 'modified' ] ],
        \       'right': [ [ 'lineinfo','filetype' ] ]
        \ },
        \ 'inactive': {
        \       'right': [ [ 'lineinfo','filetype' ] ]
        \ },
        \ }
" fix backspace
set backspace=indent,eol,start

" remove delay for block edits
set timeoutlen=1000 ttimeoutlen=0

" allow vim to have hidden buffers (i.e. unsaved changes in background buffer)
set hidden

" inverse tab bindings
nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>

" mapping esc to toggling normal/insert
nnoremap <Esc> i
inoremap <Esc> <Esc>l

" Jupytext
let g:jupytext_fmt = 'py'
let g:jupytext_style = 'hydrogen'

" Send cell to IronRepl and move to next cell.
" Depends on the text object defined in vim-textobj-hydrogen
" You first need to be connected to IronRepl
nmap ]x ctrih/^# %%<CR><CR>

" Putting right margin
set cc=80
" Setting textwidth 80 for markdown 
au BufRead,BufNewFile *.md setlocal textwidth=80

" Will search for tags until root directory
set tags=tags;/

set clipboard=unnamedplus
