-- Use tokyonight color theme
require("tokyonight").setup({
	style = "night",
	sidebars = { "packer" },
})

vim.cmd.colorscheme("tokyonight")
vim.cmd([[highlight CursorLineNr ctermfg=7 guifg=#eee8d5]])
