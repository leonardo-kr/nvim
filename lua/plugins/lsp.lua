return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local config = require("nvim-treesitter.configs")
            config.setup({
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        dependencies = {
            { "neovim/nvim-lspconfig" }, -- Required
            {
                "williamboman/mason.nvim",
                config = function()
                    local config = require("mason")
                    config.setup({
                        registries = {
                            'github:mason-org/mason-registry',
                            'github:crashdummyy/mason-registry',
                        },
                    })
                end,
                build = function()
                    pcall(vim.cmd, "MasonUpdate")
                end,
            },
            { "williamboman/mason-lspconfig.nvim" }, -- Optional
            {
                "L3MON4D3/LuaSnip",
                dependencies = {
                    "saadparwaiz1/cmp_luasnip",
                    "rafamadriz/friendly-snippets",
                },
            },
            { "rafamadriz/friendly-snippets" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
        },
        config = function()
            local lsp = require("lsp-zero")
            lsp.on_attach(function(client, bufnr)
                local opts = { buffer = bufnr, remap = false }
                vim.keymap.set("n", "gr", function()
                    vim.lsp.buf.references()
                end, vim.tbl_deep_extend("force", opts, { desc = "LSP Goto Reference" }))
                vim.keymap.set("n", "gd", function()
                    vim.lsp.buf.definition()
                end, vim.tbl_deep_extend("force", opts, { desc = "LSP Goto Definition" }))
                vim.keymap.set("n", "K", function()
                    vim.lsp.buf.hover()
                end, vim.tbl_deep_extend("force", opts, { desc = "LSP Hover" }))
                vim.keymap.set("n", "<leader>vws", function()
                    vim.lsp.buf.workspace_symbol()
                end, vim.tbl_deep_extend("force", opts, { desc = "LSP Workspace Symbol" }))
                vim.keymap.set("n", "<leader>vd", function()
                    vim.diagnostic.setloclist()
                end, vim.tbl_deep_extend("force", opts, { desc = "LSP Show Diagnostics" }))
                vim.keymap.set("n", "[d", function()
                    vim.diagnostic.goto_next()
                end, vim.tbl_deep_extend("force", opts, { desc = "Next Diagnostic" }))
                vim.keymap.set("n", "]d", function()
                    vim.diagnostic.goto_prev()
                end, vim.tbl_deep_extend("force", opts, { desc = "Previous Diagnostic" }))
                vim.keymap.set("n", "<leader>vca", function()
                    vim.lsp.buf.code_action()
                end, vim.tbl_deep_extend("force", opts, { desc = "LSP Code Action" }))
                vim.keymap.set("n", "<leader>vrr", function()
                    vim.lsp.buf.references()
                end, vim.tbl_deep_extend("force", opts, { desc = "LSP References" }))
                vim.keymap.set("n", "<leader>vrn", function()
                    vim.lsp.buf.rename()
                end, vim.tbl_deep_extend("force", opts, { desc = "LSP Rename" }))
                vim.keymap.set("i", "<C-h>", function()
                    vim.lsp.buf.signature_help()
                end, vim.tbl_deep_extend("force", opts, { desc = "LSP Signature Help" }))
            end)
            require("mason").setup({
                ensure_installed = {
                    "stylua",
                    "prettierd",
                },
            })
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "clangd",
                    "cssls",
                    "eslint",
                    "html",
                    "jdtls",
                    "lua_ls",
                    "omnisharp",
                    "svelte",
                    "tailwindcss",
                    "tsserver",
                    "zls",
                },
                handlers = {
                    lsp.default_setup,
                    lua_ls = function()
                        local lua_opts = lsp.nvim_lua_ls()
                        require("lspconfig").lua_ls.setup(lua_opts)
                    end,
                },
            })

            local cmp_action = require("lsp-zero").cmp_action()
            local cmp = require("cmp")
            local cmp_select = { behavior = cmp.SelectBehavior.Select }
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                sources = {
                    { name = "nvim_lsp" },
                    { name = "luasnip", keyword_length = 2 },
                    { name = "buffer",  keyword_length = 3 },
                    { name = "path" },
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-f>"] = cmp_action.luasnip_jump_forward(),
                    ["<C-b>"] = cmp_action.luasnip_jump_backward(),
                    ["<Tab>"] = cmp_action.luasnip_supertab(),
                    ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
                }),
            })
        end,
    },
}
