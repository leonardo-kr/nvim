return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
    },
  },
  {
    "thePrimeagen/vim-be-good",
    cmd = "VimBeGood",
    config = function()
      require("VimBeGood").setup {}
    end,
  },
  { 'nvim-tree/nvim-web-devicons' },
  { 'bluz71/nvim-linefly' },
  { "rcarriga/nvim-dap-ui", 
    dependencies = 
      {
        "mfussenegger/nvim-dap", 
        "nvim-neotest/nvim-nio"
      } 
  },
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config= function()
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
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end,
    opts = {},
  },
}
