local remap = require("soyuz.keymap").nnoremap

remap("<leader>pv", "<cmd>Ex<CR>")
remap("<leader><Esc>", "C-\\><C-n>")
remap("<leader>ff", "<cmd>Telescope find_files<cr>")
remap("<leader>gb", "<cmd>Telescope git_branches<cr>")
remap("<leader>gs", "<cmd>Telescope git_status<cr>")
