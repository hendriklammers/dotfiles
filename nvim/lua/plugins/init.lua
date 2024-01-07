return {
	"jose-elias-alvarez/null-ls.nvim", -- Formatters and linters
	-- Git related plugins
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	"nvim-tree/nvim-web-devicons", -- Filetype icons
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
	}, -- Tabline
	{ -- "gc" to comment visual regions/lines
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},
	"JoosepAlviste/nvim-ts-context-commentstring", -- Use correct comment format
	"tpope/vim-unimpaired", -- Bracket mappings
	"tpope/vim-surround", -- Change/delete/add surrounding tags, brackets etc.
	"tpope/vim-repeat", -- Adds . repeat support for several plugins
	"tpope/vim-abolish", -- Easily convert casing of words: snake_case, camelCase, etc.
	{ -- Automatically close {(["' etc.
		"windwp/nvim-autopairs",
		opts = {
			check_ts = true,
		},
	},
	"mbbill/undotree", -- Undo history visualizer
	"freitass/todo.txt-vim", -- Support for todo.txt file
	"AndrewRadev/switch.vim", -- <leader>x to switch predefined texts
	"chrisbra/csv.vim", -- CSV support
	{ -- Distraction-free mode
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
	"github/copilot.vim", -- AI autocompletion
	-- Required by certain plugins
	"nvim-lua/plenary.nvim",
}
