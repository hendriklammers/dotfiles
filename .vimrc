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
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'othree/html5.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'scrooloose/syntastic'
Plugin 'tomtom/tcomment_vim'
Plugin 'SirVer/ultisnips'
Plugin 'mattn/emmet-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'tpope/vim-fugitive'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/yajs.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-repeat'
Plugin 'tommcdo/vim-exchange'
Plugin 'rizzatti/dash.vim'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'elzr/vim-json'
Plugin 'digitaltoad/vim-jade'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'suan/vim-instant-markdown'
Plugin 'kchmck/vim-coffee-script'
Plugin 'chrisbra/csv.vim'
Plugin 'StanAngeloff/php.vim'
Plugin 'tikhomirov/vim-glsl'
Plugin 'AndrewRadev/switch.vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'ElmCast/elm-vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ternjs/tern_for_vim'
Plugin 'mxw/vim-jsx'

" TODO: Try these git browsers
" Plugin 'junegunn/gv.vim'
" Plugin 'gregsexton/gitv'

" Fix for <C-h> in Neovim is needed, see: https://github.com/neovim/neovim/issues/2048
Plugin 'christoomey/vim-tmux-navigator'
call vundle#end()
" enable detection, plugins and indenting in one step
filetype plugin indent on

" Keep 1000 lines in history instead of 20 default
set history=1000

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

" Matchit sometimes doesn't work with braces, this fixes it..
let b:match_debug = 1

" Use dark background
set background=dark

" Use Solarized colorscheme
colorscheme solarized
" More constrast colors in vimdiff
let g:solarized_diffmode = 'high'

" Toggle Solarized light/dark
call togglebg#map("<F3>")

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Use fancy symbols in Airline
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" let g:airline_section_z = '%l:%c'
call airline#parts#define_raw('linenr', '%l')
call airline#parts#define_accent('linenr', 'bold')
let g:airline_section_z = airline#section#create(['%3p%% ',
            \ g:airline_symbols.linenr .' ', 'linenr', ':%c '])

" Use Airline's tabline and customize it
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = '|'

" Expand tabs by default
set expandtab
" Insert tabs at start of line according to shiftwidth
set smarttab
" Number of spaces to use for autoindenting
set shiftwidth=2
" use multiple of shiftwidth when indenting with '<' and '>'
set shiftround
" Tab is 2 spaces
set tabstop=2
" Remove tab when hitting <BS>
set softtabstop=2
" Always use autoindent
set autoindent
" Copy previous indentation on autoindent
set copyindent

" Max 80 characters per line
set textwidth=80
" Make sure vim doesn't break words
set linebreak

" Highlight characters past 80 columns
" augroup vimrc_autocmds
"     autocmd BufEnter * highlight OverLength ctermbg=235 ctermfg=245 guibg=black
"     autocmd BufEnter * match OverLength /\%81v.*/
" augroup END

" Show line numbers
set number
" Show relative line numbers
set relativenumber

" Highlight current line
set cursorline

" Always show status line
set laststatus=2
" Format status line
set statusline=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n
" Make command line two lines high
set ch=2

" Show current mode
set showmode

" Start scrolling when 3 lines away from margins
set scrolloff=3

" Fold settings
set foldenable
set foldmethod=indent
set foldlevelstart=10
set foldnestmax=10

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

" Open CtrlP with leader o
let g:ctrlp_map = '<leader>o'

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor\ --column

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --nogroup --hidden
    \ --ignore .svn
    \ --ignore .git
    \ --ignore bower_components
    \ --ignore node_modules
    \ --ignore jspm_packages
    \ --ignore .sass-cache
    \ --ignore img
    \ --ignore images
    \ --ignore fonts
    \ --ignore compiled
    \ -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Ignores for ctrlp plugin
let g:ctrlp_custom_ignore = '\v[\/](node_modules|jspm_packages|target|output|bower_components|dist|compiled)|(\.(swp|hg|git|svn))$'
" Be able to open hidden files with ctrlp
let g:ctrlp_show_hidden = 1
" Start searching from the directory that was opened in vim
let g:ctrlp_working_path_mode = 0

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

" Omnicomplete setting
set completeopt=longest,menuone
set omnifunc=csscomplete#CompleteCSS
set omnifunc=htmlcomplete#CompleteTags
set omnifunc=javascriptcomplete#CompleteJS

" Map leader to space
let mapleader = "\<Space>""

" hide last search highlighting
nnoremap <leader>/ :noh<CR>:<backspace>

" ,w to quickly save the file
nmap <leader>w :w!<CR>

" Move to end of line in insert mode
imap <C-l> <Esc>A

" Quickly choose between 2 or 4 tabs
" TODO: Create toggle function
nmap <leader>t2 :set tabstop=2 shiftwidth=2 softtabstop=2<CR>
nmap <leader>t4 :set tabstop=4 shiftwidth=4 softtabstop=4<CR>

" Toggle between relative and absolute line numbers
nnoremap <silent><leader>l :set relativenumber!<CR>

" Set correct filetypes
autocmd BufNewFile,BufReadPost *.md set filetype=markdown " Override
autocmd BufRead,BufNewFile *.es6 setfiletype javascript
autocmd BufRead,BufNewFile *.jsbeautifyrc setfiletype json
autocmd BufRead,BufNewFile *.eslintrc setfiletype json
autocmd BufRead,BufNewFile *.babelrc setfiletype json

" Remove trailing whitespace
nnoremap <Leader>rw :%s/\s\+$//e<CR>

