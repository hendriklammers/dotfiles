require("nvim-tree").setup({
	renderer = {
		icons = {
			show = {
				file = false,
				folder = false,
				folder_arrow = true,
				git = false,
			},
		},
	},
	git = {
		ignore = false,
	},
})
