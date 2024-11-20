return {
    { "olimorris/onedarkpro.nvim" }, -- color theme
    { "bluz71/nvim-linefly" },       -- status bar
    {
        "alexghergh/nvim-tmux-navigation",
        config = function() -- tmux navigation
            local nvim_tmux_nav = require("nvim-tmux-navigation")

            nvim_tmux_nav.setup({
                disable_when_zoomed = true, -- defaults to false
            })

            vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
            vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
            vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
            vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
            vim.keymap.set("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
            vim.keymap.set("n", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
        end,
    },
    { "hrsh7th/nvim-cmp" },     -- Required
    { "hrsh7th/cmp-nvim-lsp" }, -- Required
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },
    {
        "folke/todo-comments.nvim",
        cmd = { "TodoTrouble", "TodoTelescope" },
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local todo_comments = require("todo-comments")
            todo_comments.setup()
        end,
        keys = {
            { "<leader>xt", "<cmd>TodoTrouble<cr>",                           desc = "Todo (Trouble)" },
            { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>",   desc = "Todo/Fix/Fixme (Trouble)" },
            { "<leader>ft", "<cmd>TodoTelescope<cr>",                         desc = "Todo" },
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
    {
        "seblj/roslyn.nvim",
        ft = "cs",
    }
}
