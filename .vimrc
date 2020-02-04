" TODO: Organise and cleanup file

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'tomtom/tcomment_vim'
Plug 'altercation/vim-colors-solarized'
Plug 'lifepillar/vim-solarized8'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tommcdo/vim-exchange'
Plug 'editorconfig/editorconfig-vim'
Plug 'chrisbra/csv.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'junegunn/vim-easy-align'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-dispatch'
Plug 'sheerun/vim-polyglot'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'jpalardy/vim-slime'
" Fix for <C-h> in Neovim is needed, see: https://github.com/neovim/neovim/issues/2048
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'freitass/todo.txt-vim'
" Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'terryma/vim-multiple-cursors'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" TODO: Try this plugin for resolving merge conflicts
" https://github.com/christoomey/vim-conflicted

call plug#end()
" Keep 1000 lines in history instead of 20 default
set history=1000

" Turn backup and swapfiles off
set nobackup
set nowritebackup
set noswapfile

" Faster update time recommended by Coc.nvim
set updatetime=500

" Use persistent undo when available
if has('persistent_undo')
  set undodir=~/.vim/undo/
  set undofile
endif

" Yank to clipboard by default
if has('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif

" Reload files changed outside of VIM
set autoread

" Write automatically when calling :make
set autowrite

" The encoding displayed
set encoding=utf-8
scriptencoding utf-8

" The encoding written to file
set fileencoding=utf-8

" Allow Vim to manage multiple buffers effectively.
" i.e. Edit multiple unsaved files at the same time.
set hidden

" Don't update the display while executing macros
set lazyredraw

" No sound
set visualbell

" Scroll Vim instead of tmux history
set mouse=a

" Prevent delay when opening new line with O after pressing ESC
if !has('nvim')
  set noesckeys
endif

" Always use global flag (for substitute command)
set gdefault

" Don't show command on bottom of screen
set noshowcmd

" Enable matchit.vim
runtime macros/matchit.vim

" Matchit sometimes doesn't work with braces, this fixes it..
let b:match_debug = 1

" Use dark background
set background=dark

" Use true colors
if exists('+termguicolors')
  let &t_8f = "[38;2;%lu;%lu;%lum"
  let &t_8b = "[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Use Solarized colorscheme
colorscheme solarized8

" More constrast colors in vimdiff
let g:solarized_diffmode = 'high'

" Toggle Solarized light/dark
call togglebg#map('<F3>')

" Show syntax highlighting
syntax on

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Lightline configuration
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive' ],
      \             [ 'filename' ] ],
      \   'right': [[ 'coc_errors', 'coc_warnings' ],
      \             [ 'lineinfo' ],
      \             [ 'fileencoding', 'filetype' ]]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'fugitive': 'LightlineFugitive'
      \ },
      \ 'component_expand': {
      \   'coc_warnings': 'LightlineCocWarnings',
      \   'coc_errors': 'LightlineCocErrors',
      \ },
      \ 'component_type': {
      \   'coc_warnings': 'warning',
      \   'coc_errors': 'error'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '·' },
      \ 'tabline': {
      \   'right': [ [] ],
      \ },
      \ 'tabline_separator': { 'left': '' },
      \ 'tabline_subseparator': { 'left': '' },
      \ 'tab': {
      \   'active': ['filename', 'modified'],
      \   'inactive': ['filename', 'modified']
      \ },
      \ }

