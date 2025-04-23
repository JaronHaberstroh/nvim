local lspconfig = require("lspconfig")
local capabilities = require("jaron.plugins.lsp.capabilities")

return {
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
