return {
	{ "navarasu/onedark.nvim" }, -- color theme
	{ "bluz71/nvim-linefly" }, -- status bar
	{
		"rcarriga/nvim-dap-ui", -- ui for nvim-dap
		dependencies = {
			"mfussenegger/nvim-dap", -- debug adapter protocl
			"nvim-neotest/nvim-nio", -- async lib
		},
	},
	-- 	{ "elihunter173/dirbuf.nvim" },
	-- { "akinsho/bufferline.nvim" },
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
	-- {
	-- 	"romgrk/barbar.nvim",
	-- 	dependencies = {
	-- 		"lewis6991/gitsigns.nvim",
	-- 	},
	-- 	opts = {},
	-- },
	{
		"folke/todo-comments.nvim",
		cmd = { "TodoTrouble", "TodoTelescope" },
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local todo_comments = require("todo-comments")
			todo_comments.setup()
		end,
		keys = {
			{ "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
			{ "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
			{ "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Todo" },
			{ "<leader>fT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
		},
	},
	{
		"folke/which-key.nvim", -- popup after key press (eg. space)
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 500
		end,
		opts = {},
	},
}
