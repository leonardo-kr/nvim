return {
    {
        "rcarriga/nvim-dap-ui",      -- ui for nvim-dap
        dependencies = {
            "mfussenegger/nvim-dap", -- debug adapter protocol
            "nvim-neotest/nvim-nio", -- async lib
        },
        config = function()
            local dap = require("dap")

            dap.adapters.coreclr = {
                type = 'executable',
                command = '/usr/bin/netcoredbg',
                args = { '--interpreter=vscode' }
            }

            dap.configurations.cs = {
                {
                    type = "coreclr",
                    name = "launch - netcoredbg",
                    request = "launch",
                    program = function()
                        return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
                    end,
                },
            }

            vim.keymap.set("n", "<leader>bb", ":DapToggleBreakpoint<CR>", { desc = "Toggle Breakpoint", silent = true })
            vim.keymap.set("n", "<leader>bc", ":DapContinue<CR>", { desc = "Continue", silent = true })
            vim.keymap.set("n", "<leader>be", ":DapEval<CR>", { desc = "Eval", silent = true })
            vim.keymap.set("n", "<leader>bn", ":DapNew<CR>", { desc = "New", silent = true })
            vim.keymap.set("n", "<leader>bs", ":DapStepInto<CR>", { desc = "Step Into", silent = true })
            vim.keymap.set("n", "<leader>bo", ":DapStepOut<CR>", { desc = "Step Out", silent = true })
            vim.keymap.set("n", "<leader>bO", ":DapStepOver<CR>", { desc = "Step Over", silent = true })
            vim.keymap.set("n", "<leader>bt", ":DapTerminate<CR>", { desc = "Terminate", silent = true })
            vim.keymap.set("n", "<leader>br", ":DapToggleRepl<CR>", { desc = "Toggle Repl", silent = true })
        end,

    },
}
