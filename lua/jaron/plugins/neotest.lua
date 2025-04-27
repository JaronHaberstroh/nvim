return {
	"nvim-neotest/neotest",
	event = "VeryLazy",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"marilari88/neotest-vitest",
	},
	keys = {
		{
			"<leader>twp",
			"<cmd>lua require('neotest').run.run({ vitestCommand = 'vitest --watch' })<cr>",
			desc = "Run Watch",
		},

		{
			"<leader>twf",
			"<cmd>lua require('neotest').run.run({ vim.fn.expand('%'), vitestCommand = 'vitest --watch' })<cr>",
			desc = "Run Watch File",
		},
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-vitest")({}),
			},
		})
	end,
}
