vim.keymap.set("i", "jk", "<esc>", { desc = "escape insert mode using jk" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "shift selection up the file" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "shift selection up the file" })

-- window management
vim.keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>wh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>we", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>wx", "<cmd>close<CR>", { desc = "Close current split" })

vim.keymap.set("n", "<leader>so", ":so<cr>", { desc = "source file" })
