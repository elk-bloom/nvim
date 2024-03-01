return {
    "akinsho/toggleterm.nvim",
    config = function()
        require 'toggleterm'.setup {
            open_mapping = [[<C-\>]],
        }
        require 'mappings.toggleterm-mappings'.setup()
    end,
}
