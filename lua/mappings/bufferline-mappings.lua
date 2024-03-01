-- This is a mapping file for bufferline
local M = {}

function M.setup()
    local wk = require("which-key")
    local mappings = {
        ["<leader>b"] = {
            name = "BufferLine",
            p = { "<Cmd>BufferLineTogglePin<CR>", "Toggle pin" },
            P = { "<Cmd>BufferLineGroupClose ungrouped<CR>", "Delete non-pinned buffers" },
            o = { "<Cmd>BufferLineCloseOthers<CR>", "Delete other buffers" },
            r = { "<Cmd>BufferLineCloseRight<CR>", "Delete buffers to the right" },
            l = { "<Cmd>BufferLineCloseLeft<CR>", "Delete buffers to the left" },
        },
        ["<S-h>"] = { "<cmd>BufferLineCyclePrev<cr>", "Prev buffer" },
        ["<S-l>"] = { "<cmd>BufferLineCycleNext<cr>", "Next buffer" },
        ["[b"] = { "<cmd>BufferLineCyclePrev<cr>", "Prev buffer" },
        ["]b"] = { "<cmd>BufferLineCycleNext<cr>", "Next buffer" },
    }

    wk.register(mappings)
end

return M
