vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set clipboard+=unnamedplus")
vim.g.mapleader = " "

vim.opt.swapfile = false

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>", { silent = true })
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>", { silent = true })
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>", { silent = true })
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>", { silent = true })

vim.keymap.set({ "n", "x" }, ";", ":")

vim.keymap.set("n", "<leader>/", "gcc", { desc = "Toggle comment", silent = true, remap = true })
vim.keymap.set("v", "<leader>/", "gc", { desc = "Toggle Comment", silent = true, remap = true })

vim.wo.number = true

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.updatetime = 50
vim.opt.cursorline = true
vim.opt.termguicolors = true

vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

vim.cmd("autocmd Filetype html setlocal tabstop=2 shiftwidth=2 softtabstop=2")
vim.cmd("autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2")
vim.cmd("autocmd Filetype typescript setlocal tabstop=2 shiftwidth=2 softtabstop=2")
vim.cmd("autocmd Filetype svelte setlocal tabstop=2 shiftwidth=2 softtabstop=2")
vim.cmd("autocmd Filetype templ setlocal tabstop=2 shiftwidth=2 softtabstop=2")
