-- lazy plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("lazy").setup("plugins")
require("onedark").setup({
	style = "darker",
})
require("nvim-tree").setup()
-- require("barbar").setup({
-- 	icons = {
-- 		seperator = { left = "", right = "" },
-- 		seperator_at_end = false,
-- 		buffer_index = true,
-- 		filetype = {
-- 			custom_colors = false,
-- 			enabled = true,
-- 		},
-- 	},
--
-- 	sidebar_filetypes = {
-- 		NvimTree = true,
-- 	},
-- })
vim.cmd([[colorscheme onedark]])
