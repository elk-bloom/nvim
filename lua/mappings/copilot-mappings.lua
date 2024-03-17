local M = {}

function M.setup()
    local wk = require("which-key")

    local function toggleCopilot()
        vim.b.copilot_enabled = vim.b.copilot_enabled == nil or vim.b.copilot_enabled
        vim.b.copilot_enabled = not vim.b.copilot_enabled
    end

    local normal_mappings = {
        ["<leader>c"] = {
            o = { toggleCopilot, "Toggle b:copilot_enabled" },
        },
    }

    local insert_mappings = {
        ["<C-BS>"] = { "<Plug>(copilot-dismiss)", "Dismiss suggestion" },
        ["<C-Down>"] = { "<Plug>(copilot-next)", "Cycle to the next suggesiton" },
        ["<C-Up>"] = { "<Plug>(copilot-previous)", "Cycle to the previous suggestion" },
        ["<C-\\>"] = { "<Plug>(copilot-suggest)", "Request suggestion explicitly" },
        ["<C-Right>"] = { "<Plug>(copilot-accept-word)", "Accept word" },
        ["<C-Left>"] = { "<Plug>(copilot-accept-line)", "Accept line" },
    }

    wk.register(normal_mappings)
    wk.register(insert_mappings, { mode = "i" })
end

return M

