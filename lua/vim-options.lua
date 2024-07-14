vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.g.background = "light"

vim.opt.swapfile = false

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>", { silent = true })
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>", { silent = true })
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>", { silent = true })
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>", { silent = true })

vim.keymap.set("n", ";", ":")

vim.wo.number = true

vim.keymap.set("n", "<leader>e", ":NvimTreeOpen<CR>", { desc = "Focus NvimTree", silent = true })
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree", silent = true })

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

-- vim.keymap.set("n", "<s-tab>", "<Cmd>BufferPrevious<CR>", { desc = "Next Buffer", silent = true })
-- vim.keymap.set("n", "<tab>", "<Cmd>BufferNext<CR>", { desc = "Previous Buffer", silent = true })

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = vim.schedule_wrap(function()
		vim.cmd("highlight BufferTabpageFill guibg=#16191D")
		vim.cmd("hi BufferTabpagesSep guifg=#16191D")
		vim.cmd("hi BufferCurrent guifg=#FFFFFF")
		vim.cmd("hi BufferCurrentIndex guifg=#FFFFFF guibg=#1E2228")
		vim.cmd("hi BufferInactiveIndex guifg=#53585F guibg=#16191D")
		vim.cmd("hi BufferCurrentSign guifg=#A0A8B6")
		vim.cmd("hi BufferCurrentSignRight guifg=#A0A8B6")
		vim.cmd("hi BufferInactiveSign guifg=#16191D")
		vim.cmd("hi BufferInactiveSignRight guifg=#16191D")
		vim.cmd("hi BufferInactive guifg=#53585F guibg=#16191D")
		vim.cmd("hi BufferInactive guifg=#53585F guibg=#16191D")
	end),
})