" Switch to paste mode before pasting text from outside Vim
set pastetoggle=<F2>

" mapping to make movements operate on 1 screen line in wrap mode
function! ScreenMovement(movement)
   if &wrap
      return "g" . a:movement
   else
      return a:movement
   endif
endfunction
onoremap <silent> <expr> j ScreenMovement("j")
onoremap <silent> <expr> k ScreenMovement("k")
onoremap <silent> <expr> 0 ScreenMovement("0")
onoremap <silent> <expr> ^ ScreenMovement("^")
onoremap <silent> <expr> $ ScreenMovement("$")
nnoremap <silent> <expr> j ScreenMovement("j")
nnoremap <silent> <expr> k ScreenMovement("k")
nnoremap <silent> <expr> 0 ScreenMovement("0")
nnoremap <silent> <expr> ^ ScreenMovement("^")
nnoremap <silent> <expr> $ ScreenMovement("$")

" Better mark jumping (line + col)
nnoremap ' `

" Disable Ex mode
nnoremap Q <nop>

" Add a return with indent, like in Textmate
let delimitMate_expand_cr=1

" Automatically reload vimrc when it changes
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc,.nvimrc,_nvimrc,nvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" Edit vimrc in a new tab
nmap <leader>ev :tabedit $MYVIMRC<CR>

" Shortcut for NERDTreeToggle
nmap <leader>nt :NERDTreeToggle<CR>

" Show current file in NERDTree
nmap <leader>nf :NERDTreeFind<CR>

" Toggle last buffer
nmap <leader><leader> <C-^>

" Show hidden files in NERDTree by default
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

" Add errors to location list
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'

" When a .eslintrc file is found lint js with eslint otherwise use jshint
autocmd FileType javascript let b:syntastic_checkers = glob('.eslintrc*', '.;') != '' ? ['eslint'] : ['jshint']

let g:syntastic_php_checkers=['php']
let g:syntastic_css_checkers=[]

" Expand snippets with ctrl + j
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Open :UltiSnipsEdit in a vertical split
let g:UltiSnipsEditSplit="vertical"
" Edit UltiSnips snippets
nmap <leader>ue :UltiSnipsEdit<CR>

" Not a fan of emmets default <C-y> leader
let g:user_emmet_leader_key = '<C-e>'

" let g:user_emmet_expandabbr_key = '<Tab>'
" let g:user_emmet_complete_tag = 1
" imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
" imap <buffer> <Tab> <Esc>:call emmet#moveNextPrev(0)<CR>
" imap <buffer> <S-Tab> <Esc>:call emmet#moveNextPrev(1)<CR>

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
nmap <leader>gl :Glog<CR>
nmap <leader>gp :Gpush<CR>

" Open Gdiff in vertical splits
set diffopt+=vertical

" Select last pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" Disable default jsdoc mapping to <C-l>, use <leader>jd instead
let g:jsdoc_default_mapping= 0
nmap <leader>jd :JsDoc<CR>

" Prompt for jsdoc parameter types & descriptions
let g:jsdoc_allow_input_prompt = 1

" Ensure that editorconfig works well with Fugitive plugin
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" Use :Qargs to populate args with all files from quickfix list
command! -nargs=0 -bar Qargs execute 'args ' . QuickfixFilenames()
function! QuickfixFilenames()
    " Building a hash ensures we get each buffer only once
    let buffer_numbers = {}
    for quickfix_item in getqflist()
        let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
    endfor
    return join(values(buffer_numbers))
endfunction

" Delete in insert mode
inoremap <C-d> <Del>

" Jump to middle of line
map <silent> gm :call cursor(0, virtcol('$')/2)<CR>

" Use arrow keys to resize window
noremap <up> <C-W>+
noremap <down> <C-W>-
noremap <left> 3<C-W><
noremap <right> 3<C-W>>

" Exclude these from editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" Map Switch plugin to leader s
let g:switch_mapping = ""
nmap <leader>s :Switch<CR>

" Search word under cursor in Dash app
nmap <silent> <leader>d <Plug>DashSearch

" This should fix matchit to jump from <ul> to <li> instead of </ul>
autocmd FileType html,php let b:match_words='<:>,<\@<=\([^/][^ \t>]*\)[^>]*\%(>\|$\):<\@<=/\1>'

" Wrap markdown files at 80 columns
au BufRead,BufNewFile *.md setlocal textwidth=80

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Close tab with QQ
nnoremap QQ :QuitTab<cr>
command! QuitTab call s:QuitTab()
function! s:QuitTab()
    try
        tabclose
    catch /E784/ " Can't close last tab
        qall
    endtry
endfunction

" Neovim specific setttings
if has('nvim')
    " Exit terminal mode with leader e
    tnoremap <Leader>e <C-\><C-n>
    tnoremap <esc><esc> <C-\><C-n>

    " move from the neovim terminal window to somewhere else
    tnoremap <C-h> <C-\><C-n><C-w>h
    tnoremap <C-j> <C-\><C-n><C-w>j
    tnoremap <C-k> <C-\><C-n><C-w>k
    tnoremap <C-l> <C-\><C-n><C-w>l

    " Immediately go in insert mode when entering terminal
    autocmd WinEnter term://* startinsert
endif

" Custom css definitions for Switch plugin
autocmd FileType css,scss let b:switch_custom_definitions =
    \ [
    \   ['none', 'block'],
    \   ['before', 'after'],
    \   ['relative', 'absolute'],
    \   ['top', 'bottom'],
    \   ['left', 'right'],
    \   ['width', 'height']
    \ ]
