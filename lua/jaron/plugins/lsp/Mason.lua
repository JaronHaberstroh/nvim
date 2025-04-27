local Mason = {}

require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

require("mason-lspconfig").setup({
	handlers = require("jaron.plugins.lsp.handlers"),
	ensure_installed = {
		"bashls",
		"cssls",
		"eslint",
		"html",
		"jsonls",
		"lua_ls",
		"markdown_oxide",
		"pylsp",
		"rubocop",
		"ruby_lsp",
		"tailwindcss",
		"ts_ls",
	},
})

require("mason-tool-installer").setup({
	ensure_installed = {
		"black", -- python formatter
		"eslint_d",
		"isort", -- python formatter
		"prettier",
		"pylint",
		"stylua",
	},
})

return Mason
