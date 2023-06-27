-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Setting options ]]
-- See `:help vim.o`
-- Make line numbers default
vim.wo.number = true
vim.wo.signcolumn = 'yes'

local opt = vim.opt

-- Set ruler at 80 characters
opt.ruler = true
opt.colorcolumn = '80'
-- Change color of ruler
-- Break lines at 80 characters
opt.textwidth = 80
-- Format text on save
opt.formatoptions = vim.opt.formatoptions + 'j'
-- Set clipboard to system clipboard
opt.clipboard = 'unnamedplus'

opt.relativenumber = true
-- I don´t want neovim to ask me edit/read... about swapfile backup
opt.swapfile = false
opt.backup = false

-- No highlight after a search
opt.hlsearch = false

-- Cursor will never be at the bottom of the window but 8 lines before
opt.scrolloff = 8

opt.termguicolors = true

opt.cursorline = true

-- Enable mouse mode
opt.mouse = 'a'
-- Set completeopt to have a better completion experience
opt.completeopt = 'menuone,noselect'
-- Enable break indent
opt.breakindent = true
-- Save undo history
opt.undofile = true
-- Case insensitive searching UNLESS /C or capital in search
opt.ignorecase = true
opt.smartcase = true
-- Decrease update time
opt.updatetime = 250
-- Set highlight on search
opt.hlsearch = false
