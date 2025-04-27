return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	keys = {
		{
			"<leader>.",
			function()
				Snacks.scratch()
			end,
			desc = "Toggle Scratch Buffer",
		},
		{
			"<leader>S",
			function()
				Snacks.scratch.select()
			end,
			desc = "Select Scratch Buffer",
		},
		{
			"<leader>lg",
			function()
				Snacks.lazygit()
			end,
			desc = "open lazygit",
		},
	},
	---@type snacks.Config
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		animate = { enabled = false },
		bigfile = { enabled = true },
		dashboard = { enabled = true },
		dim = { enabled = false },
		explorer = { enabled = false },
		gitbrowse = { enabled = false },
		image = { enabled = true },
		indent = { enabled = true },
		input = { enabled = true },
		layout = { enabled = false },
		lazygit = { enabled = true },
		notifier = { enabled = true },
		picker = { enabled = false },
		profilier = { enabled = false },
		quickfile = { enabled = true },
		rename = {
			enabled = true,
			vim.api.nvim_create_autocmd("User", {
				pattern = "OilActionsPost",
				callback = function(event)
					if event.data.actions.type == "move" then
						Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
					end
				end,
			}),
		},
		scope = { enabled = true },
		scratch = { enabled = false },
		scroll = { enabled = false },
		statuscolumn = { enabled = true },
		terminal = { enabled = false },
		toggle = { enabled = false },
		win = { enabled = true },
		words = { enabled = true },
		zen = require("jaron.plugins.snacks.zen").opts,
	},
}
