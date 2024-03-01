return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require 'bufferline'.setup {}
        require 'mappings.bufferline-mappings'.setup()
    end,
}
