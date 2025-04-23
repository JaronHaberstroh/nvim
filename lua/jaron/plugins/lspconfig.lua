return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp = require("cmp_nvim_lsp")

		local mason = require("mason")
		local mason_lsp = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

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

				vim.keymap.set(
					"n",
					"gd",
					"<cmd>Telescope lsp_definitions<CR>",
					{ desc = "show lsp_definitions in telescope" }
				)

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

		-- Change the Diagnostic symbols in the sign column (gutter)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		local capabilities =
			vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), cmp.default_capabilities())

		local handlers = {
			-- The first entry (without a key) will be the default handler
			-- and will be called for each installed server that doesn't have
			-- a dedicated handler.
			function(server_name) -- default handler (optional)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			-- Next, you can provide targeted overrides for specific servers.
			["lua_ls"] = function()
				lspconfig.lua_ls.setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				})
			end,
		}

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lsp.setup({
			handlers = handlers,
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

		mason_tool_installer.setup({
			ensure_installed = {
				"black", -- python formatter
				"eslint_d",
				"isort", -- python formatter
				"prettier",
				"pylint",
				"stylua",
			},
		})
	end,
}
