vim.keymap.set({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

vim.cmd [[highlight ColorColumn ctermbg=0 guibg=lightgrey]]
-- Moves lines and relesect in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- up

-- Mode to the middle of the scren
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- down
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- up

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.background = 'dark'

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', '<leader>pv', '<cmd>Ex<CR>', { silent = true })

-- Remap for dealing with word wrap'
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Quit
vim.keymap.set('n', '<leader>qq', '<cmd>qa<cr>', { desc = "Quit all" })
vim.keymap.set("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })

-- vim.keymap.set('n', '<leader><tab><tab>', '<cmd>tabnew<cr>', { desc = "New Tab" })

vim.keymap.set("n", "<leader>w|", "<C-W>v", { desc = "Split window right", remap = true })

vim.keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })

vim.keymap.set("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
vim.keymap.set("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
