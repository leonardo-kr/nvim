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
local bufferline = require("bufferline")
bufferline.setup({
	options = {
		style_preset = bufferline.style_preset.no_italic,
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				-- text = function()
				--   return vim.fn.getcwd()
				-- end,
				hightlight = "Directory",
				seperator = true,
			},
		},
	},
})
vim.cmd([[colorscheme onedark]])
