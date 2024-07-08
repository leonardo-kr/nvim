return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {desc = "Find files"})
      vim.keymap.set("n", "<leader>fw", builtin.live_grep, {desc = "Find words"})
      vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {desc = "Find Old files"})
      vim.keymap.set("n", "<leader>gf", builtin.git_files, {desc = "Find git files"})

    end,
}
