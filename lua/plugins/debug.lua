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
        end,
    },
}
