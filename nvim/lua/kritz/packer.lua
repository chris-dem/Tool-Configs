-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd("colorscheme rose-pine")
        end
    })

    use("nvim-lua/plenary.nvim") -- don't forget to add this one if you don't have it yet!bla
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { {"nvim-lua/plenary.nvim"} }
    }

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use('neovim/nvim-lspconfig')
    use('williamboman/mason.nvim')
    use('williamboman/mason-lspconfig.nvim')
    use('hrsh7th/nvim-cmp')
    use('hrsh7th/cmp-nvim-lsp')
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/cmp-path')
    use('saadparwaiz1/cmp_luasnip')
    use('hrsh7th/cmp-nvim-lua')
    use('L3MON4D3/LuaSnip')
    use('rafamadriz/friendly-snippets')

    use('vonheikemen/lsp-zero.nvim')
    use({
        "mg979/vim-visual-multi",
        branch = "master",
    })
    use('m4xshen/autoclose.nvim')
    use({
        "nvim-tree/nvim-tree.lua",
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        }
    })
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use('OmniSharp/omnisharp-vim')
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
    use('pbrisbin/vim-mkdir')
    use('godlygeek/tabular')
    use "lukas-reineke/indent-blankline.nvim"
    use({
        "nvimtools/none-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    })
    use 'vimjas/vim-python-pep8-indent'
    use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}
    use({
        "epwalsh/obsidian.nvim",
        tag = "*",  -- recommended, use latest release instead of latest commit
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-treesitter/nvim-treesitter',
            'nvim-telescope/telescope.nvim',
            'hrsh7th/nvim-cmp',
        }
    })
    use({
        "NvChad/nvterm",
        init = function()
            require("core.utils").load_mappings "nvterm"
        end,
        config = function(_, opts)
            require("nvterm").setup(opts)
        end,
    })
    use "wfxr/minimap.vim"
    use({
        "NvChad/nvim-colorizer.lua",
        event = "User FilePost",
        config = function(_, opts)
            require("colorizer").setup(opts)

            -- execute colorizer as soon as possible
            vim.defer_fn(function()
                require("colorizer").attach_to_buffer(0)
            end, 0)
        end,
    })
    use 'f-person/git-blame.nvim'
    use({
        'Exafunction/codeium.vim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'hrsh7th/nvim-cmp',
        },
    })
    use {
        "ahmedkhalf/project.nvim",
    }
end)

