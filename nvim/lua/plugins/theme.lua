return {
	"folke/tokyonight.nvim",
	lazy = false,
	config = function()
		require("tokyonight").setup({
			style = "night",
		})
		-- load the colorscheme here
		vim.cmd([[colorscheme tokyonight]])
		vim.cmd([[highlight CursorLineNr ctermfg=7 guifg=#eee8d5]])
	end,
}
