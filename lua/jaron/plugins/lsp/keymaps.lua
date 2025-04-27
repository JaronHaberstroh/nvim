local keymap = {}

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local function map(mode, l, r, desc)
			vim.keymap.set(mode, l, r, { buffer = ev.buf, silent = true, desc = desc })
		end

		map("n", "<leader>d", function()
			vim.diagnostic.open_float()
		end, "show diagnostics for line")

		map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", "show diagnostics for file")

		map("n", "gR", "<cmd>Telescope lsp_references<CR>", "show references in telescope")

		map("n", "gD", vim.lsp.buf.declaration, "go to declaration")

		map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", "show lsp_definitions in telescope")

		map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", "show lsp_implementations in telescope")

		map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", "show lsp_type_def in telescope")

		map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "see available code actions for buffer of selection")

		map("n", "<leader>rn", vim.lsp.buf.rename, "use vim smart rename function")

		map("n", "<leader>rs", ":LspRestart<CR>", "restart lsp")
	end,
})

return keymap
