vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function()
		vim.keymap.set("n", "<leader>d", function()
			vim.diagnostic.open_float()
		end, { desc = "show diagnostics for line" })

		vim.keymap.set(
			"n",
			"<leader>D",
			"<cmd>Telescope diagnostics bufnr=0<CR>",
			{ desc = "show diagnostics for file" }
		)

		vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", { desc = "show definition/references" })

		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "go to declaration" })

		vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "show lsp_definitions in telescope" })

		vim.keymap.set(
			"n",
			"gi",
			"<cmd>Telescope lsp_implementations<CR>",
			{ desc = "show lsp_implementations in telescope" }
		)

		vim.keymap.set(
			"n",
			"gt",
			"<cmd>Telescope lsp_type_definitions<CR>",
			{ desc = "show lsp_type_definitions in telescope" }
		)

		vim.keymap.set(
			{ "n", "v" },
			"<leader>ca",
			vim.lsp.buf.code_action,
			{ desc = "see available code actions for buf or selection" }
		)

		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "use vim smart rename function" })

		vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "restart lsp" })
	end,
})
