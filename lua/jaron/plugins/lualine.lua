return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		local colors = {
			bg = "#1e2030",
			fg = "#c8d3f5",
			inactive_bg = "#1a1b26",
			blue = "#82aaff",
			cyan = "#7dcfff",
			gray = "#7a88cf",
			green = "#c3e88d",
			orange = "#ff9e64",
			red = "#f7768e",
			violet = "#c099ff",
			yellow = "#ffcb6b",
		}

		local my_lualine_theme = {
			normal = {
				a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			insert = {
				a = { bg = colors.green, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			visual = {
				a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			command = {
				a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			replace = {
				a = { bg = colors.red, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			inactive = {
				a = { bg = colors.inactive_bg, fg = colors.gray, gui = "bold" },
				b = { bg = colors.inactive_bg, fg = colors.gray },
				c = { bg = colors.inactive_bg, fg = colors.gray },
			},
		}

		-- configure lualine with modified theme
		lualine.setup({
			options = {
				theme = my_lualine_theme,
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				icons_enabled = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff" },
				lualine_c = {
					{
						"filename",
						path = 1,
						symbols = {
							modified = " ●",
							readonly = " 🔒",
							unnamed = "[No Name]",
						},
					},
				},
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = colors.orange },
					},
					"encoding",
					"fileformat",
					"filetype",
				},
				lualine_y = {
					{ "diagnostics", sources = { "nvim_diagnostic" } },
				},
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { { "filename", path = 1 } },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = {},
		})
	end,
}
