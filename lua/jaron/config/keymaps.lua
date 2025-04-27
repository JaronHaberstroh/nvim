local function map(mode, l, r, desc)
	vim.keymap.set(mode, l, r, { desc = desc })
end

map("i", "jk", "<esc>", "escape insert mode using jk")

-- moves selection
map("v", "J", ":m '>+1<CR>gv=gv", "shift selection up the file")
map("v", "K", ":m '<-2<CR>gv=gv", "shift selection up the file")

-- overwrite scroll page default behavior
map("n", "<C-d>", "<C-d>zz", "scrolls down file then centers line on screen")
map("n", "<C-u>", "<C-u>zz", "scrolls up file then centers line on screen")

-- window management
map("n", "<leader>wv", "<C-w>v", "Split window vertically")
map("n", "<leader>wh", "<C-w>s", "Split window horizontally")
map("n", "<leader>we", "<C-w>=", "Make splits equal size")
map("n", "<leader>wx", "<cmd>close<CR>", "Close current split")

map("n", "<leader>so", ":so<cr>", "source current file")
