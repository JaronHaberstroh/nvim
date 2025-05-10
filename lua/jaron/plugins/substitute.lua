return {
	enabled = false,
	"gbprod/substitute.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("substitute").setup()
		vim.keymap.set("n", "s", require("substitute").operator, { noremap = true, desc = "Substitute with motion" })
		vim.keymap.set("n", "ss", require("substitute").line, { noremap = true, desc = "Substitute line" })
		vim.keymap.set("n", "S", require("substitute").eol, { noremap = true, desc = "Substitute to end of line" })
		vim.keymap.set("x", "s", require("substitute").visual, { noremap = true, desc = "Substitute in visual mode" })
	end,
}
