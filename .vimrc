" Use Vim settings, rather then Vi settings
set nocompatible

" Keep 100 lines in history
set history=100

" Turn backup and swapfiles off, since most stuff is in git anyway...
set nobackup
set nowb
set noswapfile

" Yank to clipboard by default
if has('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif

" Reload files changed outside of VIM
set autoread

" Allow Vim to manage multiple buffers effectively.
" i.e. Edit multiple unsaved files at the same time.
set hidden

" Don't update the display while executing macros
set lazyredraw

" No sound
set visualbell

" Use pathogen to easily modify the runtime path to include all plugins under
" the ~/.vim/bundle directory
filetype off
call pathogen#infect()
call pathogen#helptags()
" enable detection, plugins and indenting in one step
filetype plugin indent on

" In GVIM
if has("gui_running")
    " Set font and size
    set guifont=Inconsolata:h13

    " Hide MacVim toolbar
    set guioptions-=T

    " Hide scrollbars
    set guioptions-=L
    set guioptions-=r
    set guioptions-=b

    " Set window size
    set lines=999
    set columns=999

    " Fill whole screen when in Fullscreen mode
    set fuoptions=maxvert,maxhorz

    " Use dark background
    set background=dark
    " colorscheme
    colorscheme codeschool
    " colorscheme molokai
    " let g:molokai_original = 1 " Use original Monokai background
    " colorscheme badwolf
    " colorscheme jellybeans
    " colorscheme Tomorrow-Night

    " set guicursor=a:blinkon0   " turn off cursor blinking
    set guicursor=a:blinkon600-blinkoff400  " Slow down cursor blinking speed
else
    " Use dark background
    set background=dark
    " 256 Colors
    set t_Co=256
    " TODO: Find better colorscheme
    " colorscheme molokai
    colorscheme distinguished
endif

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

" TODO: Wrap settings
" Max 80 characters per line
" set textwidth=80
" Make sure vim doesn't break words
" set linebreak

" Highlight characters past 80 columns
" augroup vimrc_autocmds
"     autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
"     autocmd BufEnter * match OverLength /\%80v.*/
" augroup END

" Show line numbers
set number
" Always show status line
set laststatus=2
" Format status line
set statusline=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n
" Make command line two lines high
set ch=2

" Show current mode
set showmode

" Start scrolling when 4 lines away from margins
set scrolloff=4

" Show syntax highlighting
syntax on

" Enable wildmenu completion
set wildmenu
set wildmode=list:longest
" TODO: Add files to ignore

" Enable search highlighting
set hlsearch
" Incrementally match the search
set incsearch
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Always use 'very magic' when searching with regex
" noremap / /\v
" noremap ? ?\v

" Only use custom snipmate snippets
" let g:snippets_dir="~/.vim/snippets"

" Make Y consistent with C and D.
" nnoremap Y y$

" Map omnicomplete to CTRL+SPACE
" inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
"           \ "\<lt>C-n>" :
"           \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
"           \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
"           \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
" imap <C-@> <C-Space>

" Exit Insert mode
" imap jj <Esc>

" Map leader to comma key
let mapleader = ","
" Backslash now replaces comma
noremap \ ,

" Clear the last search pattern
" nnoremap <CR> :let @/=""<return>

" ,/ hides last search highlighting
" nnoremap <leader>/ :noh<CR>:<backspace>

" ,w to quickly save the file
" nmap <leader>w :w!<CR>

" Keep folds saved when file is closed
" Possibly the first * should be removed to support dot files
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview

" Make snipmate snippets available in multiple file formats
" au BufRead,BufNewFile *.php set ft=php.html
" au BufRead,BufNewFile *.less set ft=less.css
" au BufRead,BufNewFile *.scss set ft=scss.css

" Highlight trailing whitespace
" match ErrorMsg '\s\+$'
" highlight ExtraWhitespace ctermbg=red guibg=red
" match ExtraWhitespace /\s\+$/
" autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
" autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
" autocmd InsertLeave * match ExtraWhitespace /\s\+$/
" autocmd BufWinLeave * call clearmatches()

" Remove trailing whitespace
" nnoremap <Leader>rw :%s/\s\+$//e<CR>

" Zencoding settings for scss and less
" let g:user_zen_settings = {
" \  'scss' : {
" \    'filters' : 'fc',
" \  }
" \}

" Switch to paste mode before pasting text from outside Vim
" set pastetoggle=<F2>

" Better mark jumping (line + col)
" nnoremap ' `

" easier window navigation
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

" Add a return with indent, like in Textmate
" let delimitMate_expand_cr=1

" Automatically reload vimrc when it changes
" augroup myvimrc
"     au!
"     au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
" augroup END

" Edit vimrc in a new tab
" nmap <leader>ev :tabedit $MYVIMRC<CR>

" Insert blank line below in normal mode
" nnoremap g<C-o> o<ESC>k
" Insert blank line above in normal mode
" nnoremap gO O<ESC>j

"Shortcut for NERDTreeToggle
" nmap <leader>nt :NERDTreeToggle<CR>

"Show hidden files in NerdTree
" let NERDTreeShowHidden=1
