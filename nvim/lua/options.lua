-- Disable netrw, use nvim-tree instead
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Disable welcome screen
vim.opt.shortmess = "Ic"

vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.autoindent = true
vim.opt.copyindent = true

-- Set highlight on search
vim.opt.hlsearch = false
-- Incrementally match the search
vim.opt.incsearch = true
-- Use case insensitive search, except when using capital letters
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Show line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Highlight current line
vim.opt.cursorline = true

-- Enable mouse mode
vim.opt.mouse = "a"

-- Always show status line
vim.opt.laststatus = 2
-- Format status line
vim.opt.statusline = "%f %m %r Line: %l/%L[%p%%] Col: %c Buf: #%n"
-- Make command line two lines high
vim.opt.cmdheight = 2
-- Don't display the current mode in the status line.
vim.opt.showmode = false

-- Don't show command on bottom of screen
vim.opt.showcmd = false

-- Enable break indent
vim.opt.breakindent = true

-- Make sure vim doesn't break words
vim.opt.linebreak = true

--Add ↪ in front of wrapped lines
vim.opt.showbreak = "↪ "

-- Turn backup and swapfiles off
vim.opt.swapfile = false
vim.opt.backup = false
-- Save undo history
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undo"
vim.opt.undofile = true

-- Decrease update time
vim.opt.updatetime = 250
vim.wo.signcolumn = "yes"

-- Enables 24-bit RGB color
vim.opt.termguicolors = true

-- Set completeopt to have a better completion experience
vim.opt.completeopt = "menuone,noselect"

-- Use dark background
vim.opt.background = "dark"

-- Copy to clipboard by default
vim.opt.clipboard = "unnamedplus"

-- Open new split panes to right and bottom, which feels more natural
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Start scrolling when 4 lines away from margins
vim.opt.scrolloff = 4

-- Use ripgrep instead of vimgrep
if vim.fn.executable("rg") == 1 then
	vim.opt.grepprg = "rg --no-heading --vimgrep"
	vim.opt.grepformat = "%f:%l:%c:%m"
end
