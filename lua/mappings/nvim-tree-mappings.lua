local M = {}

function M.setup()
    local wk = require("which-key")
    local mappings = {
        ["<leader>"] = {
            e = { "<cmd>NvimTreeFocus<cr>", "NvimTreeFocus" },
            p = { "<cmd>NvimTreeFindFile<cr>", "NvimTreeFindFile" },
        },
        ["<C-m>"] = {"<cmd>NvimTreeToggle<cr>", "NvimTreeToggle"},
    }

    wk.register(mappings)
end

return M
