return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		-- Configuration for the floating window in oil.open_float
		win_options = { signcolumn = "yes:2" },
		float = {
			-- Padding around the floating window
			padding = 2,
			-- max_width and max_height can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
			max_width = 0.6,
			max_height = 0.6,
			border = "rounded",
			win_options = {
				winblend = 0,
			},
			-- preview_split: Split direction: "auto", "left", "right", "above", "below".
			preview_split = "right",
		},
		-- Configuration for the file preview window
		preview_win = {
			-- Whether the preview window is automatically updated when the cursor is moved
			update_on_cursor_moved = true,
			-- How to open the preview window "load"|"scratch"|"fast_scratch"
			preview_method = "fast_scratch",
			-- A function that returns true to disable preview on a file e.g. to avoid lag
			disable_preview = function()
				return false
			end,
			-- Window-local options to use for preview window buffers
			win_options = { signcolumn = "yes:2" },
		},
	},
	-- Optional dependencies
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	lazy = false,
	keys = {
		{ "-", "<cmd>Oil --float<cr>", desc = "Open Oil file manager" },
	},
}
