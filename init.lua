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
-- require("onedark").setup({
--     style = "dark",
-- })
require("nvim-tree").setup()

require("lspconfig").zls.setup({})

require("lspconfig").jdtls.setup({})

require("lspconfig").phpactor.setup {}

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

-- require("onedark").load()
vim.cmd("colorscheme onedark_dark")
