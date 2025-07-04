local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function( ) vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

local words = {}

for word in io.open(vim.fn.stdpath("config") .. "/spell/en.utf-8.add", "r"):lines() do
    table.insert(words, word)
end

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'ts_ls','omnisharp', 'pyright', 'eslint', "marksman", "ltex", "texlab","jedi_language_server", "hls", "clangd"
    },

    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end,
        rust_analyzer = function()
            return true
        end,
        pyright = function()
            require("lspconfig").pyright.setup {
                handlers = handlers,
                capabilities = capabilities,
                on_attach = function(client, bufnr)
                    client.server_capabilities.hoverProvider = false
                    client.server_capabilities.signature_help = false
                end
            }   
        end,
        ltex = function()
            require('lspconfig').ltex.setup {
                settings = {
                    ltex = {
                        language = 'en-GB',
                        completionEnabled = true,
                        dictionary = {
                            ['en-US'] = words,
                            ['en-GB'] = words,
                        },
                        enabled = {'latex', 'tex', 'bib', 'markdown'},
                        language = 'en-GB',
                        diagnosticSeverity = 'information',
                        setenceCacheSize = 2000,
                        additionalRules = {enablePickyRules = true, motherTongue = 'en-GB'},
                        trace = {server = 'verbose'},
                        disabledRules = {['en-GB'] = {'OXFORD_SPELLING_Z_NOT_S'}},
                        hiddenFalsePositives = {}
                    },
                },
            }
        end,
        texlab = function()
            require('lspconfig').texlab.setup {}
        end,
    },
})


require('mason-tool-installer').setup({
    ensure_installed = {
        'clang-format',
    }
})

require('mason-nvim-dap').setup({
    handlers = {},
    ensure_installed = {
        'codelldb'
    },
    automatic_installation = true,
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

-- this is the function that loads the extra snippets to luasnip
-- from rafamadriz/friendly-snippets
require('luasnip.loaders.from_vscode').lazy_load()
local compare = cmp.config.compare

cmp.setup({
    sources = {
        {name = 'path'},
        {name = 'nvim_lsp'},
        {name = 'nvim_lua'},
        {name = 'luasnip', keyword_length = 2},
        {name = 'buffer', keyword_length = 3},
    },
    formatting = lsp_zero.cmp_format(),
    mapping = cmp.mapping.preset.insert({
        -- ["<CR>"] = cmp.mapping.confirm({ select = true }),
        -- ["<Tab>"] = cmp.mapping(function(fallback)
            --     if cmp.visible() then
            --         cmp.select_next_item()
            --     elseif luasnip.expand_or_jumpable() then
            --         luasnip.expand_or_jump()
            --     elseif has_words_before() then
            --         cmp.complete()
            --     else
            --         fallback()
            --     end
            -- end, { "i", "s" }),
            -- ["<S-Tab>"] = cmp.mapapping(function(fallback)ping(function(fallback)
                --     if cmp.visible() then
                --         cmp.select_prev_item()
                --     elseif luasnip.jumpable(-1) then
                --         luasnip.jump(-1)
                --     else
                --         fallback()
                --     end
                -- end, { "i", "s" }),
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ['<C-Space>'] = cmp.mapping.complete(),
            }),
            snippet = {
                expand = function(args)
                    local luasnip = require("luasnip")
                    if not luasnip then
                        return
                    end
                    luasnip.lsp_expand(args.body)
                end,
            },
        })