function! LightlineFilename()
  return ('' !=# LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ ('' !=# expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' !=# LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

" Use autocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" Shows if file is readonly
function! LightlineReadonly()
  if &filetype ==# 'help'
    return ''
  elseif &readonly
    return ''
  else
    return ''
  endif
endfunction

" Shows if file is modified
function! LightlineModified()
  if &filetype ==# 'help'
    return ''
  elseif &modified
    return '+'
  elseif &modifiable
    return ''
  else
    return ''
  endif
endfunction

" Shows git branch
function! LightlineFugitive()
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction

" Shows Coc warnings
function! LightlineCocWarnings() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if get(info, 'warning', 0)
    return '•' . info['warning']
  endif
  return ''
endfunction

" Shows Coc errors
function! LightlineCocErrors() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if get(info, 'error', 0)
    return '✗' . info['error']
  endif
  return ''
endfunction

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

" don't add extra space after ., !, etc. when joining
set nojoinspaces

" Make sure vim doesn't break words
set linebreak

" Add ↪ in front of wrapped lines
set showbreak=↪\ 

" Show line numbers
set number
" Show relative line numbers
set relativenumber

" Highlight current line
set cursorline

" Make current line number stand out a bit more
highlight CursorLineNr ctermfg=7 guifg=#eee8d5

" Remove background color from signs column
highlight clear SignColumn

" Always show signcolumn
set signcolumn=yes

" Make tilde in front of nonexisting lines less bright
highlight EndOfBuffer ctermfg=10 guifg=#586e75

" Show comments in italics
highlight Comment cterm=italic

" No background color for special characters like tabs, trail etc.
highlight SpecialKey ctermbg=NONE

" Show whitespace
set list listchars=tab:\ \ ,trail:·

" Disable welcome screen
set shortmess=Ic

" Always show status line
set laststatus=2
" Format status line
set statusline=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n
" Make command line two lines high
set cmdheight=2

" Don't display the current mode in the status line.
set noshowmode

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

" Enable wildmenu completion
set wildmenu
set wildmode=list:longest
" patterns to ignore during file-navigation
set wildignore+=.git,.svn,.sass-cache

" Use rg over grep
if executable('rg')
  set grepprg=rg\ --no-heading\ --vimgrep
  set grepformat=%f:%l:%c:%m
endif

" Enable search highlighting
set hlsearch
" Incrementally match the search
set incsearch
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Live preview of substitute command
if has('nvim')
  set inccommand=nosplit
endif

" Make Y consistent with C and D.
nnoremap Y y$

" Omnicomplete setting
set completeopt=longest,menuone
set omnifunc=csscomplete#CompleteCSS
set omnifunc=htmlcomplete#CompleteTags
set omnifunc=javascriptcomplete#CompleteJS

" Map leader to space
let g:mapleader = "\<Space>"

" Local leader
let g:maplocalleader = ','

" hide last search highlighting
nnoremap <leader>\ :noh<CR>:<backspace>

" Quickly save the file
nnoremap <leader>w :w!<CR>

" Move to end of line in insert mode
inoremap <C-l> <Esc>A

augroup vimrc
  " Set correct filetypes
  autocmd BufNewFile,BufReadPost *.md set filetype=markdown
  autocmd BufRead,BufNewFile *.es6 setfiletype javascript
  autocmd BufRead,BufNewFile *.eslintrc,*.babelrc,*.prettierrc setfiletype json
  autocmd BufRead,BufNewFile *.prompt,*.functions,*.extra,*.aliases setfiletype sh

  " This should fix matchit to jump from <ul> to <li> instead of </ul>
  autocmd FileType html,php let b:match_words='<:>,<\@<=\([^/][^ \t>]*\)[^>]*\%(>\|$\):<\@<=/\1>'

  " Wrap markdown files at 80 columns and enable spellcheck
  autocmd BufRead,BufNewFile *.md setlocal spell textwidth=80

  " Enable spellcheck for .txt files
  autocmd BufRead,BufNewFile *.txt setlocal spell

  " Wrap git commit messages at 72 columns and enable spellcheck
  autocmd Filetype gitcommit setlocal spell textwidth=72

  " Use 4 spaces indenting for Elm
  autocmd FileType elm setlocal tabstop=4 shiftwidth=4 softtabstop=4

  " Haskell settings
  autocmd FileType haskell setlocal tabstop=4 shiftwidth=4 softtabstop=4 formatprg=hindent
augroup END

" Remove trailing whitespace
nnoremap <Leader>rw :%s/\s\+$//e<CR>

" Switch to paste mode before pasting text from outside Vim
set pastetoggle=<F2>

" mapping to make movements operate on 1 screen line in wrap mode
function! ScreenMovement(movement)
   if &wrap
      return 'g' . a:movement
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

" Prevent vim opening man when accidentally
nnoremap <S-k> <nop>

" Edit vimrc in a new tab
nnoremap <leader>ve :tabedit $MYVIMRC<CR>

" Reload vimrc
nnoremap <leader>vr :source $MYVIMRC<CR>

" Shortcut for NERDTreeToggle
nnoremap <leader>nt :NERDTreeToggle<CR>

" Show current file in NERDTree
nnoremap <leader>nf :NERDTreeFind<CR>

" Toggle last buffer
nnoremap <leader><leader> <C-^>

" Show hidden files in NERDTree by default
let g:NERDTreeShowHidden=1

" Don't ask for confirmation to remove buffer
let NERDTreeAutoDeleteBuffer=1

" Removes help text
let g:NERDTreeMinimalUI = 1

" Don't indent after <html> tag
" i.e. <head> and <body> have same indentation as <html>
let g:html_exclude_tags = ['html']

" Git shortcuts used for Fugitive plugin
nnoremap <leader>gs :10Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gg :Gbrowse<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gl :0Glog<CR>
nnoremap <leader>gp :Gpush<CR>

" Open Gdiff in vertical splits
set diffopt+=vertical

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Select last pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" Delete in insert mode
inoremap <C-d> <Del>

" Use arrow keys to resize window
noremap <up> <C-W>+
noremap <down> <C-W>-
noremap <left> 3<C-W><
noremap <right> 3<C-W>>

" Exclude these from editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" Map Switch plugin to leader s
let g:switch_mapping = ''
nnoremap <leader>x :Switch<CR>

" Use jsx syntax also for files without jsx extension
let g:jsx_ext_required = 0

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
  autocmd vimrc WinEnter term://* startinsert
endif

" TODO: Figure out if possible to make definitions case insensitive
" Custom definitions for Switch plugin
let g:switch_custom_definitions =
    \ [
    \   ['none', 'block'],
    \   ['before', 'after'],
    \   ['relative', 'absolute'],
    \   ['top', 'bottom'],
    \   ['left', 'right'],
    \   ['up', 'down'],
    \   ['max', 'min'],
    \   ['width', 'height'],
    \   ['margin', 'padding'],
    \   ['horizontal', 'vertical'],
    \   ['odd', 'even'],
    \   ['dark', 'light'],
    \   ['const', 'let'],
    \   ['add', 'remove'],
    \   ['first', 'last'],
    \   ['TODO', 'FIXME'],
    \   ['cos', 'sin'],
    \   ['input', 'output'],
    \   ['column', 'row'],
    \   ['fff', '000'],
    \   ['ffffff', '000000'],
    \   ['+', '-'],
    \   ['to', 'from'],
    \   ['pause', 'play'],
    \   ['Pause', 'Play'],
    \   ['production', 'development'],
    \   ['>>', '<<']
    \ ]

" Send to code to tmux
let g:slime_target = 'tmux'

" Use right tmux pane
let g:slime_default_config = {'socket_name': 'default', 'target_pane': '{right-of}'}

" Always use defaults
let g:slime_dont_ask_default = 1

" vim-slime mappings
xmap <leader>s <Plug>SlimeRegionSend
nmap <leader>s <Plug>SlimeParagraphSend

" Only show cursor line for active buffer
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

augroup filetypedetect
    au BufRead,BufNewFile *.gohtml setfiletype html
augroup END

command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --hidden '.shellescape(<q-args>), 1,
    \   <bang>0 ? fzf#vim#with_preview('up:60%')
    \           : fzf#vim#with_preview('right:50%:hidden', '?'),
    \   <bang>0)

