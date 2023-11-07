local keymap = vim.keymap

-- Directory Navigation
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Number Toggle
keymap.set("n", "<leader>n", ":set relativenumber!<CR>", { noremap = true, silent = true })

