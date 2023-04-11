-- Install packer when not installed yet
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	vim.cmd([[packadd packer.nvim]])
end

require("packer").startup(function(use)
	-- Package manager
	use("wbthomason/packer.nvim")

	use({
		"nvim-tree/nvim-tree.lua",
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})

	use({ -- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		requires = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- Useful status updates for LSP
			"j-hui/fidget.nvim",
		},
	})

	use("jose-elias-alvarez/null-ls.nvim") -- Formatters and linters

	use({ -- Autocompletion
		"hrsh7th/nvim-cmp",
		requires = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" },
	})

	use({ -- Highlight, edit, and navigate code
		{
			"nvim-treesitter/nvim-treesitter",
			run = function()
				pcall(require("nvim-treesitter.install").update({ with_sync = true }))
			end,
		},
		{ -- Additional text objects
			"nvim-treesitter/nvim-treesitter-textobjects",
			after = "nvim-treesitter",
		},
		{ -- Autoclose and rename html tags
			"windwp/nvim-ts-autotag",
			after = "nvim-treesitter",
		},
	})

	-- Git related plugins
	use("tpope/vim-fugitive")
	use("tpope/vim-rhubarb")

	use("folke/tokyonight.nvim") -- Color theme
	use("nvim-tree/nvim-web-devicons") -- Filetype icons
	use("nvim-lualine/lualine.nvim") -- Fancier statusline
	use("alvarosevilla95/luatab.nvim") -- Tabline
	use("numToStr/Comment.nvim") -- "gc" to comment visual regions/lines
	use("JoosepAlviste/nvim-ts-context-commentstring") -- Use correct comment format
	use("tpope/vim-unimpaired") -- Bracket mappings
	use("tpope/vim-surround") -- Change/delete/add surrounding tags, brackets etc.
	use("tpope/vim-repeat") -- Adds . repeat support for several plugins
	use("windwp/nvim-autopairs") -- Automatically close {(["' etc.
	use("mbbill/undotree") -- Undo history visualizer
	use("freitass/todo.txt-vim") -- Support for todo.txt file
	use("AndrewRadev/switch.vim") -- <leader>x to switch predefined texts
	use("chrisbra/csv.vim") -- CSV support
	use("folke/zen-mode.nvim") -- Distraction-free mode

	-- Fuzzy Finder (files, lsp, etc)
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x", requires = { "nvim-lua/plenary.nvim" } })

	-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make", cond = vim.fn.executable("make") == 1 })

	use({
		"alexghergh/nvim-tmux-navigation",
		config = function()
			local nvim_tmux_nav = require("nvim-tmux-navigation")

			nvim_tmux_nav.setup({
				disable_when_zoomed = true, -- defaults to false
			})

			vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
			vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
			vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
			vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
			vim.keymap.set("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
			vim.keymap.set("n", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
		end,
	})

	if is_bootstrap then
		require("packer").sync()
	end
end)

-- When bootstrapping, nvim needs to be restarted after installing the plugins
if is_bootstrap then
	print("Installing plugins, restart nvim after Packer completes")
	return
end
