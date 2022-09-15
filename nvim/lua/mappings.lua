-- Map leader to space
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Disable Ex mode
vim.keymap.set("n", "Q", "<nop>")

-- Prevent vim opening man when accidentally
vim.keymap.set("n", "<S-k>", "<nop>", { noremap = true, silent = true })

-- Open nvim-tree
vim.keymap.set("n", "<leader>nt", ":NvimTreeToggle<CR>")
-- Show current file in nvim-tree
vim.keymap.set("n", "<leader>nf", ":NvimTreeFindFile<CR>")

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Move to end of line in insert mode
vim.keymap.set("i", "<C-l>", "<Esc>A", { noremap = true, silent = true })
-- Delete in insert mode
vim.keymap.set("i", "<C-d>", "<Del>", { noremap = true, silent = true })

-- Write/save file
vim.keymap.set("n", "<leader>w", ":w!<CR>", { noremap = true, silent = true })

-- Close tab
vim.keymap.set("n", "QQ", ":tabclose<CR>", { noremap = true, silent = true })

-- Toggle last buffer
vim.keymap.set("n", "<leader><leader>", "<C-^>", { noremap = true, silent = true })

-- Use arrow keys to resize window
vim.keymap.set("n", "<up>", "<C-W>+", { noremap = true })
vim.keymap.set("n", "<down>", "<C-W>-", { noremap = true })
vim.keymap.set("n", "<left>", "3<C-W><", { noremap = true })
vim.keymap.set("n", "<right>", "3<C-W>>", { noremap = true })

-- Git shortcuts used for Fugitive plugin
vim.keymap.set("n", "<leader>gs", ":Git<CR><C-w>10-", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gg", ":GBrowse<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gd", ":Gvdiffsplit!<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gw", ":Gwrite<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gr", ":Gread<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gl", ":0Gclog<CR>", { noremap = true, silent = true })

-- Quickly open todo list
vim.keymap.set("n", "<leader>tl", ":tabedit ~/Dropbox/todo/todo.txt<CR>", { noremap = true })
vim.keymap.set("n", "<leader>te", ":tabedit todo.txt<CR>", { noremap = true })
vim.keymap.set("n", "<leader>ta", ":!todo.sh add", { noremap = true })
vim.keymap.set("n", "<leader>td", ":!todo.sh do", { noremap = true })
vim.keymap.set("n", "<leader>tx", ":!todo.sh add Finish all todos in: %:p<CR>", { noremap = true })

-- Select last pasted text
-- TODO: Update to use vim.keymap.set
vim.cmd([[nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]']])

vim.g.switch_mapping = "" -- Remove default Switch mapping
vim.keymap.set("n", "<leader>x", ":Switch<CR>", { noremap = true })

-- Custom definitions for Switch plugin
vim.g.switch_custom_definitions = {
	{ "none", "block" },
	{ "before", "after" },
	{ "relative", "absolute" },
	{ "top", "bottom" },
	{ "left", "right" },
	{ "up", "down" },
	{ "max", "min" },
	{ "width", "height" },
	{ "margin", "padding" },
	{ "horizontal", "vertical" },
	{ "odd", "even" },
	{ "dark", "light" },
	{ "const", "let" },
	{ "add", "remove" },
	{ "first", "last" },
	{ "TODO", "FIXME" },
	{ "cos", "sin" },
	{ "input", "output" },
	{ "column", "row" },
	{ "fff", "000" },
	{ "ffffff", "000000" },
	{ "+", "-" },
	{ "to", "from" },
	{ "pause", "play" },
	{ "Pause", "Play" },
	{ "production", "development" },
	{ "enabled", "disabled" },
	{ ">>", "<<" },
}
