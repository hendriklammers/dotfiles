return {
	"jackMort/ChatGPT.nvim",
	event = "VeryLazy",
	config = function()
		require("chatgpt").setup()
	end,
	keys = {
		{ "<leader>cc", "<cmd>ChatGPT<cr>", desc = "ChatGPT", mode = { "n", "v" } },
		{
			"<leader>ce",
			"<cmd>ChatGPTEditWithInstruction<cr>",
			desc = "Edit with instruction",
			mode = { "n", "v" },
		},
		{
			"<leader>cg",
			"<cmd>ChatGPTRun grammar_correction<cr>",
			desc = "Grammar Correction",
			mode = { "n", "v" },
		},
		{ "<leader>ct", "<cmd>ChatGPTRun translate<cr>", desc = "Translate", mode = { "n", "v" } },
		{ "<leader>ck", "<cmd>ChatGPTRun keywords<cr>", desc = "Keywords", mode = { "n", "v" } },
		{ "<leader>cd", "<cmd>ChatGPTRun docstring<cr>", desc = "Docstring", mode = { "n", "v" } },
		{ "<leader>ct", "<cmd>ChatGPTRun add_tests<cr>", desc = "Add Tests", mode = { "n", "v" } },
		{ "<leader>co", "<cmd>ChatGPTRun optimize_code<cr>", desc = "Optimize Code", mode = { "n", "v" } },
		{ "<leader>cs", "<cmd>ChatGPTRun summarize<cr>", desc = "Summarize", mode = { "n", "v" } },
		{ "<leader>cf", "<cmd>ChatGPTRun fix_bugs<cr>", desc = "Fix Bugs", mode = { "n", "v" } },
		{ "<leader>cx", "<cmd>ChatGPTRun explain_code<cr>", desc = "Explain Code", mode = { "n", "v" } },
		{
			"<leader>cl",
			"<cmd>ChatGPTRun code_readability_analysis<cr>",
			desc = "Code Readability Analysis",
			mode = { "n", "v" },
		},
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"folke/trouble.nvim",
		"nvim-telescope/telescope.nvim",
	},
}
