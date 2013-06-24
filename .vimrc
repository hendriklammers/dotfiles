" Use Vim settings, rather then Vi settings
set nocompatible

" Keep some lines in history
set history=100

" Turn backup and swapfiles off, since most stuff is in git anyway...
set nobackup
set nowb
set noswapfile

" Allow Vim to manage multiple buffers effectively
set hidden

" Don't update the display while executing macros
set lazyredraw

" Use pathogen to easily modify the runtime path to include all plugins under
" the ~/.vim/bundle directory
filetype off 
call pathogen#infect()
call pathogen#helptags()
" enable detection, plugins and indenting in one step
filetype plugin indent on       

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Expand tabs by default
set expandtab
" Insert tabs at start of line according to shiftwidth
set smarttab
" Number of spaces to use for autoindenting
set shiftwidth=4
" use multiple of shiftwidth when indenting with '<' and '>'
set shiftround
" Tab is 4 spaces
set tabstop=4
" Remove tab when hitting <BS>
set softtabstop=4
" Always use autoindent
set autoindent
" Copy previous indentation on autoindent
set copyindent

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

" Use dark background
set background=dark

" 256 Colors
set t_Co=256
" Use vim version of Monokai Textmate color scheme
colorscheme molokai
 
" Enable wildmenu completion
set wildmenu
set wildmode=list:longest

" Enable search highlighting
set hlsearch
" Incrementally match the search
set incsearch

" Only use custom snipmate snippets
let g:snippets_dir="~/.vim/snippets"