nnoremap <leader>/ :grep

" FZF mappings
nnoremap <silent> <expr> <leader>o (len(system('git rev-parse')) ? ':Files' : ':GFiles')."\<cr>"
nnoremap <leader>O :Files<CR>
nnoremap <leader>l :Lines<CR>

" Edit general todo list in new tab
nnoremap <leader>tl :tabedit ~/Dropbox/todo/todo.txt<CR>
nnoremap <leader>te :tabedit todo.txt<CR>
nnoremap <leader>ta :!todo.sh add 
nnoremap <leader>td :!todo.sh do 
nnoremap <leader>tx :!todo.sh add Finish all todos in: %:p<CR>

" Coc.nvim

" Installed Coc extensions
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-emmet',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-eslint',
  \ 'coc-snippets',
  \ 'coc-css',
  \ 'coc-diagnostic',
  \ 'coc-stylelint',
  \ 'coc-pairs',
  \ ]

" Make <tab> used for trigger completion, completion confirm, snippet expand 
inoremap <silent><expr> <TAB>
  \ pumvisible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Use <cr> for confirm completion
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Show documentation in preview window
nnoremap <silent> <leader>? :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> <leader>ct <Plug>(coc-type-definition)
" nmap <silent> <leader>cr <Plug>(coc-references)
" nmap <silent> <leader>ci <Plug>(coc-implementation)

" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Change color of warning sign to yellow
highlight CocWarningSign ctermfg=3 guifg=#b58900
highlight CocErrorSign ctermfg=1 guifg=#dc322f

" Run :Prettier to format a file
command! -nargs=0 Prettier :CocCommand prettier.formatFile
