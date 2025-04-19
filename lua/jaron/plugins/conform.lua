return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
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
			css = { "prettier", "prettierd", stop_after_first = true },
			html = { "prettier", "prettierd", stop_after_first = true },
			javascript = { "prettier", "prettierd", stop_after_first = true },
			javascriptreact = { "prettier", "prettierd", stop_after_first = true },
			json = { "prettier", "prettierd", stop_after_first = true },
			lua = { "stylua" },
			markdown = { "prettier", "prettierd", stop_after_first = true },
			python = { "black", "isort", stop_after_first = true },
			ruby = { "rubocop" },
			typescript = { "prettier", "prettierd", stop_after_first = true },
			typescriptreact = { "prettier", "prettierd", stop_after_first = true },
		},
		format_on_save = {
			async = false,
			lsp_format = "fallback",
			timeout_ms = 1000,
		},
	},
}
