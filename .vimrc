" Use Vim settings, rather then Vi settings
set nocompatible

" Keep some lines in history
set history=700

" Allow Vim to manage multiple buffers effectively
set hidden

" Don't update the display while executing macros
set lazyredraw

" Enable filetype plugins
filetype on
filetype plugin on
filetype indent on

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set ai
set si

" Show line numbers
set number

" Always show status line
set laststatus=2
" Format status line
set statusline=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]
" Make command line two lines high
set ch=2

" Show current mode
set showmode

" Hide the mouse pointer while typing
set mousehide

" Start scrolling when we're 8 lines away from margins
set scrolloff=8

" Show syntax highlighting
syntax on
set t_Co=256
set background=dark

colorscheme vividchalk

" Enable wildmenu completion
set wildmenu
set wildmode=list:longest

" Enable search highlighting
set hlsearch
" Incrementally match the search
set incsearch
