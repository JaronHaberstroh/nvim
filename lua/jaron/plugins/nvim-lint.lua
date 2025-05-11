return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	lazy = true,
	keys = {
		{
			"<leader>ml",
			function()
				require("lint").try_lint(nil, { ignore_errors = true })
			end,
			desc = "Trigger linting for the current file",
		},
	},
	config = function()
		require("lint").linters_by_ft = {
			javascript = { "eslint" },
			javascriptreact = { "eslint" },
			lua = { "luacheck" },
			python = { "pylint" },
			ruby = { "rubocop" },
			typescript = { "eslint" },
			typescriptreact = { "eslint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				-- try_lint without arguments runs the linters defined in `linters_by_ft`
				-- for the current filetype
				require("lint").try_lint(nil, { ignore_errors = true })

				-- You can call `try_lint` with a linter name or a list of names to always
				-- run specific linters, independent of the `linters_by_ft` configuration
				-- require("lint").try_lint("cspell")
			end,
		})
	end,
}
