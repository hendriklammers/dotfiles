-- Set diagnostic symbols
local signs = { Error = "✗ ", Warn = "• ", Hint = "• ", Information = "• " }

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Configure diagnostic display
vim.diagnostic.config({
	virtual_text = {
		-- Only display errors w/ virtual text
		severity = vim.diagnostic.severity.ERROR,
		-- Only show source in floating window
		source = false,
		signs = false,
	},
	float = {
		severity_sort = true,
		-- Prepend with diagnostic source if there is more than one attached to the buffer
		source = "if_many",
	},
})

-- Custom filetypes
vim.filetype.add({
	pattern = {
		[".*%.env.*"] = "sh",
	},
	filename = {
		[".aliases"] = "zsh",
		[".functions"] = "zsh",
	},
})
