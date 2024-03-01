return {
        "nvim-tree/nvim-tree.lua",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require'nvim-tree'.setup {}
            require'mappings.nvim-tree-mappings'.setup()
        end,
    }
