-- Disable Ex mode
vim.keymap.set("n", "Q", "<nop>")

-- Prevent vim opening man when accidentally
vim.keymap.set("n", "<S-k>", "<nop>", { noremap = true, silent = true })

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Move visually selected lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Paste without overwriting clipboard
vim.keymap.set("x", "<leader>p", '"_dP')

-- Search word under cursor
vim.keymap.set("n", "<leader>;", [[:grep '\b<C-r><C-w>\b']])

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

-- Diagnostic mappings
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { noremap = true, silent = true })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { noremap = true, silent = true })

-- Open undo history
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { noremap = true, silent = true })

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

-- vim.keymap.set("i", "<Tab>", function()
-- 	if require("copilot.suggestion").is_visible() then
-- 		require("copilot.suggestion").accept()
-- 	else
-- 		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
-- 	end
-- end, {
-- 	silent = true,
-- })

-- vim.keymap.set("i", "<C-x>", "<Plug>(copilot-dismiss)", { noremap = true, silent = true })
-- vim.keymap.set("i", "<C-]>", "<Plug>(copilot-next)", { noremap = true, silent = true })
-- vim.keymap.set("i", "<C-[>", "<Plug>(copilot-prev)", { noremap = true, silent = true })
