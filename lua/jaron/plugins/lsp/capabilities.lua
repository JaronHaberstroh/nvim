local M = {}

vim.tbl_deep_extend(
	"force",
	{},
	vim.lsp.protocol.make_client_capabilities(),
	require("lsp-file-operations").default_capabilities(),
	require("cmp_nvim_lsp").default_capabilities()
)

return M
