vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use "neovim/nvim-lspconfig" -- enable LSP
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use { "ellisonleao/glow.nvim", config = function() require("glow").setup() end }
    use "nvim-lua/plenary.nvim"
    -- Autocompletion
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'saadparwaiz1/cmp_luasnip'
    use 'hrsh7th/cmp-nvim-lua'

    -- Snippets
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'

    -- JDLTS
    use 'eclipse/eclipse.jdt.ls'
    use 'mfussenegger/nvim-jdtls'

    -- Catpuccinuse
    use { "catppuccin/nvim", as = "catppuccin" }
end)
