" Use Vim settings, rather then Vi settings
set nocompatible

" Use Vundle to install vim plugins
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Plugins from github
Plugin 'kien/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'mattn/emmet-vim'
Plugin 'othree/html5.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'scrooloose/syntastic'
Plugin 'tomtom/tcomment_vim'
Plugin 'SirVer/ultisnips'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'tpope/vim-fugitive'
" Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'tpope/vim-surround'
" Plugin 'othree/javascript-libraries-syntax.vim'
call vundle#end()
" enable detection, plugins and indenting in one step
filetype plugin indent on

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

" Enable matchit.vim
runtime macros/matchit.vim

" Use dark background
set background=dark

" Use Solarized colorscheme
colorscheme solarized
" More constrast colors in vimdiff
let g:solarized_diffmode = 'high'

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Use fancy symbols in Airline
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" These settings will only be used for vim with gui (Macvim)
if has("gui_running")
    " Set font and size
    " set guifont=Inconsolata:h14
    set guifont=Inconsolata\ for\ Powerline:h14

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

    " set guicursor=a:blinkon0   " turn off cursor blinking
    set guicursor=a:blinkon600-blinkoff400  " Slow down cursor blinking speed

    " Powerline separators for airline don't look too well in terminal
    let g:airline_left_sep = ''
    let g:airline_right_sep = ''
endif

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
set linebreak

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

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Show syntax highlighting
syntax on

" Enable wildmenu completion
set wildmenu
set wildmode=list:longest
" patterns to ignore during file-navigation
set wildignore+=.git,.svn,.sass-cache

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Ignores for ctrlp plugin
let g:ctrlp_custom_ignore = 'node_modules'
" Be able to open hidden files with ctrlp
let g:ctrlp_show_hidden = 1

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

" Make Y consistent with C and D.
nnoremap Y y$

" Map omnicomplete to CTRL+SPACE
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
          \ "\<lt>C-n>" :
          \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
          \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
          \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" Exit Insert mode
imap jj <Esc>

" Map leader to comma key
let mapleader = ","
" Backslash now replaces comma
noremap \ ,

" Clear the last search pattern
" nnoremap <CR> :let @/=""<return>

" ,/ hides last search highlighting
 nnoremap <leader>/ :noh<CR>:<backspace>

" ,w to quickly save the file
nmap <leader>w :w!<CR>

" Keep folds saved when file is closed
" Possibly the first * should be removed to support dot files
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview

" Highlight trailing whitespace
match ErrorMsg '\s\+$'
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Remove trailing whitespace
nnoremap <Leader>rw :%s/\s\+$//e<CR>

" Switch to paste mode before pasting text from outside Vim
set pastetoggle=<F2>

" Better mark jumping (line + col)
" nnoremap ' `

" easier window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Open help in a new tab
cabbrev help tab help

" Add a return with indent, like in Textmate
let delimitMate_expand_cr=1

" Automatically reload vimrc when it changes
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" Edit vimrc in a new tab
nmap <leader>ev :tabedit $MYVIMRC<CR>

" Insert blank line below in normal mode
" nnoremap g<C-o> o<ESC>k
" Insert blank line above in normal mode
" nnoremap gO O<ESC>j

"Shortcut for NERDTreeToggle
nmap <leader>nt :NERDTreeToggle<CR>
let g:NERDTreeShowHidden=1

" Syntastic settings
" Most of this is needed when using Angularjs
let g:syntastic_html_tidy_ignore_errors = [
    \"trimming empty <",
    \"unescaped &",
    \"lacks \"src\" attribute",
    \"lacks \"action",
    \"proprietary attribute",
    \"is not recognized!",
    \"discarding unexpected"
\]

" Expand snippets with TAB
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" Open :UltiSnipsEdit in a vertical split
let g:UltiSnipsEditSplit="vertical"
" Edit UltiSnips snippets
nmap <leader>ue :UltiSnipsEdit<CR>

" Faster shortcut for tComment
map <leader>c <C-_><C-_>

" Not a fan of emmets default <C-y> leader
" let g:user_emmet_leader_key = '<leader>e'

" Don't indent after <html> tag
" i.e. <head> and <body> have same indentation as <html>
let g:html_exclude_tags = ['html']

" Git shortcuts used for Fugitive plugin
nmap <leader>gs :Gstatus<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gg :Gbrowse<CR>
nmap <leader>gb :Gblame<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gw :Gwrite<CR>
nmap <leader>gr :Gread<CR>

let g:used_javascript_libs = 'angularjs,jquery,underscore'

