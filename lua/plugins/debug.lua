return {
    {
        "rcarriga/nvim-dap-ui",      -- ui for nvim-dap
        dependencies = {
            "mfussenegger/nvim-dap", -- debug adapter protocol
            "nvim-neotest/nvim-nio", -- async lib
            'leoluz/nvim-dap-go'     -- go debugger
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            local dapgo = require("dap-go")

            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end

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
            dapui.setup({})

            dapgo.setup {
                -- Additional dap configurations can be added.
                -- dap_configurations accepts a list of tables where each entry
                -- represents a dap configuration. For more details do:
                -- :help dap-configuration
                dap_configurations = {
                    {
                        -- Must be "go" or it will be ignored by the plugin
                        type = "go",
                        name = "Attach remote",
                        mode = "remote",
                        request = "attach",
                    },
                },
                -- delve configurations
                delve = {
                    -- the path to the executable dlv which will be used for debugging.
                    -- by default, this is the "dlv" executable on your PATH.
                    path = "dlv",
                    -- time to wait for delve to initialize the debug session.
                    -- default to 20 seconds
                    initialize_timeout_sec = 20,
                    -- a string that defines the port to start delve debugger.
                    -- default to string "${port}" which instructs nvim-dap
                    -- to start the process in a random available port.
                    -- if you set a port in your debug configuration, its value will be
                    -- assigned dynamically.
                    port = "${port}",
                    -- additional args to pass to dlv
                    args = {},
                    -- the build flags that are passed to delve.
                    -- defaults to empty string, but can be used to provide flags
                    -- such as "-tags=unit" to make sure the test suite is
                    -- compiled during debugging, for example.
                    -- passing build flags using args is ineffective, as those are
                    -- ignored by delve in dap mode.
                    -- avaliable ui interactive function to prompt for arguments get_arguments
                    build_flags = {},
                    -- whether the dlv process to be created detached or not. there is
                    -- an issue on Windows where this needs to be set to false
                    -- otherwise the dlv server creation will fail.
                    -- avaliable ui interactive function to prompt for build flags: get_build_flags
                    detached = vim.fn.has("win32") == 0,
                    -- the current working directory to run dlv from, if other than
                    -- the current working directory.
                    cwd = nil,
                },
                -- options related to running closest test
                tests = {
                    -- enables verbosity when running the test.
                    verbose = false,
                },
            }

            vim.keymap.set("n", "<leader>bb", function() require("dap").toggle_breakpoint() end,
                { desc = "Toggle Breakpoint", silent = true })
            vim.keymap.set("n", "<F5>", function() require("dap").continue() end,
                { desc = "Continue", silent = true })
            vim.keymap.set("n", "<leader>be", ":DapEval<CR>", { desc = "Eval", silent = true })
            vim.keymap.set("n", "<leader>bn", ":DapNew<CR>", { desc = "New", silent = true })
            vim.keymap.set("n", "<F11>", ":DapStepInto<CR>", { desc = "Step Into", silent = true })
            vim.keymap.set("n", "<F12>", ":DapStepOut<CR>", { desc = "Step Out", silent = true })
            vim.keymap.set("n", "<F10>", ":DapStepOver<CR>", { desc = "Step Over", silent = true })
            vim.keymap.set("n", "<leader>bt", ":DapTerminate<CR>", { desc = "Terminate", silent = true })
            vim.keymap.set("n", "<leader>br", ":DapToggleRepl<CR>", { desc = "Toggle Repl", silent = true })
            vim.keymap.set("n", "<leader>bu", function() dapui.open() end, { desc = "Open Dap UI", silent = true })
            vim.keymap.set("n", "<leader>bU", function() dapui.close() end, { desc = "Close Dap UI", silent = true })
        end,

    },
}
