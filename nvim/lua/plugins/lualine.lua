return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			icons_enabled = true,
			theme = "tokyonight",
			component_separators = "|",
			section_separators = "",
			disabled_filetypes = { "packer", "NvimTree", "undotree", "diff" },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = {
				{ "branch", icon = "" },
				"diff",
				{
					"diagnostics",
					sources = { "nvim_diagnostic" },
					symbols = { error = "✗ ", warn = " ", info = " ", hint = " " },
				},
			},
			lualine_c = { "filename" },
			lualine_x = {
				{
					"filetype",
					colored = false,
				},
			},
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
		tabline = {},
	},
}
