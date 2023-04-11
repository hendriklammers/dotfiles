require("zen-mode").setup({
	window = {
		backdrop = 1,
		width = 100,
		height = 0.90,
	},
	-- plugins = {
	-- 	tmux = { enabled = true },
	-- },
})

-- Toggle ZenMode
vim.keymap.set("n", "<leader>zm", ":ZenMode<CR>", { noremap = true, silent = true })
