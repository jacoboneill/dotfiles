local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Directory Navigation
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Number Toggle
keymap.set("n", "<leader>n", ":set relativenumber!<CR>", opts)

-- Pane Navigation
keymap.set("n", "<C-h>", "C-w>h", opts) -- Navigate Left
keymap.set("n", "<C-j>", "C-w>j", opts) -- Navigate Down
keymap.set("n", "<C-k>", "C-w>k", opts) -- Navigate Up
keymap.set("n", "<C-l>", "C-w>l", opts) -- Navigate Right 

-- Window Management
keymap.set("n", "<leader>sv", ":vsplit<CR>", opts) -- Split Vertically
keymap.set("n", "<leader>sh", ":hsplit<CR>", opts) -- Split Horizontally 