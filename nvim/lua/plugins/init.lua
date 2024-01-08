return {
	-- Formatters and linters
	"jose-elias-alvarez/null-ls.nvim",
	-- Git related plugins
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	-- Filetype icons
	"nvim-tree/nvim-web-devicons",
	-- Tabline
	{
		"alvarosevilla95/luatab.nvim",
		opts = {
			modified = function(bufnr)
				return vim.fn.getbufvar(bufnr, "&modified") == 1 and "+ " or ""
			end,
			windowCount = function()
				return ""
			end,
			devicon = function()
				return ""
			end,
			separator = function()
				return ""
			end,
		},
	},
	-- "gc" to comment visual regions/lines
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},
	-- Use correct comment format
	"JoosepAlviste/nvim-ts-context-commentstring",
	-- Bracket mappings
	"tpope/vim-unimpaired",
	-- Change/delete/add surrounding tags, brackets etc.
	"tpope/vim-surround",
	-- Adds . repeat support for several plugins
	"tpope/vim-repeat",
	-- Easily convert casing of words: snake_case, camelCase, etc.
	"tpope/vim-abolish",
	-- Automatically close {(["' etc.
	{
		"windwp/nvim-autopairs",
		opts = {
			check_ts = true,
		},
	},
	-- Undo history visualizer
	"mbbill/undotree",
	-- Support for todo.txt file
	"freitass/todo.txt-vim",
	-- <leader>x to switch predefined texts
	"AndrewRadev/switch.vim",
	-- CSV support
	"chrisbra/csv.vim",
	-- Distraction-free mode
	{
		"folke/zen-mode.nvim",
		opts = {
			window = {
				backdrop = 1,
				width = 500,
				height = 0.90,
			},
		},
		keys = {
			{ "<leader>zm", "<cmd>ZenMode<cr>", desc = "Toggle ZenMode" },
		},
	},
	-- AI autocompletion
	"github/copilot.vim",
}
