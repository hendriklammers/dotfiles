-- console.log word under cursor
vim.api.nvim_create_augroup("ConsoleLog", { clear = true })
vim.api.nvim_create_autocmd({ "FileType" }, {
	group = "ConsoleLog",
	pattern = "javascript,jsx,javascriptreact,typescript,typescriptreact,svelte",
	callback = function()
		vim.keymap.set(
			"n",
			"<localleader>l",
			"yiwoconsole.log('<c-r>\"', <c-r>\")<esc>",
			{ noremap = true, silent = true }
		)
		vim.keymap.set(
			"v",
			"<localleader>l",
			"yoconsole.log('<c-r>\"', <c-r>\")<esc>",
			{ noremap = true, silent = true }
		)
	end,
})

-- Only show cursor line for active buffer
vim.api.nvim_create_augroup("CursorLine", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter", "WinEnter", "BufWinEnter" }, {
	group = "CursorLine",
	pattern = "*",
	callback = function()
		vim.opt_local.cursorline = true
	end,
})
vim.api.nvim_create_autocmd({ "WinLeave" }, {
	group = "CursorLine",
	pattern = "*",
	callback = function()
		vim.opt_local.cursorline = false
	end,
})

-- highlight yanked text
vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	group = "YankHighlight",
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = "300" })
	end,
})
