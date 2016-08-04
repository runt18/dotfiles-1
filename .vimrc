" Disable Vi compatibility
set nocompatible
" Enable line numbers
set number
" Two-space tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
" Convert tabs to spaces
set expandtab
" Enable paste mode
set paste

set history=1000
set undolevels=1000

set visualbell
set noerrorbells

set autoindent

" Allow opening buffers without saving current
set hidden

" Disable arrow keys to learn hjkl
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Better searching
set ignorecase
set smartcase
set hlsearch
set incsearch

" Modern backspace
set backspace=indent,eol,start

" Colour scheme options
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1
set t_Co=256
filetype off

" Highlight lines longer than 80 characters
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" Vundle configuration
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim'}
Bundle 'scrooloose/nerdtree'
Bundle 'kchmck/vim-coffee-script'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'mattn/emmet-vim'
Plugin 'elzr/vim-json'

call vundle#end()

" To ignore plugin indent changes, instead use:
"filetype plugin on

" Powerline setup
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

" Key mappings
map <F2> :NERDTreeToggle<CR>
" Enable syntax highlighting
syntax enable
" No idea why this is here
filetype plugin indent on
" Don't fold Markdown code blocks
let g:vim_markdown_folding_disabled=1
