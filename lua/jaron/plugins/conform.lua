return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	lazy = true,
	keys = {
		{
			"<leader>mp",
			function()
				require("conform").format({ async = false, lsp_format = "fallback", timeout_ms = 1000 })
			end,
			desc = "Trigger format for file",
		},
	},
	opts = {
		formatters_by_ft = {
			css = { "prettierd", "prettier", stop_after_first = true },
			html = { "prettierd", "prettier", stop_after_first = true },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			javascriptreact = { "prettierd", "prettier", stop_after_first = true },
			json = { "prettierd", "prettier", stop_after_first = true },
			lua = { "stylua" },
			markdown = { "prettierd", "prettier", stop_after_first = true },
			python = { "isort", "black" },
			ruby = { "rubocop" },
			typescript = { "prettierd", "prettier", stop_after_first = true },
			typescriptreact = { "prettierd", "prettier", stop_after_first = true },
		},

		-- format_on_save = {
		-- 	async = false,
		-- 	lsp_format = "fallback",
		-- 	timeout_ms = 1000,
		-- },
	},
}
