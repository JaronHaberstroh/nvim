local options = {
	-- enable number and relative numbers for lines
	number = true, -- turns on line numbers
	relativenumber = true, -- turns on line number relative to the cursor

	-- handle tabs and indentation
	tabstop = 2, -- set tab to (x) spaces
	softtabstop = 2, -- set tab stop when editing
	shiftwidth = 0, -- set autoindent value to (0) to use tabstop value
	expandtab = true, -- expands tabs into spaces
	autoindent = true, -- copy indent from current line when starting a new line
	smartindent = true, -- works with autoindent

	-- search settings
	ignorecase = true, -- ignore case when searching
	smartcase = true, -- if including mixed case in search, assumes you want case-sensetive

	-- backspace
	backspace = "indent,eol,start", -- tell vim to allow backspace to occur over indent, line breaks, and start of insert

	-- split windows
	splitright = true, -- split vertical window to the right
	splitbelow = true, -- split horizontal window to the bottow

	cursorline = true, -- turn on cursor line hl to help find cursor
	termguicolors = true, -- enable 24-bit RGB colors
	background = "dark", -- tell vim the background is dark
	-- colorcolumn = "80", -- helps with aligning text
	signcolumn = "yes", --  tells vim to put signs in the number column
	swapfile = false, -- turn off the swap file
	wrap = false, -- prevent text lines from wrapping
	hlsearch = false, -- turn off highlights when performing search
	scrolloff = 8, -- leaves 8 lines at the top/bottom of screen when scrolling
}

-- clipboard
vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register
vim.opt.shortmess:append("c")

local function apply_vim_options(options_table)
	for option, value in pairs(options_table) do
		if vim and vim.opt[option] ~= nil then
			vim.opt[option] = value
		end
	end
end

apply_vim_options(options)
